module Main exposing (..)

import Html exposing (..)
import Html.App exposing (..)
import API exposing (..)


type alias Model =
    Int


view : Model -> Html Msg
view model =
    div []
        [ text "component"
        , counter [ count 2, onCountChanged ValueChanged ]
        , text ("application value is " ++ (toString model))
          --, counter [ count 2, onCountChanged ValueChanged ]
        ]


type Msg
    = ValueChanged Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        ValueChanged val ->
            Debug.log "val" val


main : Program Never
main =
    beginnerProgram
        { model = 0
        , view = view
        , update = update
        }
