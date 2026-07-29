import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure WeakSolutionPackage {n : Nat} (B : BoundaryValueProblem n) where
  sobolevSpace : Type u
  bilinearForm : Type v
  weaklyFormulatedProblem : Prop
  continuityOfForm : Prop
  coercivity : Prop

structure WeakSolutionEvidence {n : Nat} {B : BoundaryValueProblem n} (W : WeakSolutionPackage B) where
  weaklyFormulatedProblemClosed : W.weaklyFormulatedProblem
  continuityOfFormClosed : W.continuityOfForm
  coercivityClosed : W.coercivity

def WeakSolutionClosed {n : Nat} {B : BoundaryValueProblem n} (W : WeakSolutionPackage B) : Prop :=
  W.weaklyFormulatedProblem ∧ W.continuityOfForm ∧ W.coercivity

theorem weak_solution_closed_from_evidence {n : Nat} {B : BoundaryValueProblem n} (W : WeakSolutionPackage B) (E : WeakSolutionEvidence B W) : WeakSolutionClosed W := by
  exact And.intro E.weaklyFormulatedProblemClosed (And.intro E.continuityOfFormClosed E.coercivityClosed)

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse
