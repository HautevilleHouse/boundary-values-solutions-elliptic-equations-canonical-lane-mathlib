import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure BoundaryValueProblem where
  domain : Type u
  boundary : Type v
  equation : Prop
  boundaryCondition : Prop
  solution : Prop

def BoundaryValueProblemClosed (B : BoundaryValueProblem) : Prop :=
  B.equation ∧ B.boundaryCondition ∧ B.solution

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse
