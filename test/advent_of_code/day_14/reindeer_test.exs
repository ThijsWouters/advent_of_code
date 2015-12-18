defmodule AdventOfCode.Day14.ReindeerTest do
  use ExUnit.Case, async: false
  alias AdventOfCode.Day14.Reindeer

  setup do
    reindeer = %Reindeer{
      name: "Comet",
      speed: 2,
      flying_time: 5,
      resting_time: 10
    }
    {:ok, reindeer: reindeer}
  end

  test "a reindeer has a name", %{reindeer: reindeer} do
    assert reindeer.name == "Comet"
  end

  test "a reindeer has a speed", %{reindeer: reindeer} do
    assert reindeer.speed == 2
  end

  test "a reindeer has a flying time", %{reindeer: reindeer} do
    assert reindeer.flying_time == 5
  end

  test "a reindeer has a resting time", %{reindeer: reindeer} do
    assert reindeer.resting_time == 10
  end

  test "after 1 second the reindeer has traveled 2 km", %{reindeer: reindeer} do
    assert Reindeer.distance_after(reindeer, 1) == 2
  end

  test "after 5 seconds the reindeer has traveled 10 km", %{reindeer: reindeer} do
    assert Reindeer.distance_after(reindeer, 5) == 10
  end

  test "after 6 seconds the reindeer has traveled 10 km", %{reindeer: reindeer} do
    assert Reindeer.distance_after(reindeer, 6) == 10
  end

  test "after 15 seconds the reindeer has traveled 10 km", %{reindeer: reindeer} do
    assert Reindeer.distance_after(reindeer, 15) == 10
  end

  test "after 16 seconds the reindeer has traveled 12 km", %{reindeer: reindeer} do
    assert Reindeer.distance_after(reindeer, 16) == 12
  end

  test "after 20 seconds the reindeer has traveled 20 km", %{reindeer: reindeer} do
    assert Reindeer.distance_after(reindeer, 20) == 20
  end

  test "after 21 seconds the reindeer has traveled 20 km", %{reindeer: reindeer} do
    assert Reindeer.distance_after(reindeer, 21) == 20
  end

  test "a reindeer can be parsed from a string" do
    assert Reindeer.parse("Prancer can fly 25 km/s for 6 seconds, but then must rest for 143 seconds.") ==
    %Reindeer{name: "Prancer", speed: 25, flying_time: 6, resting_time: 143}
  end
end
