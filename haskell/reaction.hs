import Data.Char

polarity :: Char -> Char
polarity x = if isLower x then toUpper x else toLower x

canReact :: Char -> Char -> Bool
canReact x y = x == polarity y

-- first solution, using recursion until loop stops returning a different result

loop [] = []
loop (x:y:ys) = if canReact x y then loop ys else [x]++(loop ([y]++ys))
loop (x:xs) = [x]

solve xs = let solution = loop xs
           in if solution == xs then solution else solve solution

-- second solution using foldr:

solve2 xs = foldr f' [] xs
f' x [] = [x]
f' x acc = if canReact (head acc) x then tail acc else x:acc

