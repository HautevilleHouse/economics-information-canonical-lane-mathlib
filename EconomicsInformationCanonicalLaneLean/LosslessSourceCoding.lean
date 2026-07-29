import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInformationCanonicalLaneLean

structure LosslessSourceCodingPackage where
  sourceAlphabet : Type u
  sourceDistribution : sourceAlphabet -> ℝ
  codeLengthFunction : sourceAlphabet -> ℕ
  expectedLength : ℝ
  optimalExpectedLength : ℝ
  optimalExpectedLengthExists : Prop
  lengthAchieved : Prop

structure LosslessSourceCodingEvidence (L : LosslessSourceCodingPackage) where
  optimalExpectedLengthExistsClosed : L.optimalExpectedLengthExists
  lengthAchievedClosed : L.lengthAchieved

def LosslessSourceCodingClosed (L : LosslessSourceCodingPackage) : Prop :=
  L.optimalExpectedLengthExists ∧ L.lengthAchieved

theorem lossless_source_coding_closed_from_evidence (L : LosslessSourceCodingPackage) (E : LosslessSourceCodingEvidence L) :
    LosslessSourceCodingClosed L := by
  exact And.intro E.optimalExpectedLengthExistsClosed E.lengthAchievedClosed

end EconomicsInformationCanonicalLaneLean
end HautevilleHouse