defmodule AdventOfCode.Day10 do
  def solve(seed, times) do
    Stream.iterate(seed, &look_and_say/1)
    |> Enum.fetch!(times)
  end

  def look_and_say(string) do
    split_in_same_chars(string)
    |> Enum.map(&Task.async(fn ->
      calculate(&1)
    end))
    |> Enum.map(&Task.await/1)
    |> Enum.join
  end

  defp calculate(list = [head | _]) do
    "#{length(list)}#{head}"
  end

  defp split_in_same_chars(string) do
    String.graphemes(string)
    |> Enum.chunk_by(fn grapheme -> grapheme end)
  end
end
