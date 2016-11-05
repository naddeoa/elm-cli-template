port module Main exposing (..)

import Html exposing (Html)
import Html.App
import Time


type alias Model =
    { message : String
    , times : Int
    }


empty : Model
empty =
    Model "" 0


type Msg
    = SayHi String
    | JavascriptResponded Model


port sayHello : Model -> Cmd a


port respondToHello : (Model -> a) -> Sub a


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ respondToHello JavascriptResponded
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SayHi greeting ->
            ( model, sayHello { model | times = model.times + 1, message = greeting } )

        JavascriptResponded model ->
            let
                message =
                    Debug.log "Javascript said" model
            in
                ( model, sayHello { model | times = model.times + 1, message = "Hey Javascript..." } )


view : Model -> Html a
view model =
    Html.text ""


init : Flags -> ( Model, Cmd Msg )
init flags =
    update (SayHi ("Hello " ++ flags.name)) empty


type alias Flags =
    { name : String
    }


main : Program Flags
main =
    Html.App.programWithFlags
        { update = update
        , view = view
        , init = init
        , subscriptions = subscriptions
        }
