defmodule AdventOfCode.Day9.TownsTest do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day9.Towns
  
  setup do
    {:ok, towns: Towns.new}
  end

  test "you can add a route", %{towns: towns} do
    towns = Towns.add_route(towns, "first", "second", 12)
    assert Towns.distance(towns, "first", "second") == 12
  end

  test "the reverse route is the same", %{towns: towns} do
    towns = Towns.add_route(towns, "first", "second", 12)
    assert Towns.distance(towns, "second", "first") == 12
  end
end
