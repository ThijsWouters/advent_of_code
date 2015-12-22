defmodule AdventOfCode.Day18.Grid do
  defstruct [:data]
  alias __MODULE__

  def new(data) when is_list(data) do
    %Grid{data: list_to_data(data)}
  end

  defp list_to_data(data) do
    data
    |> Enum.map(&List.to_tuple/1)
    |> List.to_tuple
  end

  defp new_data(size, producer_fun) do
    Enum.map(0..(size - 1), fn y ->
      Enum.map(0..(size - 1), fn x ->
        producer_fun.(x, y)
      end)
    end)
    |> list_to_data
  end

  def size(%Grid{data: grid}) do
    tuple_size(grid)
  end

  defp cell_status(_, x, y) when x < 0 or y < 0, do: 0
  defp cell_status(grid, x, y) when tuple_size(grid) <= x or tuple_size(grid) <= y, do: 0
  defp cell_status(_, 0, 0), do: 1
  defp cell_status(grid, 0, y) when tuple_size(grid)-1 == y, do: 1
  defp cell_status(grid, x, 0) when tuple_size(grid)-1 == x, do: 1
  defp cell_status(grid, x, y) when tuple_size(grid)-1 == x and tuple_size(grid)-1 == y, do: 1
  defp cell_status(grid, x, y) do
    grid
    |> elem(y)
    |> elem(x)
  end

  def next(grid = %Grid{data: data}) do
    %Grid{data: new_data(size(grid), &next_cell_status(data, &1, &2))}
  end

  defp next_cell_status(_, 0, 0), do: 1
  defp next_cell_status(grid, 0, y) when tuple_size(grid)-1 == y, do: 1
  defp next_cell_status(grid, x, 0) when tuple_size(grid)-1 == x, do: 1
  defp next_cell_status(grid, x, y) when tuple_size(grid)-1 == x and tuple_size(grid)-1 == y, do: 1
  defp next_cell_status(grid, x, y) do
    case {cell_status(grid, x, y), alive_neighbours(grid, x, y)} do
      {1, 2} -> 1
      {1, 3} -> 1
      {0, 3} -> 1
      {_, _} -> 0
    end
  end

  defp alive_neighbours(grid, x, y) do
    total = Enum.map((y-1)..(y+1), fn y ->
      Enum.map((x-1)..(x+1), fn x ->
        cell_status(grid, x, y)
      end)
    end)
    |> List.flatten
    |> Enum.sum
    total - cell_status(grid, x, y)
  end
end

defimpl String.Chars, for: AdventOfCode.Day18.Grid do
  def to_string(%AdventOfCode.Day18.Grid{data: data}) do
    Tuple.to_list(data)
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(fn row ->
      Enum.map(row, fn
        1 -> "#"
        0 -> "."
      end)
      |> Enum.join
    end)
    |> Enum.join("\n")
  end
end
