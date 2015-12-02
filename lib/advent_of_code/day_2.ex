defmodule AdventOfCode.Day2 do
  defmodule Package do
    defstruct [:height, :length, :width]

    def paper(%Package{height: height, length: length, width: width}) do
      first = length * height
      second = length * width
      third = height * width
      2*first + 2*second + 2*third + Enum.min([first, second, third])
    end

    def from_string(""), do: :error
    def from_string(string) do
      [height, length, width] = String.split(string, "x")
      |> Enum.map(&Integer.parse/1)
      |> Enum.map(fn {int, ""} -> int end)

      %Package{height: height, length: length, width: width}
    end
  end

  @doc """
  iex> paper("2x3x4")
  58

  iex> paper("1x1x10")
  43
  """
  def paper(input) do
    parse(input)
    |> Enum.reject(&error?/1)
    |> Enum.map(&Package.paper/1)
    |> Enum.reduce(0, &+/2)
  end

  defp parse(input) do
    String.split(input, "\n")
    |> Enum.map(&Package.from_string/1)
  end

  defp error?(:error), do: true
  defp error?(_), do: false
end
