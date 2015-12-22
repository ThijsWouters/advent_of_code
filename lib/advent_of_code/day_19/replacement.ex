defmodule AdventOfCode.Day19.Replacement do
  defstruct [:from, :to]
  alias __MODULE__

  def parse(string) do
    Regex.named_captures(~r/(?<from>.+) => (?<to>.+)/, string)
    |> from
  end

  def from(%{"from" => from, "to" => to}) do
    %Replacement{from: from, to: to}
  end

  def replace(%Replacement{from: from, to: to}, string) do
    {:ok, regex} = Regex.compile(from)
    case string =~ regex do
      true ->
        Regex.split(regex, string)
        |> Enum.chunk(2, 1)
        |> split_in_pre_and_post([], [])
        |> Enum.map(&replace(&1, from, to))
      false -> []
    end
  end

  defp split_in_pre_and_post([], _, acc), do: acc
  defp split_in_pre_and_post([head|post], pre, acc) do
    acc = List.insert_at(acc, -1, {pre, head, post})
    split_in_pre_and_post(post, List.insert_at(pre, -1, head), acc)
  end

  defp replace({pre, current, post}, from, to) do
    pre = Enum.map(pre, &List.replace_at(&1, 1, from))
    |> Enum.map(&Enum.join/1)
    |> Enum.join
    current = Enum.intersperse(current, to)
    |> Enum.join
    post = Enum.map(post, &List.replace_at(&1, 0, from))
    |> Enum.map(&Enum.join/1)
    |> Enum.join
    "#{pre}#{current}#{post}"
  end
end
