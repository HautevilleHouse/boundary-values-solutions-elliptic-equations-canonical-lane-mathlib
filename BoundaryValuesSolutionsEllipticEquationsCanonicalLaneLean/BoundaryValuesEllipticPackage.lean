import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure BoundaryValueProblem (n : Nat) where
  domain : Type u
  topology : TopologicalSpace domain
  boundary : domain → Prop
  ellipticOperator : Type v
  smoothCoefficients : Prop
  uniformlyElliptic : Prop
  boundaryCondition : Prop

structure BoundaryValueEvidence (B : BoundaryValueProblem n) where
  smoothCoefficientsClosed : B.smoothCoefficients
  uniformlyEllipticClosed : B.uniformlyElliptic
  boundaryConditionClosed : B.boundaryCondition

def BoundaryValueClosed (B : BoundaryValueProblem n) : Prop :=
  B.smoothCoefficients ∧ B.uniformlyElliptic ∧ B.boundaryCondition

theorem boundary_value_closed_from_evidence (B : BoundaryValueProblem n) (E : BoundaryValueEvidence B) : BoundaryValueClosed B := by
  exact And.intro E.smoothCoefficientsClosed (And.intro E.uniformlyEllipticClosed E.boundaryConditionClosed)

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse
