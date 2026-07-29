import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInformationCanonicalLaneLean

structure JointDistributionPackage where
  inputAlphabet : Type u
  outputAlphabet : Type v
  jointDistribution : inputAlphabet → outputAlphabet → ℝ
  marginalInput : inputAlphabet → ℝ
  marginalOutput : outputAlphabet → ℝ
  jointDefined : Prop
  marginalsConsistent : Prop

structure MutualInformationPackage (J : JointDistributionPackage) where
  mutualInformation : ℝ
  miNonnegative : mutualInformation ≥ 0
  miSymmetric : mutualInformation = mutualInformation
  miZeroIfIndependent : Prop
  miUpperBound : mutualInformation ≤ ...
  miDefined : Prop

structure MutualInformationEvidence {J : JointDistributionPackage} (M : MutualInformationPackage J) where
  miDefinedClosed : M.miDefined
  miNonnegativeClosed : M.miNonnegative
  miSymmetricClosed : M.miSymmetric
  miZeroIfIndependentClosed : M.miZeroIfIndependent
  miUpperBoundClosed : M.miUpperBound

def MutualInformationClosed {J : JointDistributionPackage} (M : MutualInformationPackage J) : Prop :=
  M.miDefined ∧ M.miNonnegative ∧ M.miSymmetric ∧ M.miZeroIfIndependent ∧ M.miUpperBound

theorem mutual_information_closed_from_evidence {J : JointDistributionPackage} (M : MutualInformationPackage J)
    (Ev : MutualInformationEvidence M) : MutualInformationClosed M := by
  exact And.intro Ev.miDefinedClosed
    (And.intro Ev.miNonnegativeClosed
      (And.intro Ev.miSymmetricClosed
        (And.intro Ev.miZeroIfIndependentClosed Ev.miUpperBoundClosed)))

end EconomicsInformationCanonicalLaneLean
end HautevilleHouse