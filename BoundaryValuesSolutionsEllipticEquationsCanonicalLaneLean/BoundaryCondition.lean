import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

inductive BoundaryConditionType where
  | Dirichlet
  | Neumann
  | Robin

def BoundaryConditionType.toProp (t : BoundaryConditionType) : Prop :=
  match t with
  | Dirichlet => True
  | Neumann => True
  | Robin => True

structure BoundaryConditionPackage where
  conditionType : BoundaryConditionType
  compatibilityWithOperator : Prop
  traceTheoremApplied : Prop

structure BoundaryConditionEvidence (B : BoundaryConditionPackage) where
  compatibilityWithOperatorClosed : B.compatibilityWithOperator
  traceTheoremAppliedClosed : B.traceTheoremApplied

def BoundaryConditionClosed (B : BoundaryConditionPackage) : Prop :=
  B.compatibilityWithOperator ∧ B.traceTheoremApplied

theorem boundary_condition_closed_from_evidence (B : BoundaryConditionPackage) (Ev : BoundaryConditionEvidence B) : BoundaryConditionClosed B :=
  And.intro Ev.compatibilityWithOperatorClosed Ev.traceTheoremAppliedClosed

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse