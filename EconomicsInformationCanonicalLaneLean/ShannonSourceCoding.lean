import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInformationCanonicalLaneLean

structure SourceCodingPackage where
  alphabet : Type u
  sourceDistribution : alphabet -> ℝ
  blockLength : ℕ
  codebook : Type v
  encoding : alphabet ^ blockLength -> codebook
  decoding : codebook -> alphabet ^ blockLength
  errorProbability : ℝ
  rate : ℝ

def SourceCodingClosed (P : SourceCodingPackage) : Prop :=
  P.errorProbability < 1 ∧ P.rate > 0

end EconomicsInformationCanonicalLaneLean
end HautevilleHouse