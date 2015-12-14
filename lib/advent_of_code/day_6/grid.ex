defmodule AdventOfCode.Day6.Grid do
  alias AdventOfCode.Day6.Light
  alias __MODULE__

  def new(rows \\ 1000, columns \\ 1000) do
    Enum.map(1..rows, fn _ ->
      Enum.map(1..columns, fn _ -> Light.new end)
    end)
  end

  def act(grid, action, start_coord, end_coord) do
    grid
    |> Enum.with_index
    |> Enum.map(&act_on_row(&1, action, start_coord, end_coord))
  end

  defp act_on_row({row, index}, action, {start_x, start_y}, {end_x, end_y}) do
    if index >= start_x and index <= end_x do
      row
      |> Enum.with_index
      |> Enum.map(&act_on_cell(&1, action, start_y, end_y))
    else
      row
    end
  end

  defp act_on_cell({cell, index}, action, start_y, end_y) when index >= start_y and index <= end_y do
    Light.act(action, cell)
  end
  defp act_on_cell({cell, _}, _, _, _), do: cell
end
