import canonicalLaneMathlib.AdmissibleClass

/-!
# Sobolev Space Theory Package
-/

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure SobolevSpacePackage where
  embeddingTheorems : Prop
  traceOperator : Prop
  compactEmbeddings : Prop
  weakConvergence : Prop

structure SobolevSpaceEvidence (S : SobolevSpacePackage) where
  embeddingTheoremsClosed : S.embeddingTheorems
  traceOperatorClosed : S.traceOperator
  compactEmbeddingsClosed : S.compactEmbeddings
  weakConvergenceClosed : S.weakConvergence

def SobolevSpaceClosed (S : SobolevSpacePackage) : Prop :=
  S.embeddingTheorems ∧ S.traceOperator ∧
  S.compactEmbeddings ∧ S.weakConvergence

theorem sobolev_space_closed_from_evidence (S : SobolevSpacePackage)
    (E : SobolevSpaceEvidence S) : SobolevSpaceClosed S := by
  exact And.intro E.embeddingTheoremsClosed
    (And.intro E.traceOperatorClosed
      (And.intro E.compactEmbeddingsClosed E.weakConvergenceClosed))

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse
