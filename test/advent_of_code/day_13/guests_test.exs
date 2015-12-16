defmodule AdventOfCode.Day13.GuestsTest do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day13.Guests

  setup do
    guests = Guests.new
    |> Guests.add("Alice", "Bob", 12)
    |> Guests.add("Bob", "Alice", -15)
    {:ok, guests: guests}
  end

  test "you can add two guests", %{guests: guests} do
    assert Guests.happiness(guests, "Alice", "Bob") == 12
  end

  test "reverse can be different", %{guests: guests} do
    assert Guests.happiness(guests, "Bob", "Alice") == -15
  end

  test "you can get all the guests", %{guests: guests} do
    assert Guests.all(guests) == ["Alice", "Bob"]
  end
end
