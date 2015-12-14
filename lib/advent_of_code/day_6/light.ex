defmodule AdventOfCode.Day6.Light do
  def new, do: false
  def act(:turn_on, _), do: true
  def act(:turn_off, _), do: false
  def act(:toggle, true), do: false
  def act(:toggle, false), do: true
end
