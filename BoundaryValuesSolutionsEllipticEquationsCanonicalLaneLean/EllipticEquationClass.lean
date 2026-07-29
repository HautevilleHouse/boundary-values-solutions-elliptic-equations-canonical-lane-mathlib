import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure EllipticEquationData where
  domainType : Type u
  boundaryType : Type v
  operator : (domainType → ℝ) → (domainType → ℝ)
  ellipticityCondition : Prop
  boundedDomain : Prop
  smoothBoundary : Prop

structure EllipticEquationEvidence (E : EllipticEquationData) where
  ellipticityConditionClosed : E.ellipticityCondition
  boundedDomainClosed : E.boundedDomain
  smoothBoundaryClosed : E.smoothBoundary

def EllipticEquationClosed (E : EllipticEquationData) : Prop :=
  E.ellipticityCondition ∧ E.boundedDomain ∧ E.smoothBoundary

theorem elliptic_equation_closed_from_evidence (E : EllipticEquationData) (Ev : EllipticEquationEvidence E) : EllipticEquationClosed E := by
  exact And.intro Ev.ellipticityConditionClosed (And.intro Ev.boundedDomainClosed Ev.smoothBoundaryClosed)

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse