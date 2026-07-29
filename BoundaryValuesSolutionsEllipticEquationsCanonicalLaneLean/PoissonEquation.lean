import canonicalLaneMathlib.AdmissibleClass

/-!
# Poisson Equation Package
-/

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure PoissonEquationPackage where
  domainRegularity : Prop
  sourceTermIntegrability : Prop
  weakSolutionExistence : Prop
  greenFunctionRepresentation : Prop

structure PoissonEquationEvidence (P : PoissonEquationPackage) where
  domainRegularityClosed : P.domainRegularity
  sourceTermIntegrabilityClosed : P.sourceTermIntegrability
  weakSolutionExistenceClosed : P.weakSolutionExistence
  greenFunctionRepresentationClosed : P.greenFunctionRepresentation

def PoissonEquationClosed (P : PoissonEquationPackage) : Prop :=
  P.domainRegularity ∧ P.sourceTermIntegrability ∧
  P.weakSolutionExistence ∧ P.greenFunctionRepresentation

theorem poisson_equation_closed_from_evidence (P : PoissonEquationPackage)
    (E : PoissonEquationEvidence P) : PoissonEquationClosed P := by
  exact And.intro E.domainRegularityClosed
    (And.intro E.sourceTermIntegrabilityClosed
      (And.intro E.weakSolutionExistenceClosed E.greenFunctionRepresentationClosed))

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse
