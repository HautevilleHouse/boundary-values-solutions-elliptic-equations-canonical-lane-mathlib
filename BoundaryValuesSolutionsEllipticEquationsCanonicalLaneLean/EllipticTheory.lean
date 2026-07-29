import BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean.SobolevSpaceFoundation

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure EllipticPackage (D : BVDomain) (S : SobolevSpacePackage D) where
  bilinearForm : Type u
  coercivity : Prop
  boundedness : Prop
  laxMilgramApplied : Prop

structure EllipticEvidence (D : BVDomain) (S : SobolevSpacePackage D)
    (E : EllipticPackage D S) where
  bilinearFormClosed : E.bilinearForm
  coercivityClosed : E.coercivity
  boundednessClosed : E.boundedness
  laxMilgramAppliedClosed : E.laxMilgramApplied

def EllipticClosed (D : BVDomain) (S : SobolevSpacePackage D)
    (E : EllipticPackage D S) : Prop :=
  E.bilinearForm ∧ E.coercivity ∧ E.boundedness ∧ E.laxMilgramApplied

theorem elliptic_closed_from_evidence (D : BVDomain) (S : SobolevSpacePackage D)
    (E : EllipticPackage D S) (Ev : EllipticEvidence D S E) : EllipticClosed D S E := by
  exact And.intro Ev.bilinearFormClosed
    (And.intro Ev.coercivityClosed
      (And.intro Ev.boundednessClosed Ev.laxMilgramAppliedClosed))

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse