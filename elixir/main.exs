
defmodule Polymer do
  def iter(str, acc \\ "", n) when n >= 2 do
    hd = head(str)
    tl = tail(str)
    nxt = next(str)
    if react?(hd, nxt) do
      iter(last(acc) <> (tail (tl)), drop(acc, 1), n - 1)
    else
      iter(tl, acc <> hd, n - 1)
    end
  end

  def iter(str, acc \\ "", n) when n <= 1 do
    acc <> str
  end

  def iter(str, acc, n) do
    acc
  end

  def react?(letter1, letter2) do
    32 == abs((hd (to_charlist letter1)) - (hd (to_charlist letter2)))
  end

  def head(str) do String.at(str, 0) end
  def tail(str) do String.slice(str, 1..-1) end
  def next(str) do String.at(str, 1) end
  def drop(str, n) do String.slice(str, 0.. (-1 - n)) end
  def last(str) do String.last(str) end
end

test_input = "dabAcCaCBAcCcaDA"
test_input_length = String.length(test_input)

IO.puts Polymer.iter(test_input, test_input_length)
