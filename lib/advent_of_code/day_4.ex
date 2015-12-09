defmodule AdventOfCode.Day4 do
  alias AdventOfCode.Day4.Crypto

  def mine(input) do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.map(&to_string/1)
    |> Stream.map(&concat(input, &1))
    |> Stream.map(&Crypto.md5/1)
    |> Stream.map(&String.rjust(&1, 32, ?0))
    |> Enum.find_index(&five_leading_zeroes/1)
    |> add_one
  end

  defp concat(string1, string2) do
    "#{string1}#{string2}"
  end

  defp five_leading_zeroes(string) do
    String.starts_with?(string, "000000")
  end

  defp add_one(index) do
    index + 1
  end
end
