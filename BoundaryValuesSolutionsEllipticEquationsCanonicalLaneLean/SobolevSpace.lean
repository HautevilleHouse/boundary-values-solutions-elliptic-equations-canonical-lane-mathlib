import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure SobolevSpacePackage where
  domainType : Type u
  exponent : Nat
  differentiabilityOrder : Nat
  embeddingTheoremHolds : Prop
  compactEmbeddingHolds : Prop

structure SobolevSpaceEvidence (S : SobolevSpacePackage) where
  embeddingTheoremHoldsClosed : S.embeddingTheoremHolds
  compactEmbeddingHoldsClosed : S.compactEmbeddingHolds

def SobolevSpaceClosed (S : SobolevSpacePackage) : Prop :=
  S.embeddingTheoremHolds ∧ S.compactEmbeddingHolds

theorem sobolev_space_closed_from_evidence (S : SobolevSpacePackage) (Ev : SobolevSpaceEvidence S) : SobolevSpaceClosed S :=
  And.intro Ev.embeddingTheoremHoldsClosed Ev.compactEmbeddingHoldsClosed

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse