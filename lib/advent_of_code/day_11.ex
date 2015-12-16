defmodule AdventOfCode.Day11 do
  def next_valid_password(old) do
    Stream.iterate(old, &password/1)
    |> Stream.drop(1)
    |> Stream.filter(&valid?/1)
    |> Enum.fetch!(0)
  end

  def password(password) do
    password
    |> String.reverse
    |> split_until_no_z
    |> increase
    |> String.reverse
  end

  defp split_until_no_z(string) do
    Regex.named_captures(~r/(?<to_increase>z*.)(?<rest>.*)/, string)
  end

  defp increase("z"), do: "a"
  defp increase(<< letter :: utf8 >>), do: << letter + 1 :: utf8 >>
  defp increase(%{"to_increase" => to_increase, "rest" => rest}) do
    "#{increase(to_increase)}#{rest}"
  end
  defp increase(string) do
    string
    |> String.graphemes
    |> Enum.map(&increase/1)
    |> Enum.join
  end

  def valid?(password) do
    increasing_straigth(String.graphemes(password)) and
    not String.contains?(password, ["i", "o", "l"]) and
    password =~ ~r/((.)\2).*((?!\1).)\3/
  end

  defp increasing_straigth(list) when length(list) <= 2, do: false
  defp increasing_straigth([first | rest]) do
    if increasing_straigth(first, rest) do
      true
    else
      increasing_straigth(rest)
    end
  end

  defp increasing_straigth(_, list) when length(list) <= 1, do: false
  defp increasing_straigth(first, [second | rest]) do
    if increasing_straigth(first, second, rest) do
      true
    else
      increasing_straigth(rest)
    end
  end

  defp increasing_straigth(_, _, []), do: false
  defp increasing_straigth(first, second, [third | rest]) do
    if increasing_straigth(first, second, third) do
      true
    else
      increasing_straigth(rest)
    end
  end

  defp increasing_straigth("z", _, _), do: false
  defp increasing_straigth(_, "z", _), do: false
  defp increasing_straigth(first, second, third) do
    increase(first) == second && increase(second) == third
  end
end
