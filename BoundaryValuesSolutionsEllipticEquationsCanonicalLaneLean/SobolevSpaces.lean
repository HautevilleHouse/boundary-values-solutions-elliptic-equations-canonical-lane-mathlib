import BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean.RegularityTheory

/-!
# Sobolev Spaces Package
-/

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure SobolevSpacesPackage {E : EllipticOperatorPackage} {D : DirichletProblemPackage E}
    (R : RegularityTheoryPackage E D) where
  sobolevEmbedding : Prop
  traceTheorem : Prop
  compactEmbedding : Prop

structure SobolevSpacesEvidence {E : EllipticOperatorPackage} {D : DirichletProblemPackage E}
    {R : RegularityTheoryPackage E D} (S : SobolevSpacesPackage R) where
  sobolevEmbeddingClosed : S.sobolevEmbedding
  traceTheoremClosed : S.traceTheorem
  compactEmbeddingClosed : S.compactEmbedding

def SobolevSpacesClosed {E : EllipticOperatorPackage} {D : DirichletProblemPackage E}
    {R : RegularityTheoryPackage E D} (S : SobolevSpacesPackage R) : Prop :=
  S.sobolevEmbedding ∧ S.traceTheorem ∧ S.compactEmbedding

theorem sobolev_spaces_closed_from_evidence {E : EllipticOperatorPackage} {D : DirichletProblemPackage E}
    {R : RegularityTheoryPackage E D} (S : SobolevSpacesPackage R) (Ev : SobolevSpacesEvidence S) :
    SobolevSpacesClosed S := by
  exact And.intro Ev.sobolevEmbeddingClosed (And.intro Ev.traceTheoremClosed Ev.compactEmbeddingClosed)

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse