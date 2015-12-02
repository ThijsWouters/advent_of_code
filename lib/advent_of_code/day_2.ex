defmodule AdventOfCode.Day2 do
  defmodule Package do
    defstruct [:height, :length, :width]

    def from_string(""), do: :error
    def from_string(string) do
      [height, length, width] = String.split(string, "x")
      |> Enum.map(&Integer.parse/1)
      |> Enum.map(fn {int, ""} -> int end)

      %Package{height: height, length: length, width: width}
    end

    def paper(package) do
      surface(package) + Enum.min(each_surface(package))
    end

    def surface(package) do
      Enum.reduce(each_surface(package), 0, &+/2)
    end

    defp each_surface(%Package{height: height, length: length, width: width}) do
      surfaces = [length * height, length * width, height * width]
      Enum.concat(surfaces, surfaces)
    end

    def ribbon(package = %Package{height: height, length: length, width: width}) do
      2 * (height + length + width - Enum.max([height, length, width])) + volume(package)
    end

    def volume(%Package{height: height, length: length, width: width}) do
      height * length * width
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

  @doc """
  iex> ribbon("2x3x4")
  34

  iex> ribbon("1x1x10")
  14
  """
  def ribbon(input) do
    parse(input)
    |> Enum.reject(&error?/1)
    |> Enum.map(&Package.ribbon/1)
    |> Enum.reduce(0, &+/2)
  end

  defp parse(input) do
    String.split(input, "\n")
    |> Enum.map(&Package.from_string/1)
  end

  defp error?(:error), do: true
  defp error?(_), do: false
end
