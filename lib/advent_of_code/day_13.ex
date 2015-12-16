defmodule AdventOfCode.Day13 do
  alias AdventOfCode.Day13.Guests

  def most_happiness(input) do
    String.split(input, "\n")
    |> parse
    |> most_happiness
  end

  def most_happiness(guests) do
    Permutations.permute(Guests.all(guests))
    |> Enum.map(fn seating_arrangement ->
      List.insert_at(seating_arrangement, -1, Enum.fetch!(seating_arrangement, 0))
    end)
    |> Enum.map(fn seating_arrangement ->
      {seating_arrangement,
        total_happiness(seating_arrangement, guests) + total_happiness(Enum.reverse(seating_arrangement), guests)}
    end)
    |> Enum.max_by(fn {_, happiness} -> happiness end)
  end

  defp total_happiness([], _), do: 0
  defp total_happiness([head|tail], guests) do
    total_happiness(head, tail, guests)
  end

  defp total_happiness(_, [], _), do: 0
  defp total_happiness(guest_1, [guest_2 | rest], guests) do
    Guests.happiness(guests, guest_1, guest_2) + total_happiness(guest_2, rest, guests)
  end

  defp parse(input) do
    input
    |> Enum.map(&Regex.named_captures(~r/(?<guest_1>.*) would (?<gain_loss>(?:gain|lose)) (?<happiness>\d+) happiness units by sitting next to (?<guest_2>.*)\./, &1))
    |> Enum.reduce(Guests.new, &add_guest/2)
  end

  defp add_guest(%{"guest_1" => guest_1, "guest_2" => guest_2, "gain_loss" => "gain", "happiness" => happiness}, guests) do
    Guests.add(guests, guest_1, guest_2, to_i(happiness))
  end

  defp add_guest(%{"guest_1" => guest_1, "guest_2" => guest_2, "gain_loss" => "lose", "happiness" => happiness}, guests) do
    Guests.add(guests, guest_1, guest_2, -to_i(happiness))
  end

  defp to_i(string) do
    {integer, ""} = Integer.parse(string)
    integer
  end
end
