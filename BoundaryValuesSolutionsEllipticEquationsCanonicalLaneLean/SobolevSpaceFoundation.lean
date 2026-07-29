import BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure SobolevSpacePackage (D : BVDomain) where
  hilbertSpace : Type u
  innerProduct : Prop
  normComplete : Prop
  traceEmbedding : Prop

structure SobolevSpaceEvidence (D : BVDomain) (S : SobolevSpacePackage D) where
  hilbertSpaceClosed : S.hilbertSpace
  innerProductClosed : S.innerProduct
  normCompleteClosed : S.normComplete
  traceEmbeddingClosed : S.traceEmbedding

def SobolevSpaceClosed (D : BVDomain) (S : SobolevSpacePackage D) : Prop :=
  S.hilbertSpace ∧ S.innerProduct ∧ S.normComplete ∧ S.traceEmbedding

theorem sobolev_space_closed_from_evidence (D : BVDomain) (S : SobolevSpacePackage D)
    (E : SobolevSpaceEvidence D S) : SobolevSpaceClosed D S := by
  exact And.intro E.hilbertSpaceClosed
    (And.intro E.innerProductClosed
      (And.intro E.normCompleteClosed E.traceEmbeddingClosed))

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse