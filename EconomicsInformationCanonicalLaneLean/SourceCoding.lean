import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInformationCanonicalLaneLean

structure SourceCodingPackage where
  sourceEntropy : ℝ
  codeRate : ℝ
  errorProbability : ℝ
  blockLength : ℕ
  messageSet : Type u
  encodingMap : messageSet → List (Bit 0)
  decodingMap : List (Bit 0) → messageSet
  averageError : ℝ
  
structure SourceCodingEvidence (S : SourceCodingPackage) where
  sourceEntropyFinite : S.sourceEntropy < ∞
  rateAboveEntropy : S.codeRate > S.sourceEntropy
  errorTendsToZero : S.averageError = 0

def SourceCodingClosed (S : SourceCodingPackage) : Prop :=
  S.sourceEntropy < ∞ ∧ S.codeRate > S.sourceEntropy ∧ S.averageError = 0

theorem source_coding_closed_from_evidence (S : SourceCodingPackage) (E : SourceCodingEvidence S) :
    SourceCodingClosed S := by
  exact And.intro E.sourceEntropyFinite (And.intro E.rateAboveEntropy E.errorTendsToZero)

end EconomicsInformationCanonicalLaneLean
end HautevilleHouse
