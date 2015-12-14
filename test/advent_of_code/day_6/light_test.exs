defmodule AdventOfCode.Day6.LightTest do
  use ExUnit.Case
  alias AdventOfCode.Day6.Light

  test "a new light is off" do
    assert Light.new == 0
  end

  test "turn_on: an off lamp turns on" do
    assert Light.act(:turn_on, 0) == 1
  end

  test "turn_on: an on lamp gets brighter" do
    assert Light.act(:turn_on, 1) == 2
  end

  test "turn_off: an off lamp stays off" do
    assert Light.act(:turn_off, 0) == 0
  end

  test "turn_off: an on lamp turns off" do
    assert Light.act(:turn_off, 1) == 0
  end

  test "turn_off: an bright lamp gets dimmer" do
    assert Light.act(:turn_off, 2) == 1
  end

  test "toggle: an on lamp turns brighter" do
    assert Light.act(:toggle, 1) == 3
  end

  test "toggle: an off lamp turns brighter" do
    assert Light.act(:toggle, 0) == 2
  end
end
