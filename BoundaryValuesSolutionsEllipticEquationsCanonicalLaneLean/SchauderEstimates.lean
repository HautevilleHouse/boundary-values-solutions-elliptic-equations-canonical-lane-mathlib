import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure SchauderEstimatePackage where
  holderNormDefinition : Type u
  interiorEstimate : Prop
  boundaryEstimate : Prop
  dependencyOnCoefficients : Prop

structure SchauderEstimateEvidence (S : SchauderEstimatePackage) where
  interiorEstimateClosed : S.interiorEstimate
  boundaryEstimateClosed : S.boundaryEstimate
  dependencyOnCoefficientsClosed : S.dependencyOnCoefficients

def SchauderEstimateClosed (S : SchauderEstimatePackage) : Prop :=
  S.interiorEstimate ∧ S.boundaryEstimate ∧ S.dependencyOnCoefficients

theorem schauder_estimate_closed_from_evidence (S : SchauderEstimatePackage) (Ev : SchauderEstimateEvidence S) : SchauderEstimateClosed S := by
  exact And.intro Ev.interiorEstimateClosed (And.intro Ev.boundaryEstimateClosed Ev.dependencyOnCoefficientsClosed)

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse