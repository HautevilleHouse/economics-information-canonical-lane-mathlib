import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInformationCanonicalLaneLean

structure RateDistortionPackage where
  sourceDistribution : Type u → ℝ
  distortionMeasure : Type u → Type v → ℝ
  rate : ℝ
  distortion : ℝ
  optimal : Prop

structure RateDistortionEvidence (R : RateDistortionPackage) where
  ratePositive : R.rate ≥ 0
  distortionFinite : R.distortion < ∞
  optimalAchieved : R.optimal

def RateDistortionClosed (R : RateDistortionPackage) : Prop :=
  R.rate ≥ 0 ∧ R.distortion < ∞ ∧ R.optimal

theorem rate_distortion_closed_from_evidence (R : RateDistortionPackage) (E : RateDistortionEvidence R) :
    RateDistortionClosed R := by
  exact And.intro E.ratePositive (And.intro E.distortionFinite E.optimalAchieved)

end EconomicsInformationCanonicalLaneLean
end HautevilleHouse
