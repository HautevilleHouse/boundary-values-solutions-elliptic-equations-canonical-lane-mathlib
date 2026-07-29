import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure EllipticRegularity where
  gainInSmoothness : ℕ
  interiorRegularity : Prop
  boundaryRegularity : Prop
  higherRegularity : Prop

structure EllipticRegularityEvidence (R : EllipticRegularity) where
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  higherRegularityClosed : R.higherRegularity

def EllipticRegularityClosed (R : EllipticRegularity) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧ R.higherRegularity

theorem elliptic_regularity_closed_from_evidence (R : EllipticRegularity) (E : EllipticRegularityEvidence R) : EllipticRegularityClosed R := by
  exact And.intro E.interiorRegularityClosed (And.intro E.boundaryRegularityClosed E.higherRegularityClosed)

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse