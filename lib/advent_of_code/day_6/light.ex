defmodule AdventOfCode.Day6.Light do
  def new, do: 0
  def act(:turn_on, value), do: value + 1
  def act(:turn_off, 0), do: 0
  def act(:turn_off, value), do: value - 1
  def act(:toggle, value), do: value + 2
end
