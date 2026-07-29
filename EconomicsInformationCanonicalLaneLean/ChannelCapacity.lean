import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInformationCanonicalLaneLean

structure ChannelCapacityPackage where
  inputAlphabet : Type u
  outputAlphabet : Type v
  transitionMatrix : inputAlphabet → outputAlphabet → ℝ
  capacity : ℝ
  mutualInfoMax : ℝ
  maxSatisfied : mutualInfoMax = capacity

structure ChannelCapacityEvidence (C : ChannelCapacityPackage) where
  mutualInfoNonnegative : C.mutualInfoMax ≥ 0
  capacityBound : C.capacity ≤ 1
  maxReached : C.maxSatisfied

def ChannelCapacityClosed (C : ChannelCapacityPackage) : Prop :=
  C.mutualInfoMax ≥ 0 ∧ C.capacity ≤ 1 ∧ C.maxSatisfied

theorem channel_capacity_closed_from_evidence (C : ChannelCapacityPackage) (E : ChannelCapacityEvidence C) :
    ChannelCapacityClosed C := by
  exact And.intro E.mutualInfoNonnegative (And.intro E.capacityBound E.maxReached)

end EconomicsInformationCanonicalLaneLean
end HautevilleHouse
