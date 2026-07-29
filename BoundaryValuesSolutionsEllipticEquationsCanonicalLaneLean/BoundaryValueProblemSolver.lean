import canonicalLaneMathlib.AdmissibleClass

/-!
# Boundary Value Problem Solver Package
-/

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure BoundaryValueProblemSolverPackage where
  dirichletProblem : Prop
  neumannProblem : Prop
  robinProblem : Prop
  mixedProblem : Prop

structure BoundaryValueProblemSolverEvidence (B : BoundaryValueProblemSolverPackage) where
  dirichletProblemClosed : B.dirichletProblem
  neumannProblemClosed : B.neumannProblem
  robinProblemClosed : B.robinProblem
  mixedProblemClosed : B.mixedProblem

def BoundaryValueProblemSolverClosed (B : BoundaryValueProblemSolverPackage) : Prop :=
  B.dirichletProblem ∧ B.neumannProblem ∧
  B.robinProblem ∧ B.mixedProblem

theorem boundary_value_problem_solver_closed_from_evidence
    (B : BoundaryValueProblemSolverPackage)
    (E : BoundaryValueProblemSolverEvidence B) :
    BoundaryValueProblemSolverClosed B := by
  exact And.intro E.dirichletProblemClosed
    (And.intro E.neumannProblemClosed
      (And.intro E.robinProblemClosed E.mixedProblemClosed))

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse
