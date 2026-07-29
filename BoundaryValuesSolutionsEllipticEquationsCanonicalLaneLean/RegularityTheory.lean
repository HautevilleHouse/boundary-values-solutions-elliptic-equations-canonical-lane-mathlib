import BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean.DirichletProblem

/-!
# Regularity Theory Package
-/

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure RegularityTheoryPackage {E : EllipticOperatorPackage} {D : DirichletProblemPackage E} where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  holderEstimates : Prop
  schauderEstimates : Prop

structure RegularityTheoryEvidence {E : EllipticOperatorPackage} {D : DirichletProblemPackage E}
    (R : RegularityTheoryPackage E D) where
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  holderEstimatesClosed : R.holderEstimates
  schauderEstimatesClosed : R.schauderEstimates

def RegularityTheoryClosed {E : EllipticOperatorPackage} {D : DirichletProblemPackage E}
    (R : RegularityTheoryPackage E D) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧ R.holderEstimates ∧ R.schauderEstimates

theorem regularity_theory_closed_from_evidence {E : EllipticOperatorPackage} {D : DirichletProblemPackage E}
    (R : RegularityTheoryPackage E D) (Ev : RegularityTheoryEvidence R) : RegularityTheoryClosed R := by
  exact And.intro Ev.interiorRegularityClosed (And.intro Ev.boundaryRegularityClosed (And.intro Ev.holderEstimatesClosed Ev.schauderEstimatesClosed))

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse