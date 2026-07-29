import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure EllipticBVPPackage where
  domain : Type u
  boundary : Type v
  operator : Type w
  boundaryCondition : Type x
  strongEllipticity : Prop
  boundaryRegularity : Prop
  existenceUniqueness : Prop

structure EllipticBVPEvidence (P : EllipticBVPPackage) where
  strongEllipticityClosed : P.strongEllipticity
  boundaryRegularityClosed : P.boundaryRegularity
  existenceUniquenessClosed : P.existenceUniqueness

def EllipticBVPClosed (P : EllipticBVPPackage) : Prop :=
  P.strongEllipticity ∧ P.boundaryRegularity ∧ P.existenceUniqueness

theorem elliptic_bvp_closed_from_evidence (P : EllipticBVPPackage) (E : EllipticBVPEvidence P) :
    EllipticBVPClosed P := by
  exact And.intro E.strongEllipticityClosed
    (And.intro E.boundaryRegularityClosed E.existenceUniquenessClosed)

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse