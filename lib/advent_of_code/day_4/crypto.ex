defmodule AdventOfCode.Day4.Crypto do
  def md5(input) do
    input
    |> :crypto.md5
    |> :erlang.bitstring_to_list
    |> Enum.map(&integer_to_binary/1)
    |> :erlang.list_to_binary
  end

  defp integer_to_binary(integer) when integer < 16 do
    "0#{:erlang.integer_to_binary(integer, 16)}"
  end

  defp integer_to_binary(integer) do
    :erlang.integer_to_binary(integer, 16)
  end
end
