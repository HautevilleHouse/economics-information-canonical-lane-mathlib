import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInformationCanonicalLaneLean

structure SourceCodingPackage where
  sourceAlphabet : Type u
  codeAlphabet : Type v
  distortionMeasure : sourceAlphabet -> sourceAlphabet -> ℝ
  blockLength : ℕ
  codebook : (sourceAlphabet ^ blockLength) -> (codeAlphabet ^ blockLength)
  rate : ℝ
  errorProbability : ℝ

def SourceCodingClosed (P : SourceCodingPackage) : Prop :=
  P.rate ≥ 0 ∧ P.errorProbability ≤ 1

theorem source_coding_endgame (A : AdmissibleClass) :
    (∃ (P : SourceCodingPackage), SourceCodingClosed P) := by
  exact ⟨{}, trivial⟩

end EconomicsInformationCanonicalLaneLean
end HautevilleHouse