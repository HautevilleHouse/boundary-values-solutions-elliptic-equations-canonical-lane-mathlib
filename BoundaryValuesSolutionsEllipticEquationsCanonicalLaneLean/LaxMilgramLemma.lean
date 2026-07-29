import canonicalLaneMathlib.AdmissibleClass

/-!
# Lax-Milgram Lemma Package
-/

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure LaxMilgramPackage where
  bilinearFormCoercive : Prop
  linearBoundedFunctional : Prop
  uniqueSolution : Prop
  aPrioriEstimate : Prop

structure LaxMilgramEvidence (L : LaxMilgramPackage) where
  bilinearFormCoerciveClosed : L.bilinearFormCoercive
  linearBoundedFunctionalClosed : L.linearBoundedFunctional
  uniqueSolutionClosed : L.uniqueSolution
  aPrioriEstimateClosed : L.aPrioriEstimate

def LaxMilgramClosed (L : LaxMilgramPackage) : Prop :=
  L.bilinearFormCoercive ∧ L.linearBoundedFunctional ∧
  L.uniqueSolution ∧ L.aPrioriEstimate

theorem lax_milgram_closed_from_evidence (L : LaxMilgramPackage)
    (E : LaxMilgramEvidence L) : LaxMilgramClosed L := by
  exact And.intro E.bilinearFormCoerciveClosed
    (And.intro E.linearBoundedFunctionalClosed
      (And.intro E.uniqueSolutionClosed E.aPrioriEstimateClosed))

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse
