import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure WeakSolutionPackage where
  functionSpace : Type u
  bilinearForm : Prop
  linearFunctional : Prop
  laxMilgram : Prop

structure WeakSolutionEvidence (W : WeakSolutionPackage) where
  functionSpaceClosed : W.functionSpace = Type u
  bilinearFormClosed : W.bilinearForm
  linearFunctionalClosed : W.linearFunctional
  laxMilgramClosed : W.laxMilgram

def WeakSolutionClosed (W : WeakSolutionPackage) : Prop :=
  W.bilinearForm ∧ W.linearFunctional ∧ W.laxMilgram

theorem weak_solution_closed_from_evidence
    (W : WeakSolutionPackage) (Ev : WeakSolutionEvidence W) :
    WeakSolutionClosed W := by
  exact And.intro Ev.bilinearFormClosed
    (And.intro Ev.linearFunctionalClosed Ev.laxMilgramClosed)

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse
