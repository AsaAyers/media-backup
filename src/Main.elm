port module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


main : Program (Maybe Model) Model Msg
main =
    Html.programWithFlags
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }

init : Maybe Model -> ( Model, Cmd msg )
init model =
    case model of
        Just model ->
            ( model, Cmd.none )
        Nothing ->
            ( defaultModel, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

port setStorage : Model -> Cmd msg

defaultModel: number
defaultModel = 0
type alias Model = Int

type Msg = Increment | Decrement

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  let
    newModel =
      case msg of
        Increment ->
          model + 1

        Decrement ->
          model - 1
      in
        (newModel, setStorage newModel)

view : model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]
