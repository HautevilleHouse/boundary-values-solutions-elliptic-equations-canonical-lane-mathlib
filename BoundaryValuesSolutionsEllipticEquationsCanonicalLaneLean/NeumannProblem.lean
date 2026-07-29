import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure NeumannProblemPackage where
  boundaryFlux : Type u
  compatibilityCondition : Prop
  solutionExistenceUpToConstant : Prop
  uniquenessModConstant : Prop
  regularity : Prop

structure NeumannProblemEvidence (N : NeumannProblemPackage) where
  compatibilityConditionClosed : N.compatibilityCondition
  solutionExistenceUpToConstantClosed : N.solutionExistenceUpToConstant
  uniquenessModConstantClosed : N.uniquenessModConstant
  regularityClosed : N.regularity

def NeumannProblemClosed (N : NeumannProblemPackage) : Prop :=
  N.compatibilityCondition ∧ N.solutionExistenceUpToConstant ∧ N.uniquenessModConstant ∧ N.regularity

theorem neumann_problem_closed_from_evidence (N : NeumannProblemPackage) (Ev : NeumannProblemEvidence N) : NeumannProblemClosed N := by
  exact And.intro Ev.compatibilityConditionClosed (And.intro Ev.solutionExistenceUpToConstantClosed (And.intro Ev.uniquenessModConstantClosed Ev.regularityClosed))

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse