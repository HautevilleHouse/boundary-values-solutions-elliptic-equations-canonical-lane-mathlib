import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean.DirichletProblem

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure LaxMilgramPackage where
  hilbertSpace : Type u
  bilinearForm : Type v
  coercivity : Prop
  boundedness : Prop
  weakSolution : Prop
  weakSolutionTerm : weakSolution

def LaxMilgramClosed (L : LaxMilgramPackage) : Prop :=
  L.coercivity ∧ L.boundedness ∧ L.weakSolution

structure LaxMilgramEvidence (L : LaxMilgramPackage) where
  coercivityClosed : L.coercivity
  boundednessClosed : L.boundedness
  weakSolutionClosed : L.weakSolution

theorem lax_milgram_closed_from_evidence (L : LaxMilgramPackage) (E : LaxMilgramEvidence L) : LaxMilgramClosed L := by
  exact And.intro E.coercivityClosed (And.intro E.boundednessClosed E.weakSolutionClosed)

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse