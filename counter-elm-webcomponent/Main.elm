module Main exposing (..)

import Html exposing (..)
import Html.App exposing (..)
import API exposing (..)


type alias Model =
    Int


view : Model -> Html Msg
view model =
    div []
        [ counter [ count 2, onCountChanged ValueChanged ]
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
