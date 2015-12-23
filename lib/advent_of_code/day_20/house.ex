defmodule AdventOfCode.Day20.House do
  def presents(number) do
    sum = dividers(number)
    |> Enum.filter(fn n -> div(number, n) <= 50 end)
    |> Enum.sum
    sum * 11
  end

  defp dividers(n) do
    e = n |> :math.sqrt |> trunc
    (1..e)
    |> Enum.flat_map(fn
      x when rem(n, x) != 0 -> []
      x when x != div(n, x) -> [x, div(n, x)]
      x -> [x]
    end)
  end
end
