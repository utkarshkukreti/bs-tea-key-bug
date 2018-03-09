open Tea.App
open Tea.Html

type model = {order: bool; username: string; password: string}

let init () = {order= true; username= "foo"; password= "bar"}

type msg = Swap | Username of string | Password of string

let update model = function
  | Swap -> {model with order= not model.order}
  | Username username -> {model with username}
  | Password password -> {model with password}


let view model =
  let a =
    div ~key:"username" []
      [input' [onInput (fun s -> Username s)] []; text model.username]
  in
  let b =
    div ~key:"password" []
      [ input' [type' "password"; onInput (fun s -> Password s)] []
      ; text model.password ]
  in
  div []
    [ div [] (if model.order then [a; b] else [b; a])
    ; button [onClick Swap] [text "Swap"] ]


let main = beginnerProgram {model= init (); update; view}
