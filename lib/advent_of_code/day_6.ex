defmodule AdventOfCode.Day6 do
  alias AdventOfCode.Day6.Grid

  def display_lights(input) do
    String.split(input, "\n")
    |> Enum.map(&parse/1)
    |> Enum.reduce(Grid.new(1000, 1000), fn {action, start_coord, end_coord}, grid ->
      Grid.act(grid, action, start_coord, end_coord)
    end)
  end

  defp to_atom("toggle"), do: :toggle
  defp to_atom("turn on"), do: :turn_on
  defp to_atom("turn off"), do: :turn_off

  defp to_i(string) do
    {integer, _} = Integer.parse(string)
    integer
  end

  defp parse(%{"action" => action, "start_x" => start_x, "start_y" => start_y, "end_x" => end_x, "end_y" => end_y}) do
    { to_atom(action), {to_i(start_x), to_i(start_y)}, {to_i(end_x), to_i(end_y)} }
  end

  defp parse(line) do
    ~r/^(?<action>.*) (?<start_x>\d+),(?<start_y>\d+) through (?<end_x>\d+),(?<end_y>\d+)$/
    |> Regex.named_captures(line)
    |> parse
  end
end
