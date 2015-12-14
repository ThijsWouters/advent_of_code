defmodule AdventOfCode.Day6.Light do
  def act(:turn_on, _), do: true
  def act(:turn_off, _), do: false
  def act(:toggle, true), do: false
  def act(:toggle, false), do: true
end
