module API exposing (counter, initialValue, onCountChanged)

import Json.Decode as Decode
import Html exposing (Attribute, Html)
import Html.Attributes exposing (attribute)
import Html.Events exposing (on)


--setCount: Int -> Cmd msg


counter : List (Attribute msg) -> Html msg
counter attrs =
    Html.node "elm-counter" attrs []


initialValue : Int -> Attribute msg
initialValue val =
    attribute "initial-value" (toString val)


onCountChanged : (Int -> msg) -> Attribute msg
onCountChanged tagger =
    on "value-changed" <| Decode.map tagger detailValue


detailValue : Decode.Decoder Int
detailValue =
    Decode.at [ "detail", "value" ] Decode.int
