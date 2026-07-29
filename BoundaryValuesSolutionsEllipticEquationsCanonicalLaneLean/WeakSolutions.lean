import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean.EllipticOperator
import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean.SobolevSpaces

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure WeakSolutionPackage {E : EllipticOperatorPackage} {S : SobolevSpacePackage} where
  bilinearForm : Type v
  coercivity : Prop
  boundedness : Prop
  laxMilgramApplied : Prop
  weakSolutionExists : Prop

structure WeakSolutionEvidence {E : EllipticOperatorPackage} {S : SobolevSpacePackage} (W : WeakSolutionPackage E S) where
  coercivityClosed : W.coercivity
  boundednessClosed : W.boundedness
  laxMilgramAppliedClosed : W.laxMilgramApplied
  weakSolutionExistsClosed : W.weakSolutionExists

def WeakSolutionClosed {E : EllipticOperatorPackage} {S : SobolevSpacePackage} (W : WeakSolutionPackage E S) : Prop :=
  W.coercivity ∧ W.boundedness ∧ W.laxMilgramApplied ∧ W.weakSolutionExists

theorem weak_solution_closed_from_evidence {E : EllipticOperatorPackage} {S : SobolevSpacePackage} (W : WeakSolutionPackage E S) (ev : WeakSolutionEvidence W) :
    WeakSolutionClosed W := by
  exact And.intro ev.coercivityClosed (And.intro ev.boundednessClosed (And.intro ev.laxMilgramAppliedClosed ev.weakSolutionExistsClosed))

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse