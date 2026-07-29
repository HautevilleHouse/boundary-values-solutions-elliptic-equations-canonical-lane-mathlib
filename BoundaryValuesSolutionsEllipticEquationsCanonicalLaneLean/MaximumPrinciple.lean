import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure MaximumPrinciplePackage where
  weakPrinciple : Prop
  strongPrinciple : Prop
  hopfLemma : Prop
  aPrioriBound : Prop

structure MaximumPrincipleEvidence (M : MaximumPrinciplePackage) where
  weakPrincipleClosed : M.weakPrinciple
  strongPrincipleClosed : M.strongPrinciple
  hopfLemmaClosed : M.hopfLemma
  aPrioriBoundClosed : M.aPrioriBound

def MaximumPrincipleClosed (M : MaximumPrinciplePackage) : Prop :=
  M.weakPrinciple ∧ M.strongPrinciple ∧ M.hopfLemma ∧ M.aPrioriBound

theorem maximum_principle_closed_from_evidence
    (M : MaximumPrinciplePackage) (Ev : MaximumPrincipleEvidence M) :
    MaximumPrincipleClosed M := by
  exact And.intro Ev.weakPrincipleClosed
    (And.intro Ev.strongPrincipleClosed
      (And.intro Ev.hopfLemmaClosed Ev.aPrioriBoundClosed))

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse
