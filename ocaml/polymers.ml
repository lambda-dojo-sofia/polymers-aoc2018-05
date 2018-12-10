let rec processPair input a =
    if abs ((Char.code input.[a]) - (Char.code input.[a+1])) =
       abs ((Char.code 'a') - (Char.code 'A'))
    then processPair ((String.sub input 0 a) ^
                      (String.sub input (a+2) ((String.length input) - (a+2)))) 0
    else
        if a >= (String.length input) - 2
        then input
        else processPair input (a+1)

let process input = processPair input 0

let () =
    let input = read_line () in
    print_endline (process input)
