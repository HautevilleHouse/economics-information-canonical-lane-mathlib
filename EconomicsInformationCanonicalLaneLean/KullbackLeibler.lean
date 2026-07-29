import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInformationCanonicalLaneLean

structure KullbackLeiblerPackage where
  distributionP : ℕ -> ℝ
  distributionQ : ℕ -> ℝ
  divergence : ℝ
  gibbsInequality : distributionP = distributionQ → divergence = 0
  positivity : divergence ≥ 0

structure KullbackLeiblerEvidence (P : KullbackLeiblerPackage) where
  gibbsInequalityClosed : ∀ (h : P.distributionP = P.distributionQ), P.divergence = 0
  positivityClosed : P.divergence ≥ 0

def KullbackLeiblerClosed (P : KullbackLeiblerPackage) : Prop :=
  (∀ (h : P.distributionP = P.distributionQ), P.divergence = 0) ∧ P.divergence ≥ 0

theorem kullback_leibler_closed_from_evidence (P : KullbackLeiblerPackage) (E : KullbackLeiblerEvidence P) : KullbackLeiblerClosed P := by
  exact And.intro E.gibbsInequalityClosed E.positivityClosed

end EconomicsInformationCanonicalLaneLean
end HautevilleHouse