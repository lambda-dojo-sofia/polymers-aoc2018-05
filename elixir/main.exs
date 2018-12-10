range = 65..90

input = "dabAcCaCBAcCcaDA"

def react(x, acc) do
  ul = <<x::utf8>> <> <<x+32::utf8>>
  lu = <<x+32::utf8>> <> <<x::utf8>>
  local = String.replace(input, Regex.compile(ul), "")
  String.replace(local, ~r/lu/, "")
end

Enum.reduce(range, input, react)
