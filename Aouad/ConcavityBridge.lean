import Aouad.Proposition21

/-!
# From Jensen concavity to the right-tail inequality

This file derives a missing condition of the static optimization bridge
from the nonnegative-domain Jensen inequality. Existence of the global
maximizer from the paper's limsup assumption is still an independent gate.
-/

namespace Aouad

/-- Jensen-style concavity of a real function on the nonnegative line. -/
def JensenOnNonneg (f : ℝ → ℝ) : Prop :=
  ∀ (x y t : ℝ), 0 ≤ x → 0 ≤ y → 0 ≤ t → t ≤ 1 →
    (1 - t) * f x + t * f y ≤ f ((1 - t) * x + t * y)

/-- Subtracting a linear function preserves Jensen concavity. -/
theorem netOutput_jensen_of_production_jensen
    {p : ℝ → ℝ} {γ : ℝ} (hp : JensenOnNonneg p) :
    JensenOnNonneg (netOutput p γ) := by
  intro x y t hx hy ht0 ht1
  calc
    (1 - t) * netOutput p γ x + t * netOutput p γ y =
        (1 - t) * p x + t * p y -
          γ * ((1 - t) * x + t * y) := by
      unfold netOutput
      ring
    _ ≤ p ((1 - t) * x + t * y) -
          γ * ((1 - t) * x + t * y) :=
      sub_le_sub_right (hp x y t hx hy ht0 ht1) _
    _ = netOutput p γ ((1 - t) * x + t * y) := rfl

/--
A Jensen-concave function with a nonnegative global maximizer is
nonincreasing on the right of that maximizer. The argument is the exact
interior-versus-corner secant comparison, not a derivative calculation.
-/
theorem rightTail_antitone_of_jensen
    (f : ℝ → ℝ) (xStar : ℝ)
    (hx : 0 ≤ xStar)
    (hglobal : ∀ x : ℝ, 0 ≤ x → f x ≤ f xStar)
    (hj : JensenOnNonneg f)
    {b y : ℝ} (hxb : xStar ≤ b) (hby : b ≤ y) :
    f y ≤ f b := by
  by_cases hEq : b = y
  · subst y
    exact le_rfl
  have hby' : b < y := lt_of_le_of_ne hby hEq
  by_cases hb : b = xStar
  · subst b
    exact hglobal y (by linarith)
  have hxb' : xStar < b := lt_of_le_of_ne hxb (Ne.symm hb)
  have hden : 0 < y - xStar := by linarith
  let t : ℝ := (b - xStar) / (y - xStar)
  have ht0 : 0 < t := div_pos (by linarith) hden
  have ht1 : t < 1 := by
    dsimp [t]
    apply (div_lt_iff₀ hden).2
    linarith
  have hmid : (1 - t) * xStar + t * y = b := by
    have htden : t * (y - xStar) = b - xStar := by
      dsimp [t]
      field_simp [ne_of_gt hden] <;> ring
    calc
      (1 - t) * xStar + t * y = xStar + t * (y - xStar) := by ring
      _ = xStar + (b - xStar) := by rw [htden]
      _ = b := by ring
  have hy0 : 0 ≤ y := by linarith
  have hc := hj xStar y t hx hy0 (le_of_lt ht0) (le_of_lt ht1)
  rw [hmid] at hc
  have hmaxB := hglobal b (by linarith)
  have hmul : (1 - t) * f b ≤ (1 - t) * f xStar :=
    mul_le_mul_of_nonneg_left hmaxB (by linarith)
  have hprodLe : t * (f y - f b) ≤ 0 := by nlinarith [hc, hmul]
  by_contra hnot
  have hdiff : 0 < f y - f b :=
    sub_pos.mpr (lt_of_not_ge hnot)
  have hprodGt : 0 < t * (f y - f b) := mul_pos ht0 hdiff
  linarith

/--
Optimal effort under an explicit global maximizer and Jensen concavity
of production. The limsup-to-existence and greatest-argmax steps are still
not discharged by this theorem.
-/
theorem selectedEffort_optimal_from_jensen
    {p : ℝ → ℝ} {γ s a xStar : ℝ}
    (hs : 0 ≤ s) (ha : 0 ≤ a) (hx : 0 ≤ xStar)
    (hglobal : ∀ x : ℝ, 0 ≤ x →
      netOutput p γ x ≤ netOutput p γ xStar)
    (hp : JensenOnNonneg p)
    (e : ℝ) (he : 0 ≤ e) :
    p (s + a + e) - γ * e ≤
      p (s + a + selectedEffort xStar s a) -
        γ * selectedEffort xStar s a := by
  have htail : ∀ {x y : ℝ}, xStar ≤ x → x ≤ y →
      netOutput p γ y ≤ netOutput p γ x :=
    fun {x y} hxx hxy =>
      rightTail_antitone_of_jensen (netOutput p γ) xStar hx hglobal
        (netOutput_jensen_of_production_jensen hp) hxx hxy
  exact selectedEffort_optimal hs ha hglobal htail e he

end Aouad

#print axioms Aouad.netOutput_jensen_of_production_jensen
#print axioms Aouad.rightTail_antitone_of_jensen
#print axioms Aouad.selectedEffort_optimal_from_jensen
