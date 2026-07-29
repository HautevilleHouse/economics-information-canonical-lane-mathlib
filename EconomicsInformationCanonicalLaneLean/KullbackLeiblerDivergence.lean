import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInformationCanonicalLaneLean

structure KullbackLeiblerPackage where
  probabilitySpace : Type u
  p : probabilitySpace → ℝ
  q : probabilitySpace → ℝ
  divergence : ℝ
  nonnegativity : Prop
  finiteness : Prop
  gibbsInequality : Prop

structure KullbackLeiblerEvidence (K : KullbackLeiblerPackage) where
  nonnegativityClosed : K.nonnegativity
  finitenessClosed : K.finiteness
  gibbsInequalityClosed : K.gibbsInequality

def KullbackLeiblerClosed (K : KullbackLeiblerPackage) : Prop :=
  K.nonnegativity ∧ K.finiteness ∧ K.gibbsInequality

theorem kl_divergence_closed_from_evidence (K : KullbackLeiblerPackage)
    (E : KullbackLeiblerEvidence K) : KullbackLeiblerClosed K := by
  exact And.intro E.nonnegativityClosed
    (And.intro E.finitenessClosed E.gibbsInequalityClosed)

end EconomicsInformationCanonicalLaneLean
end HautevilleHouse