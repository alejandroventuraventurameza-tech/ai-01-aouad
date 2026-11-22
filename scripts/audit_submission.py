#!/usr/bin/env python3
"""Integrity-first structural check for course Issue #6.

This does NOT certify the academic authenticity of any image or transcript.
Usage: python3 scripts/audit_submission.py [--strict] [--json path]
"""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


def inspect(root: Path) -> dict:
    checks = {}

    def record(name: str, passed: bool, note: str) -> None:
        checks[name] = {"passed": bool(passed), "note": note}

    readme = root / "README.md"
    readme_text = readme.read_text(encoding="utf-8") if readme.exists() else ""
    record(
        "readme_model_and_proposition",
        bool(readme_text) and "Proposition 2.1" in readme_text
        and "limsup" in readme_text and "argmax" in readme_text,
        "README should identify question, agent choice, hypotheses, and tie-break.",
    )

    prompt_file = root / "prompts.md"
    prompt_text = prompt_file.read_text(encoding="utf-8") if prompt_file.exists() else ""
    # The official course guide requires the prompts USED and the RELEVANT
    # answers, raw; it does not require a complete account-wide ChatGPT export.
    # Source: syllabus/repository-guide.md, section 4, in course repository.
    raw_pair_count = prompt_text.count("## Intercambio ")
    raw_discussion_present = (
        len(prompt_text) > 2500
        and raw_pair_count >= 3
        and prompt_text.count("### Usuario") >= 5
        and prompt_text.count("### Asistente") >= 5
        and "Aquí está hecho desde mi ipad" in prompt_text
        and "Revisión de la nueva versión" in prompt_text
        and "Ok, incorporalo." in prompt_text
        and "~~~text" in prompt_text
    )
    record(
        "relevant_raw_dialogue_present_for_review",
        raw_discussion_present,
        "Structural presence of three student-supplied prompt/response pairs. "
        "The guide requires relevant raw exchanges, not an exhaustive chat export. "
        "A human must compare this copied text with the original when possible.",
    )
    rp4_path = root / "docs" / "RP4_CONVERSACION_EN_CURSO.md"
    rp4_text = rp4_path.read_text(encoding="utf-8") if rp4_path.exists() else ""
    record(
        "rp4_conversation_material_present_for_review",
        "Sigue el chat de RP3" in rp4_text and "Recuerda que tenemos que incorporar este chat" in rp4_text,
        "Ongoing RP4 is recorded separately as additional provenance; "
        "it is not represented as a full verbatim chat export.",
    )

    hand_dir = root / "hand"
    photos = []
    if hand_dir.is_dir():
        photos = sorted(
            p.relative_to(root).as_posix() for p in hand_dir.iterdir()
            if p.is_file()
            and p.suffix.lower() in {".jpg", ".jpeg", ".png", ".heic", ".webp"}
            and p.stat().st_size > 1000
        )
    record(
        "handwritten_photo_present_for_human_review",
        bool(photos),
        "Course requires a genuine student-authored photo; file presence alone cannot authenticate it. "
        + ("Found: " + ", ".join(photos) if photos else "No photo found."),
    )

    tex = root / "presentation.tex"
    pdf = root / "presentation.pdf"
    pdf_valid = (
        pdf.is_file()
        and pdf.stat().st_size > 1000
        and pdf.open("rb").read(5) == b"%PDF-"
    )
    record("beamer_source", tex.is_file() and tex.stat().st_size > 200, "Original Beamer source required.")
    record("beamer_pdf", pdf_valid, "PDF signature and nontrivial size; CI must separately rebuild it.")

    source = root / "Aouad" / "RatioBound.lean"
    record(
        "formal_source",
        source.is_file() and "proposition21_from_limsup_and_jensen" in
        (source.read_text(encoding="utf-8") if source.is_file() else ""),
        "Code presence is not Lean kernel verification; see GitHub Actions logs and exact SHA.",
    )

    manifest = root / "lake-manifest.json"
    locked = False
    lock_note = "Missing dependency lockfile."
    if manifest.is_file():
        try:
            data = json.loads(manifest.read_text(encoding="utf-8"))
            packages = data.get("packages", [])
            locked = isinstance(packages, list) and any(
                str(p.get("name", "")).lower() == "mathlib"
                for p in packages if isinstance(p, dict)
            )
            lock_note = (
                "Found " + str(len(packages)) + " resolved package entries"
                if locked else "Lockfile lacks a recognisable Mathlib package."
            )
        except (OSError, ValueError, TypeError) as exc:
            lock_note = "Unparseable dependency lockfile: " + str(exc)
    record("lake_lockfile", locked, lock_note)

    hashes = {}
    for name in ["presentation.tex", "presentation.pdf", "Aouad/RatioBound.lean", "lake-manifest.json"]:
        path = root / name
        if path.is_file():
            hashes[name] = hashlib.sha256(path.read_bytes()).hexdigest()

    return {
        "course_issue": "https://github.com/alexanderquispe/AI-Econ-Modeling/issues/6",
        "checks": checks,
        "automated_checks_pass": all(entry["passed"] for entry in checks.values()),
        "academic_authenticity_verified": False,
        "academic_authenticity_warning": (
            "Human review of original handwriting and raw prompts is mandatory. "
            "This script cannot verify authorship, originality, or an actual oral rehearsal."
        ),
        "sha256": hashes,
    }


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    ap.add_argument("--json", type=Path, help="Write machine-readable report")
    ap.add_argument("--strict", action="store_true", help="Exit 1 if a structural gate fails")
    args = ap.parse_args()
    report = inspect(args.root.resolve())
    if args.json:
        args.json.parent.mkdir(parents=True, exist_ok=True)
        args.json.write_text(json.dumps(report, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print("Issue #6 — structural delivery audit")
    for name, result in report["checks"].items():
        status = "PASS" if result["passed"] else "MISSING"
        print(f"[{status}] {name}: {result['note']}")
    print("Human authenticity review: REQUIRED, NEVER AUTOMATICALLY CERTIFIED")
    return int(args.strict and not report["automated_checks_pass"])


if __name__ == "__main__":
    raise SystemExit(main())
