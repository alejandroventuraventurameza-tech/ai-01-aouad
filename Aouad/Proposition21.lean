import Mathlib

/-!
# Aouad--Lykouris--Zhong, Section 2: a conditional Lean bridge

The exact Proposition 2.1 additionally requires (i) proving the global-maximizer
and right-tail premises from concavity and the paper's tail-regularity condition,
and (ii) the largest-argmax tie break. Those bridges are NOT asserted here.

No claim about Sections 3--5 is made. This file deliberately proves only an
explicitly conditional optimization lemma and a gross-output identity.
-/

namespace Aouad

noncomputable def netOutput (p : ℝ → ℝ) (γ x : ℝ) : ℝ :=
  p x - γ * x

noncomputable def selectedEffort (xStar s a : ℝ) : ℝ :=
  max (xStar - (s + a)) 0

theorem selectedEffort_nonneg (xStar s a : ℝ) :
    0 ≤ selectedEffort xStar s a := by
  unfold selectedEffort
  exact le_max_right _ _

/--
Conditional optimization: if the candidate xStar is a global net-output
maximizer and net output is nonincreasing on its right tail, the proposed
effort maximizes current utility among all nonnegative efforts.

This proof does NOT derive the premises from concavity; see the audit ledger.
-/
theorem selectedEffort_optimal
    {p : ℝ → ℝ} {γ s a xStar : ℝ}
    (hs : 0 ≤ s) (ha : 0 ≤ a)
    (hglobal : ∀ x : ℝ, 0 ≤ x →
      netOutput p γ x ≤ netOutput p γ xStar)
    (htail : ∀ {x y : ℝ}, xStar ≤ x → x ≤ y →
      netOutput p γ y ≤ netOutput p γ x)
    (e : ℝ) (he : 0 ≤ e) :
    p (s + a + e) - γ * e ≤
      p (s + a + selectedEffort xStar s a) -
        γ * selectedEffort xStar s a := by
  have hx0 : 0 ≤ s + a + e := by linarith
  have hid (t : ℝ) :
      p (s + a + t) - γ * t =
        netOutput p γ (s + a + t) + γ * (s + a) := by
    unfold netOutput
    ring
  rw [hid e, hid (selectedEffort xStar s a)]
  suffices h :
      netOutput p γ (s + a + e) ≤
        netOutput p γ (s + a + selectedEffort xStar s a) by
    linarith
  by_cases hb : s + a ≤ xStar
  · have hsel :
        selectedEffort xStar s a = xStar - (s + a) := by
      unfold selectedEffort
      exact max_eq_left (sub_nonneg.mpr hb)
    rw [hsel]
    have heq : s + a + (xStar - (s + a)) = xStar := by ring
    rw [heq]
    exact hglobal (s + a + e) hx0
  · have hgt : xStar < s + a := lt_of_not_ge hb
    have hsel : selectedEffort xStar s a = 0 := by
      unfold selectedEffort
      apply max_eq_right
      linarith
    rw [hsel]
    simp only [add_zero]
    exact htail (le_of_lt hgt) (by linarith)

/--
Gross-output identity given the selected effort and p monotone
on the nonnegative domain. It is not an equality for net utility.
-/
theorem selectedEffort_grossOutput
    {p : ℝ → ℝ} {s a xStar : ℝ}
    (hs : 0 ≤ s) (ha : 0 ≤ a) (hx : 0 ≤ xStar)
    (hp : ∀ x y : ℝ, 0 ≤ x → x ≤ y → p x ≤ p y) :
    p (s + a + selectedEffort xStar s a) =
      max (p xStar) (p (s + a)) := by
  by_cases hb : s + a ≤ xStar
  · have hsel :
        selectedEffort xStar s a = xStar - (s + a) := by
      unfold selectedEffort
      exact max_eq_left (sub_nonneg.mpr hb)
    have heq : s + a + selectedEffort xStar s a = xStar := by
      rw [hsel]
      ring
    rw [heq]
    exact (max_eq_left (hp (s + a) xStar (by linarith) hb)).symm
  · have hgt : xStar < s + a := lt_of_not_ge hb
    have hsel : selectedEffort xStar s a = 0 := by
      unfold selectedEffort
      apply max_eq_right
      linarith
    rw [hsel]
    simp only [add_zero]
    exact (max_eq_right (hp xStar (s + a) hx (le_of_lt hgt))).symm

end Aouad

#print axioms Aouad.selectedEffort_nonneg
#print axioms Aouad.selectedEffort_optimal
#print axioms Aouad.selectedEffort_grossOutput
