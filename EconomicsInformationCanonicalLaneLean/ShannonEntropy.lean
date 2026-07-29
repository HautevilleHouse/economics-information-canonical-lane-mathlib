import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInformationCanonicalLaneLean

structure ShannonEntropyPackage where
  sourceAlphabet : Type u
  distribution : sourceAlphabet → ℝ
  entropy : ℝ
  entropyDefined : Prop
  entropyNonnegative : entropy ≥ 0
  entropyMaximizedForUniform : Prop
  entropyMinimizedForDeterministic : entropy = 0

structure ShannonEntropyEvidence (E : ShannonEntropyPackage) where
  entropyDefinedClosed : E.entropyDefined
  entropyNonnegativeClosed : E.entropyNonnegative
  entropyMaximizedForUniformClosed : E.entropyMaximizedForUniform
  entropyMinimizedForDeterministicClosed : E.entropyMinimizedForDeterministic

def ShannonEntropyClosed (E : ShannonEntropyPackage) : Prop :=
  E.entropyDefined ∧ E.entropyNonnegative ∧ E.entropyMaximizedForUniform ∧ E.entropyMinimizedForDeterministic

theorem shannon_entropy_closed_from_evidence (E : ShannonEntropyPackage) (Ev : ShannonEntropyEvidence E) :
    ShannonEntropyClosed E := by
  exact And.intro Ev.entropyDefinedClosed
    (And.intro Ev.entropyNonnegativeClosed
      (And.intro Ev.entropyMaximizedForUniformClosed Ev.entropyMinimizedForDeterministicClosed))

end EconomicsInformationCanonicalLaneLean
end HautevilleHouse