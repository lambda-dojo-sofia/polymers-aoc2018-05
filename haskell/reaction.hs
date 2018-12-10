import Data.Char

polarity :: Char -> Char
polarity x = if isLower x then toUpper x else toLower x

canReact :: Char -> Char -> Bool
canReact x y = x == polarity y

loop [] = []
loop (x:y:ys) = if canReact x y then loop ys else [x]++(loop ([y]++ys))
loop (x:xs) = [x]

solve xs = let solution = loop xs
           in if solution == xs then solution else solve solution


