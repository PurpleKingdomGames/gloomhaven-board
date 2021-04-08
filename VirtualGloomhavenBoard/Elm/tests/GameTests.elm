module GameTests exposing (suite)

import Array exposing (fromList, toList)
import BoardMapTile exposing (MapTileRef(..))
import BoardOverlay exposing (BoardOverlay, BoardOverlayDirectionType(..), BoardOverlayType(..), TrapSubType(..))
import Character exposing (CharacterClass(..))
import Expect
import Game exposing (Cell, Expansion(..), GameStateScenario(..), PieceType(..))
import Random exposing (Seed)
import Scenario exposing (MapTileData, Scenario)
import Test exposing (Test, describe, test)


seed : Seed
seed =
    Random.initialSeed 12345


suite : Test
suite =
    describe "The Game module"
        [ describe "Game.generateGameMap"
            [ test "should output a single board" <|
                \_ ->
                    let
                        scenario =
                            Scenario 0 "Test" (MapTileData B3b [] [ BoardOverlay (Trap BearTrap) 1 Default [ ( 0, 3 ) ], BoardOverlay (Trap BearTrap) 2 Default [ ( 2, 3 ) ] ] [] 0) 0 []

                        expectedBoard =
                            [ fromList
                                [ Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                ]
                            , fromList
                                [ Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [] False
                                ]
                            , fromList
                                [ Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                ]
                            , fromList
                                [ Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [] False
                                ]
                            ]
                    in
                    toList (Game.generateGameMap (InbuiltScenario Gloomhaven 1) scenario "" [ Brute, Cragheart, Tinkerer ] seed).staticBoard
                        |> Expect.equalLists expectedBoard
            , test "should output a rotated single board" <|
                \_ ->
                    let
                        scenario =
                            Scenario 0 "Test" (MapTileData B3b [] [ BoardOverlay (Trap BearTrap) 1 Default [ ( 0, 3 ), ( 1, 3 ) ], BoardOverlay (Trap BearTrap) 2 Default [ ( 2, 3 ) ] ] [] 3) 0 []

                        expectedBoard =
                            [ fromList
                                [ Cell [] False
                                , Cell [] False
                                , Cell [] False
                                , Cell [] False
                                , Cell [] False
                                , Cell [] False
                                ]
                            , fromList
                                [ Cell [] False
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [] False
                                , Cell [] False
                                ]
                            , fromList
                                [ Cell [] False
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [] False
                                ]
                            , fromList
                                [ Cell [] False
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [] False
                                , Cell [] False
                                ]
                            , fromList
                                [ Cell [] False
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [ B3b ] True
                                , Cell [] False
                                ]
                            , fromList
                                [ Cell [] False
                                , Cell [] False
                                , Cell [] False
                                , Cell [] False
                                , Cell [] False
                                , Cell [] False
                                ]
                            ]
                    in
                    toList (Game.generateGameMap (InbuiltScenario Gloomhaven 1) scenario "" [ Brute, Cragheart, Tinkerer ] seed).staticBoard
                        |> Expect.equalLists expectedBoard
            ]
        ]
