defmodule AdventOfCode.Day1 do
  @doc """
  iex> AdventOfCode.Day1.floor("(())")
  0

  iex> AdventOfCode.Day1.floor("()()")
  0

  iex> AdventOfCode.Day1.floor("(((")
  3

  iex> AdventOfCode.Day1.floor("(()(()(")
  3

  iex> AdventOfCode.Day1.floor("))(((((")
  3

  iex> AdventOfCode.Day1.floor("())")
  -1

  iex> AdventOfCode.Day1.floor("))(")
  -1

  iex> AdventOfCode.Day1.floor(")))")
  -3

  iex> AdventOfCode.Day1.floor(")())())")
  -3
  """
  def floor(input) when is_binary(input) do
    String.graphemes(input)
    |> floor
  end

  def floor(list) when is_list(list) do
    Enum.map(list, &up_or_down/1)
    |> Enum.reduce(0, &+/2)
  end

  defp up_or_down("("), do: 1
  defp up_or_down(")"), do: -1

  @doc """
  iex> AdventOfCode.Day1.first_time_in_basement(")")
  1

  iex> AdventOfCode.Day1.first_time_in_basement("()())")
  5
  """
  def first_time_in_basement(input) when is_binary(input) do
    case Enum.map((1..String.length(input)), fn length -> String.slice(input, 0, length) end)
    |> Enum.map(&floor/1)
    |> Enum.find_index(fn floor -> floor < 0 end) do
      nil -> :never
      result -> result + 1
    end
  end
end
