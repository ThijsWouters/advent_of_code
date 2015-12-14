defmodule AdventOfCode.Day6.LightTest do
  use ExUnit.Case
  alias AdventOfCode.Day6.Light

  test "turn_on: an off lamp turns on" do
    assert Light.act(:turn_on, false) == true
  end

  test "turn_on: an on lamp stays on" do
    assert Light.act(:turn_on, true) == true
  end

  test "turn_off: an off lamp stays off" do
    assert Light.act(:turn_off, false) == false
  end

  test "turn_off: an on lamp turns off" do
    assert Light.act(:turn_off, true) == false
  end

  test "toggle: an on lamp turns off" do
    assert Light.act(:toggle, true) == false
  end

  test "toggle: an off lamp turns on" do
    assert Light.act(:toggle, false) == true
  end
end
