open Tea.App
open Tea.Html

type counter = {id: int; value: int}

type model = counter list

let init () = [{id= 0; value= 0}; {id= 1; value= 1}; {id= 2; value= 2}]

type msg = Increment of int

let update model = function
  | Increment id ->
      Belt.List.map model (fun counter ->
          if counter.id = id then {counter with value= counter.value + 1}
          else counter )


let view model =
  let () =
    Belt.List.map model (fun counter -> counter.value) |> Belt.List.toArray
    |> Js.log
  in
  div []
    (Belt.List.map model (fun counter ->
         div ~key:(string_of_int counter.id) []
           [ span [] [text (" " ^ string_of_int counter.value ^ " ")]
           ; button [onClick (Increment counter.id)] [text "+"] ] ))


let main = beginnerProgram {model= init (); update; view}
