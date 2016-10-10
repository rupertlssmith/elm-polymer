module API exposing (counter, initialCount, onCountChanged)

import Json.Decode as Decode
import Html exposing (Attribute, Html)
import Html.Attributes exposing (attribute)
import Html.Events exposing (on)


--setCount: Int -> Cmd msg


counter : List (Attribute msg) -> Html msg
counter attrs =
    Html.node "elm-counter" attrs []


initialCount : Int -> Attribute msg
initialCount val =
    attribute "initial-count" (toString val)


onCountChanged : (Int -> msg) -> Attribute msg
onCountChanged tagger =
    on "count-changed" <| Decode.map tagger detailCount


detailCount : Decode.Decoder Int
detailCount =
    Decode.at [ "detail", "value" ] Decode.int
