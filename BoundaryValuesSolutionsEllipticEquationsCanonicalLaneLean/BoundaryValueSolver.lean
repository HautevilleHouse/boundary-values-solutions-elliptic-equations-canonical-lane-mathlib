import BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean.EllipticTheory

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure BoundaryValueSolutionPackage (D : BVDomain) (S : SobolevSpacePackage D)
    (E : EllipticPackage D S) where
  solutionSpace : Type u
  regularity : Prop
  uniqueSolvability : Prop
  continuousDependence : Prop

structure BoundaryValueSolutionEvidence (D : BVDomain) (S : SobolevSpacePackage D)
    (E : EllipticPackage D S) (B : BoundaryValueSolutionPackage D S E) where
  regularityClosed : B.regularity
  uniqueSolvabilityClosed : B.uniqueSolvability
  continuousDependenceClosed : B.continuousDependence

def BoundaryValueSolutionClosed (D : BVDomain) (S : SobolevSpacePackage D)
    (E : EllipticPackage D S) (B : BoundaryValueSolutionPackage D S E) : Prop :=
  B.regularity ∧ B.uniqueSolvability ∧ B.continuousDependence

theorem boundary_value_solution_closed_from_evidence (D : BVDomain) (S : SobolevSpacePackage D)
    (E : EllipticPackage D S) (B : BoundaryValueSolutionPackage D S E)
    (Ev : BoundaryValueSolutionEvidence D S E B) : BoundaryValueSolutionClosed D S E B := by
  exact And.intro Ev.regularityClosed
    (And.intro Ev.uniqueSolvabilityClosed Ev.continuousDependenceClosed)

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse