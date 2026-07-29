import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure FredholmAlternativePackage where
  compactOperator : Type u
  indexTheory : Prop
  kernelImageDecomposition : Prop
  solvabilityCondition : Prop

structure FredholmAlternativeEvidence (F : FredholmAlternativePackage) where
  compactOperatorClosed : F.compactOperator = Type u
  indexTheoryClosed : F.indexTheory
  kernelImageDecompositionClosed : F.kernelImageDecomposition
  solvabilityConditionClosed : F.solvabilityCondition

def FredholmAlternativeClosed (F : FredholmAlternativePackage) : Prop :=
  F.indexTheory ∧ F.kernelImageDecomposition ∧ F.solvabilityCondition

theorem fredholm_alternative_closed_from_evidence
    (F : FredholmAlternativePackage) (Ev : FredholmAlternativeEvidence F) :
    FredholmAlternativeClosed F := by
  exact And.intro Ev.indexTheoryClosed
    (And.intro Ev.kernelImageDecompositionClosed Ev.solvabilityConditionClosed)

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse
