open Tea.App
open Tea.Html

type model = {counter: int}

let init () = {counter= 0}

type msg = Increment | Decrement | Reset

let update model = function
  | Increment -> {counter= model.counter + 1}
  | Decrement -> {counter= model.counter - 1}
  | Reset -> {counter= 0}


let view model =
  div
    [styles [("text-align", "center")]]
    [ div [] [text (string_of_int model.counter)]
    ; button [onClick Increment] [text "Increment"]
    ; button [onClick Decrement] [text "Decrement"]
    ; button [onClick Reset] [text "Reset"] ]


let main = beginnerProgram {model= init (); update; view}
