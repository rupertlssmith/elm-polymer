port module Component exposing (..)

import Html exposing (..)
import Html.App exposing (..)
import Html.Events exposing (..)


type alias Model =
    Int


init : { a | count : Int } -> ( Model, Cmd Msg )
init flags =
    ( flags.count, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , span [] [ text <| toString model ]
        , button [ onClick Increment ] [ text "+" ]
        ]


type Msg
    = Increment
    | Decrement
    | Set Model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case (Debug.log "val" msg) of
        Increment ->
            let
                new =
                    model + 1
            in
                ( new, change new )

        Decrement ->
            let
                new =
                    model - 1
            in
                ( new, change new )

        Set count ->
            ( count, change count )


main : Program { count : Int }
main =
    programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> set Set
        }


port change : Model -> Cmd msg


port set : (Model -> msg) -> Sub msg
