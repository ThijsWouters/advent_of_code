defmodule AdventOfCode.Day5 do
  def count_nice(input) do
    String.split(input, "\n")
    |> Enum.count(&nice?/1)
  end

  def nice?(string) do
    letter_pair_appears_at_least_twice(string) &&
    repeat_with_one_letter_in_between(string)
  end

  defp letter_pair_appears_at_least_twice(string) do
    string =~ ~r/([a-zA-Z]{2}).*\1/
  end

  defp repeat_with_one_letter_in_between(string) do
    string =~ ~r/([a-zA-Z]).\1/
  end
end
