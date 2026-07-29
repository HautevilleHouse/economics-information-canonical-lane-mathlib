import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInformationCanonicalLaneLean

structure EntropyFunctionalPackage where
  distribution : Type u -> Type v
  domain : Type u
  measure : domain -> ℝ
  entropy : ℝ
  jointEntropy : ℝ
  conditionalEntropy : ℝ
  mutualInformation : ℝ
  entropyProperties : Prop

structure EntropyFunctionalEvidence (E : EntropyFunctionalPackage) where
  entropyPropertiesClosed : E.entropyProperties

def EntropyFunctionalClosed (E : EntropyFunctionalPackage) : Prop :=
  E.entropyProperties

theorem entropy_functional_closed_from_evidence (E : EntropyFunctionalPackage) (Ev : EntropyFunctionalEvidence E) :
    EntropyFunctionalClosed E := by
  exact Ev.entropyPropertiesClosed

end EconomicsInformationCanonicalLaneLean
end HautevilleHouse