import Mathlib.Topology.Basic

/-!
# Elliptic Operator Package
-/

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

structure EllipticOperatorPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  metric : Type v
  operator : Type w
  smoothness : Prop
  uniformEllipticity : Prop
  boundedCoefficients : Prop

structure EllipticOperatorEvidence (E : EllipticOperatorPackage) where
  smoothnessClosed : E.smoothness
  uniformEllipticityClosed : E.uniformEllipticity
  boundedCoefficientsClosed : E.boundedCoefficients

def EllipticOperatorClosed (E : EllipticOperatorPackage) : Prop :=
  E.smoothness ∧ E.uniformEllipticity ∧ E.boundedCoefficients

theorem elliptic_operator_closed_from_evidence (E : EllipticOperatorPackage) (Ev : EllipticOperatorEvidence E) : EllipticOperatorClosed E := by
  exact And.intro Ev.smoothnessClosed (And.intro Ev.uniformEllipticityClosed Ev.boundedCoefficientsClosed)

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse