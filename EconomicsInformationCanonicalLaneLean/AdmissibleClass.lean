import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInformationCanonicalLaneLean

structure AdmittedObject where
  source : ShannonEntropyPackage
  channel : ChannelPackage
  coding : SourceCodingPackage
  rateDistortion : RateDistortionPackage
  conclusion : ShannonEntropyClosed source ∧ ChannelClosed channel ∧ SourceCodingClosed coding ∧ RateDistortionClosed rateDistortion

structure AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EconomicsInformationCanonicalLaneLean
end HautevilleHouse