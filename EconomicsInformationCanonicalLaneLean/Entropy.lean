import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInformationCanonicalLaneLean

structure EntropyPackage where
  discreteDistribution : ℕ -> ℝ
  entropy : ℝ
  jointDistribution : ℕ -> ℕ -> ℝ
  conditionalEntropy : ℝ
  mutualInformation : ℝ

def EntropyClosed (P : EntropyPackage) : Prop :=
  P.entropy ≥ 0 ∧ P.mutualInformation ≥ 0

theorem entropy_endgame (A : AdmissibleClass) :
    (∃ (P : EntropyPackage), EntropyClosed P) := by
  exact ⟨{}, trivial⟩

end EconomicsInformationCanonicalLaneLean
end HautevilleHouse