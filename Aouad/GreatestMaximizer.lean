import Aouad.ConcavityBridge

/-!
# Attainment and largest-selection gate for the Section 2 static model

Under a continuous objective whose right tail lies strictly below its
value at zero, the maximizer set on the nonnegative line is nonempty,
bounded and has a greatest element. This proof uses compactness and
contains no differentiability assumption.

This is NOT YET the direct Lean translation of the paper's limsup
regularity condition; a bridge to that analytic condition is separate.
-/

namespace Aouad

/--
A continuous real objective has a *greatest global maximizer* on the
nonnegative axis if it eventually lies strictly below its value at zero.
The largest-maximizer tie-break is proved, not assumed.
-/
theorem exists_greatest_global_maximizer_of_strict_tail
    (f : ℝ → ℝ) (hf : Continuous f)
    (R : ℝ) (hR : 0 < R)
    (hTail : ∀ x : ℝ, R ≤ x → f x < f 0) :
    ∃ xStar : ℝ, 0 ≤ xStar ∧
      (∀ x : ℝ, 0 ≤ x → f x ≤ f xStar) ∧
      (∀ x : ℝ, 0 ≤ x → f x = f xStar → x ≤ xStar) := by
  have hNonempty : (Set.Icc (0 : ℝ) R).Nonempty := by
    refine ⟨0, ?_⟩
    exact ⟨le_rfl, le_of_lt hR⟩
  obtain ⟨x0, hx0, hmax0⟩ :=
    isCompact_Icc.exists_isMaxOn hNonempty hf.continuousOn
  let s : Set ℝ := {x | x ∈ Set.Icc 0 R ∧ f x = f x0}
  have hsClosed : IsClosed s := by
    have h : IsClosed (Set.Icc (0 : ℝ) R ∩ f ⁻¹' {f x0}) :=
      isClosed_Icc.inter (isClosed_singleton.preimage hf)
    simpa only [s, Set.inter_def, Set.preimage, Set.mem_singleton_iff] using h
  have hsCompact : IsCompact s :=
    isCompact_Icc.of_isClosed_subset hsClosed (by
      intro x hx
      exact hx.1)
  have hsNonempty : s.Nonempty := ⟨x0, hx0, rfl⟩
  obtain ⟨xStar, hxStar, hgreat⟩ :=
    hsCompact.exists_isMaxOn hsNonempty continuous_id.continuousOn
  have hZeroMax : f 0 ≤ f x0 := hmax0 0 ⟨le_rfl, le_of_lt hR⟩
  have hAll (x : ℝ) (hx : 0 ≤ x) : f x ≤ f x0 := by
    by_cases hXR : x ≤ R
    · exact hmax0 x ⟨hx, hXR⟩
    · have hRX : R ≤ x := le_of_lt (lt_of_not_ge hXR)
      exact (hTail x hRX).le.trans hZeroMax
  refine ⟨xStar, hxStar.1.1, ?_, ?_⟩
  · intro x hx
    rw [hxStar.2]
    exact hAll x hx
  · intro x hx hEq
    have hxR : x ≤ R := by
      by_contra h
      have hrx : R ≤ x := le_of_lt (lt_of_not_ge h)
      have hbad : f x < f 0 := hTail x hrx
      rw [hEq, hxStar.2] at hbad
      exact (not_lt_of_ge hZeroMax) hbad
    have hmem : x ∈ s := ⟨⟨hx, hxR⟩, by
      rw [hEq, hxStar.2]⟩
    simpa only [id_eq] using hgreat x hmem

end Aouad

#print axioms Aouad.exists_greatest_global_maximizer_of_strict_tail
