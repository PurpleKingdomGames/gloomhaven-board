module BoardOverlay exposing (BoardOverlay, BoardOverlayDirectionType(..), BoardOverlayType(..), ChestType(..), CorridorMaterial(..), CorridorSize(..), DifficultTerrainSubType(..), DoorSubType(..), HazardSubType(..), ObstacleSubType(..), TrapSubType(..), TreasureSubType(..), getBoardOverlayName)

import BoardMapTile exposing (MapTileRef)


type BoardOverlayType
    = DifficultTerrain DifficultTerrainSubType
    | Door DoorSubType (List MapTileRef)
    | Hazard HazardSubType
    | Obstacle ObstacleSubType
    | StartingLocation
    | Trap TrapSubType
    | Treasure TreasureSubType


type DoorSubType
    = Corridor CorridorMaterial CorridorSize
    | DarkFog
    | LightFog
    | Stone
    | Wooden


type CorridorMaterial
    = Earth
    | ManmadeStone
    | NaturalStone
    | Wood


type CorridorSize
    = One
    | Two


type TrapSubType
    = BearTrap
    | Poison
    | Spike


type HazardSubType
    = Thorns


type DifficultTerrainSubType
    = Rubble


type ObstacleSubType
    = Altar
    | Barrel
    | Boulder1
    | Boulder2
    | Bush
    | Crate
    | Nest
    | Pillar
    | Sarcophagus
    | Table
    | Totem
    | Tree3


type TreasureSubType
    = Chest ChestType
    | Coin Int


type ChestType
    = NormalChest Int
    | Goal


type BoardOverlayDirectionType
    = Default
    | Horizontal
    | Vertical
    | DiagonalLeft
    | DiagonalRight


type alias BoardOverlay =
    { ref : BoardOverlayType
    , direction : BoardOverlayDirectionType
    , cells : List ( Int, Int )
    }


getBoardOverlayName : BoardOverlayType -> String
getBoardOverlayName overlay =
    case overlay of
        Door d _ ->
            case d of
                Stone ->
                    "door-stone"

                Wooden ->
                    "door-wooden"

                Corridor c num ->
                    (case c of
                        Earth ->
                            "corridor-earth"

                        ManmadeStone ->
                            "corridor-manmade-stone"

                        NaturalStone ->
                            "corridor-natural-stone"

                        Wood ->
                            "corridor-wood"
                    )
                        ++ (case num of
                                One ->
                                    "-1"

                                Two ->
                                    "-2"
                           )

                DarkFog ->
                    "door-dark-fog"

                LightFog ->
                    "door-light-fog"

        DifficultTerrain d ->
            case d of
                Rubble ->
                    "difficult-terrain-rubble"

        Hazard h ->
            case h of
                Thorns ->
                    "hazard-thorns"

        Obstacle o ->
            case o of
                Altar ->
                    "obstacle-altar"

                Sarcophagus ->
                    "obstacle-sarcophagus"

                Barrel ->
                    "obstacle-barrel"

                Boulder1 ->
                    "obstacle-boulder-1"

                Boulder2 ->
                    "obstacle-boulder-2"

                Bush ->
                    "obstacle-bush"

                Crate ->
                    "obstacle-crate"

                Pillar ->
                    "obstacle-pillar"

                Table ->
                    "obstacle-table"

                Totem ->
                    "obstacle-totem"

                Nest ->
                    "obstacle-nest"

                Tree3 ->
                    "obstacle-tree-3"

        StartingLocation ->
            "starting-location"

        Trap t ->
            case t of
                BearTrap ->
                    "trap-bear"

                Spike ->
                    "trap-spike"

                Poison ->
                    "trap-poison"

        Treasure t ->
            case t of
                Chest _ ->
                    "treasure-chest"

                Coin _ ->
                    "treasure-coin"
