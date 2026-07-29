import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure EllipticRegularityPackage where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  schauderEstimates : Prop
  sobolevEmbedding : Prop

structure EllipticRegularityEvidence (E : EllipticRegularityPackage) where
  interiorRegularityClosed : E.interiorRegularity
  boundaryRegularityClosed : E.boundaryRegularity
  schauderEstimatesClosed : E.schauderEstimates
  sobolevEmbeddingClosed : E.sobolevEmbedding

def EllipticRegularityClosed (E : EllipticRegularityPackage) : Prop :=
  E.interiorRegularity ∧ E.boundaryRegularity ∧ E.schauderEstimates ∧ E.sobolevEmbedding

theorem elliptic_regularity_closed_from_evidence
    (E : EllipticRegularityPackage) (Ev : EllipticRegularityEvidence E) :
    EllipticRegularityClosed E := by
  exact And.intro Ev.interiorRegularityClosed
    (And.intro Ev.boundaryRegularityClosed
      (And.intro Ev.schauderEstimatesClosed Ev.sobolevEmbeddingClosed))

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse
