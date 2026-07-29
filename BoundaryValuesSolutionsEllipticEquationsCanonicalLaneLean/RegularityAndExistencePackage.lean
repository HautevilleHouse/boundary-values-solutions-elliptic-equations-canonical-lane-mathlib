import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure RegularityAndExistencePackage {n : Nat} {B : BoundaryValueProblem n} (W : WeakSolutionPackage B) where
  existenceOfWeakSolution : Prop
  interiorRegularity : Prop
  boundaryRegularity : Prop
  uniqueness : Prop
  maximumPrinciple : Prop

structure RegularityAndExistenceEvidence {n : Nat} {B : BoundaryValueProblem n} {W : WeakSolutionPackage B} (R : RegularityAndExistencePackage B W) where
  existenceOfWeakSolutionClosed : R.existenceOfWeakSolution
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  uniquenessClosed : R.uniqueness
  maximumPrincipleClosed : R.maximumPrinciple

def RegularityAndExistenceClosed {n : Nat} {B : BoundaryValueProblem n} {W : WeakSolutionPackage B} (R : RegularityAndExistencePackage B W) : Prop :=
  R.existenceOfWeakSolution ∧ R.interiorRegularity ∧ R.boundaryRegularity ∧ R.uniqueness ∧ R.maximumPrinciple

theorem regularity_and_existence_closed_from_evidence {n : Nat} {B : BoundaryValueProblem n} {W : WeakSolutionPackage B} (R : RegularityAndExistencePackage B W) (E : RegularityAndExistenceEvidence B W R) : RegularityAndExistenceClosed R := by
  exact And.intro E.existenceOfWeakSolutionClosed
    (And.intro E.interiorRegularityClosed
      (And.intro E.boundaryRegularityClosed
        (And.intro E.uniquenessClosed E.maximumPrincipleClosed)))

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse
