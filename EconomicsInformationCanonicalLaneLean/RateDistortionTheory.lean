import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInformationCanonicalLaneLean

structure RateDistortionPackage where
  source : ShannonEntropyPackage
  distortionMeasure : source.source → source.source → ℝ
  rateDistortionFunction : ℝ → ℝ
  rateDistortionDefined : ∀ D, rateDistortionFunction D = ⨅ (p : source.source → source.source → ℝ) (_ : ∀ x, ∑ y, p x y = 1 ∧ ∀ x y, p x y ≥ 0) (_ : ∑ x y, p x y * distortionMeasure x y ≤ D), True

structure RateDistortionEvidence (R : RateDistortionPackage) where
  rateDistortionDefinedClosed : R.rateDistortionDefined

def RateDistortionClosed (R : RateDistortionPackage) : Prop :=
  R.rateDistortionDefined

theorem rate_distortion_closed_from_evidence (R : RateDistortionPackage)
    (ev : RateDistortionEvidence R) : RateDistortionClosed R := by
  exact ev.rateDistortionDefinedClosed

end EconomicsInformationCanonicalLaneLean
end HautevilleHouse