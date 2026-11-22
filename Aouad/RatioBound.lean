import Aouad.TailRegularity

/-!
# Closing the real-valued limsup boundedness gap from Jensen concavity

Together with the greatest-maximizer, ratio-tail, conditional-effort
and gross-output theorems, this reconstructs Section 2 without using
a derivative. All declarations require their own pinned kernel audit.
-/

namespace Aouad

/-- Jensen concavity and nonnegative p(0) eventually bound p(x)/x above. -/
theorem ratio_isBoundedUnder_of_jensen
    (p : ℝ → ℝ) (hp0 : 0 ≤ p 0) (hp : JensenOnNonneg p) :
    (Filter.atTop : Filter ℝ).IsBoundedUnder (· ≤ ·)
      (fun x : ℝ => p x / x) := by
  refine ⟨p 1, Filter.eventually_atTop.2 ⟨1, ?_⟩⟩
  intro x hx
  have hxpos : 0 < x := lt_of_lt_of_le zero_lt_one hx
  have ht0 : 0 ≤ (1 / x : ℝ) := div_nonneg (by norm_num) hxpos.le
  have ht1 : (1 / x : ℝ) ≤ 1 :=
    (div_le_iff₀ hxpos).2 (by linarith)
  have hrep : (1 - (1 / x : ℝ)) * 0 + (1 / x) * x = (1 : ℝ) := by
    field_simp [ne_of_gt hxpos] <;> ring
  have hJ := hp 0 x (1 / x) (le_refl 0) hxpos.le ht0 ht1
  rw [hrep] at hJ
  have hnonneg : 0 ≤ (1 - (1 / x : ℝ)) * p 0 :=
    mul_nonneg (sub_nonneg.mpr ht1) hp0
  have hdiv : p x / x = (1 / x) * p x := by ring
  rw [hdiv]
  linarith

/--
A source-level Section 2 reconstruction: given continuity, concavity
and monotone production, and the limsup gap, there is a *largest*
global net-output maximizer; its positive-part effort choice is optimal
and its gross output obeys the formula in Proposition 2.1.
-/
theorem proposition21_from_limsup_and_jensen
    (p : ℝ → ℝ) (γ : ℝ)
    (hpCont : Continuous p) (hp0 : 0 ≤ p 0)
    (hpJ : JensenOnNonneg p)
    (hpMono : ∀ x y : ℝ, 0 ≤ x → x ≤ y → p x ≤ p y)
    (hLimsup : Filter.limsup (fun x : ℝ => p x / x)
       (Filter.atTop : Filter ℝ) < γ) :
    ∃ xStar : ℝ, 0 ≤ xStar ∧
      (∀ x : ℝ, 0 ≤ x → netOutput p γ x ≤ netOutput p γ xStar) ∧
      (∀ x : ℝ, 0 ≤ x → netOutput p γ x = netOutput p γ xStar → x ≤ xStar) ∧
      (∀ s a e : ℝ, 0 ≤ s → 0 ≤ a → 0 ≤ e →
        p (s + a + e) - γ * e ≤
          p (s + a + selectedEffort xStar s a) -
            γ * selectedEffort xStar s a) ∧
      (∀ s a : ℝ, 0 ≤ s → 0 ≤ a →
        p (s + a + selectedEffort xStar s a) =
          max (p xStar) (p (s + a))) := by
  obtain ⟨xStar, hxStar, hglobal, hgreat⟩ :=
    exists_greatest_global_maximizer_of_real_limsup p γ
      hpCont hp0 (ratio_isBoundedUnder_of_jensen p hp0 hpJ) hLimsup
  refine ⟨xStar, hxStar, hglobal, hgreat, ?_, ?_⟩
  · intro s a e hs ha he
    exact selectedEffort_optimal_from_jensen hs ha hxStar hglobal hpJ e he
  · intro s a hs ha
    exact selectedEffort_grossOutput hs ha hxStar hpMono

end Aouad

#print axioms Aouad.ratio_isBoundedUnder_of_jensen
#print axioms Aouad.proposition21_from_limsup_and_jensen
