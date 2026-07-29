import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  interfaceClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse
