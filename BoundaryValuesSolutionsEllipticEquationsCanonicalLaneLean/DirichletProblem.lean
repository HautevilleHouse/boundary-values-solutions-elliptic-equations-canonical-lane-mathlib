import BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean.EllipticOperator

/-!
# Dirichlet Problem Package
-/

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure DirichletProblemPackage {E : EllipticOperatorPackage} where
  domainNonempty : Prop
  boundaryRegular : Prop
  weakSolutionExists : Prop
  uniqueSolution : Prop
  continuousUpToBoundary : Prop

structure DirichletProblemEvidence {E : EllipticOperatorPackage} (D : DirichletProblemPackage E) where
  domainNonemptyClosed : D.domainNonempty
  boundaryRegularClosed : D.boundaryRegular
  weakSolutionExistsClosed : D.weakSolutionExists
  uniqueSolutionClosed : D.uniqueSolution
  continuousUpToBoundaryClosed : D.continuousUpToBoundary

def DirichletProblemClosed {E : EllipticOperatorPackage} (D : DirichletProblemPackage E) : Prop :=
  D.domainNonempty ∧ D.boundaryRegular ∧ D.weakSolutionExists ∧ D.uniqueSolution ∧ D.continuousUpToBoundary

theorem dirichlet_problem_closed_from_evidence {E : EllipticOperatorPackage}
    (D : DirichletProblemPackage E) (Ev : DirichletProblemEvidence D) : DirichletProblemClosed D := by
  exact And.intro Ev.domainNonemptyClosed (And.intro Ev.boundaryRegularClosed (And.intro Ev.weakSolutionExistsClosed (And.intro Ev.uniqueSolutionClosed Ev.continuousUpToBoundaryClosed)))

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse