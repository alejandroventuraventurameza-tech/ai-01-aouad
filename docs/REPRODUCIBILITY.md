# Reproducibility and final evidence ledger (draft submission)

**Repository:** [ai-01-aouad](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad)  
**Branch:** work/repository1-proposition21-audit; **PR:** [#1](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/pull/1) (draft).  
**Article:** arXiv:2605.11350v1 is the original August class assignment; v2 (October 2026) is distinguished for research extension claims.

## Source and build evidence

- Formal package: Lean 4.34.0, Mathlib v4.34.0 in lean-toolchain and lakefile.toml.
- Original conditional optimizer lemmas: [Lean #44970575150](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970575150) (success).
- Jensen derivative-free bridge: [Lean #44970882111](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970882111) (success).
- Compactness/greatest optimizer and real-limsup tail: [Lean #44972209796](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44972209796) (success).
- **Top-level Proposition 2.1 proof:** [Lean #44972813354](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44972813354), exact SHA 482c2cf9291fa5b626ccf7a17660804db18ac095 (success); **8,930 jobs**, **14 declarations axiom-audited**, only propext, Classical.choice, Quot.sound; no sorryAx.
- Original six-slide Beamer (source presentation.tex, compiled presentation.pdf): [PDF #44970668988](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970668988) (success). Its new PDF is distinct from the instructor template.
- Full proof reach and assumptions: [docs/LEAN_FORMAL_SCOPE.md](LEAN_FORMAL_SCOPE.md).

## Reproduction commands

From the repository root, after installing the pinned Lean toolchain and a TeX distribution:

~~~bash
lake update
lake exe cache get
lake build Aouad
latexmk -pdf -interaction=nonstopmode -halt-on-error presentation.tex
~~~

**Dependency lock verified:** The [new pinned CI #44973682156](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44973682156) completed successfully and subsequently committed the **exact manifest it used** on branch commit 501e25f4eb0278057b736cd0a517bb625729ceba. The tracked [lake-manifest.json](../lake-manifest.json) fixes nine package commits, including Mathlib at 5ed2965256430c3649e86755f9576b54eca72435. Future CI uses the committed manifest and only runs lake update if none is present.

**Structural release diagnostic:** [scripts/audit_submission.py](../scripts/audit_submission.py) checks file presence, raw prompt placeholder status, an original photo file, PDF header, Lean source and dependency lockfile; [GitHub Actions release audit](../.github/workflows/submission-audit.yml) prints warnings and uploads the structural JSON report. It is intentionally **non-blocking for a draft PR**; neither script nor CI can authenticate a student's handwriting or public-chat transcript. Originality needs human review.

## Non-formal obligations and release blockers

- **Required academic record:** [prompts.md](../prompts.md) now contains three relevant unpolished prompt/answer pairs from the student's pasted material; the [raw copy](RP3_INTERCAMBIOS_CRUDOS.md) preserves text-copy artifacts. The original confusion with `ai-project` and the correction are kept. Per the [course guide](https://github.com/alexanderquispe/AI-Econ-Modeling/blob/main/syllabus/repository-guide.md), the assignment asks for **used prompts and relevant raw responses**, not a verbatim export of all conversations. [RP4](RP4_CONVERSACION_EN_CURSO.md) is supplementary and ongoing. Authorship and fidelity of the pasted original still require human judgment; no instructor-template dialogue was represented as student-authored.
- **Handwritten derivation supplied:** the complete original 7-page [iPad PDF](../hand/Prop_2_1_notas_ipad.pdf) received on 22 November 2026 is preserved unmodified (SHA-256 `bbcbd5d77f29b0befba8bdc9f151b3cb5abe96bf325bffa2bbb63b522258ba86`; Git blob `203e242e516022b63bd857f743b01542af918022`), alongside handwritten-page images 4 and 5 in [hand/](../hand/). Acceptance of digital handwriting is for the instructor to judge.
- **Not certified:** dynamic paradoxes in Sections 3–5. The proof pertains to the static Section 2 only.
- **Submission:** PR remains draft. No merge to main and no course Issue #6 link comment until the authentic student evidence and final integrity checks are complete.

This is a **scientifically verified static core**, not yet a completed assignment submission.
