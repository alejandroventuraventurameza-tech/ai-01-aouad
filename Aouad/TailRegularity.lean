import Aouad.GreatestMaximizer

/-!
# Strict tail from an eventual ratio gap and real-valued limsup

This module makes the analytic step toward the original paper explicit.
The real-valued Filter.limsup theorem carries a separate IsBoundedUnder
hypothesis, which we retain rather than silently assuming away.
The complete original assumptions will require discharging it.
-/

namespace Aouad

/--
If p(0) is nonnegative and p(x)/x is eventually strictly below gamma,
then p(x)-gamma*x eventually lies strictly below p(0).
-/
theorem strictTail_of_eventual_ratio_gap
    (p : ℝ → ℝ) (γ ε : ℝ)
    (hp0 : 0 ≤ p 0) (hε : 0 < ε)
    (hGap : ∀ᶠ x : ℝ in Filter.atTop, p x / x < γ - ε) :
    ∃ R : ℝ, 0 < R ∧
      ∀ x : ℝ, R ≤ x → netOutput p γ x < netOutput p γ 0 := by
  obtain ⟨B, hB⟩ := Filter.eventually_atTop.1 hGap
  refine ⟨max B 1, lt_of_lt_of_le zero_lt_one (le_max_right _ _), ?_⟩
  intro x hx
  have hxB : B ≤ x := (le_max_left B 1).trans hx
  have hx1 : 1 ≤ x := (le_max_right B 1).trans hx
  have hxpos : 0 < x := lt_of_lt_of_le zero_lt_one hx1
  have hr : p x / x < γ - ε := hB x hxB
  have hpx : p x < (γ - ε) * x := (div_lt_iff₀ hxpos).mp hr
  have hmul : 0 < ε * x := mul_pos hε hxpos
  unfold netOutput
  nlinarith

/--
An explicit limsup gap plus eventual upper-boundedness of the ratio
suffices for a greatest global maximizer. The boundedness premise is
exposed because Mathlib's real limsup is conditionally complete.
-/
theorem exists_greatest_global_maximizer_of_real_limsup
    (p : ℝ → ℝ) (γ : ℝ)
    (hp : Continuous p) (hp0 : 0 ≤ p 0)
    (hBound : (Filter.atTop : Filter ℝ).IsBoundedUnder (· ≤ ·)
       (fun x : ℝ => p x / x))
    (hLimsup : Filter.limsup (fun x : ℝ => p x / x)
       (Filter.atTop : Filter ℝ) < γ) :
    ∃ xStar : ℝ, 0 ≤ xStar ∧
      (∀ x : ℝ, 0 ≤ x → netOutput p γ x ≤ netOutput p γ xStar) ∧
      (∀ x : ℝ, 0 ≤ x → netOutput p γ x =
        netOutput p γ xStar → x ≤ xStar) := by
  let L : ℝ := Filter.limsup (fun x : ℝ => p x / x)
    (Filter.atTop : Filter ℝ)
  let ε : ℝ := (γ - L) / 2
  have hε : 0 < ε := by
    dsimp [ε]
    linarith [hLimsup]
  have hGapLimit : L < γ - ε := by
    dsimp [ε]
    linarith [hLimsup]
  have hEvt : ∀ᶠ x : ℝ in Filter.atTop, p x / x < γ - ε :=
    Filter.eventually_lt_of_limsup_lt hGapLimit hBound
  obtain ⟨R, hR, hTail⟩ :=
    strictTail_of_eventual_ratio_gap p γ ε hp0 hε hEvt
  have hf : Continuous (netOutput p γ) := by
    unfold netOutput
    fun_prop
  exact exists_greatest_global_maximizer_of_strict_tail
    (netOutput p γ) hf R hR hTail

end Aouad

#print axioms Aouad.strictTail_of_eventual_ratio_gap
#print axioms Aouad.exists_greatest_global_maximizer_of_real_limsup
