defmodule Aoc do

  def load_polymer(file_name) do
    case File.read(file_name) do
      {:ok, body}      ->  to_charlist body
      {:error, reason} -> IO.puts "Error: #{reason}"
    end
  end

  def compact_polymer(polymer_chain, compacted_chain) do
    case polymer_chain do
      [] -> compacted_chain
      [current_unit | polymer_tail] ->  case compacted_chain do
                                          [] -> compact_polymer(polymer_tail, compacted_chain ++ to_charlist current_unit)
                                          [last_unit | compacted_tail ] ->
                                            if (abs (last_unit - hd current_unit) == 32) do
                                              compact_polymer(polymer_tail, compacted_tail)
                                            else
                                              compact_polymer(polymer_tail, compacted_chain ++ to_charlist current_unit)
                                            end
                                        end
    end
  end
end

#polymer_content = Aoc.load_polymer("../input/input.txt")
IO.puts Aoc.compact_polymer('abc', '')
