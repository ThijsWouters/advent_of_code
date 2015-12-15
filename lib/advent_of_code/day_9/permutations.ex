defmodule Permutations do
  def permute([]), do: [[]]
  def permute(list) do
    for x <- list, y <- permute(list -- [x]), do: [x|y]
  end
end
