import BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BoundaryValueSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure BoundaryValueAdmittedObject where
  space : BoundaryValueSpace
  boundedDomain : Prop
  ellipticOperatorDefined : Prop
  boundaryFunctionGiven : Prop
  solutionModel : Type
  solutionTopology : TopologicalSpace solutionModel
  uniqueSolutionExists : Prop
  conclusion : uniqueSolutionExists

structure BoundaryValueEndgameState where
  object : BoundaryValueAdmittedObject

def BoundaryValueWitnessClosed (O : BoundaryValueAdmittedObject) : Prop :=
  O.uniqueSolutionExists

end BoundaryValuesSolutionsEllipticEquationsCanonicalLaneLean
end HautevilleHouse