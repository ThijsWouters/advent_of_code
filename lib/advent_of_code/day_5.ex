defmodule AdventOfCode.Day5 do
  def count_nice(input) do
    String.split(input, "\n")
    |> Enum.count(&nice?/1)
  end

  def nice?(string) do
    at_least_three_vowels?(string) &&
    at_least_one_letter_twice_in_a_row(string) &&
    !contains_illegal_sequence(string)
  end

  defp at_least_three_vowels?(string) do
    string =~ ~r/[aeiou].*[aeiou].*[aeiou]/
  end

  defp at_least_one_letter_twice_in_a_row(string) do
    string =~ ~r/([a-z])\1/
  end

  defp contains_illegal_sequence(string) do
    string =~ ~r/(ab|cd|pq|xy)/
  end
end
