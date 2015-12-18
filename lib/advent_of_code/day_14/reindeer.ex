defmodule AdventOfCode.Day14.Reindeer do
  defstruct [:name, :speed, :flying_time, :resting_time]
  alias __MODULE__

  def parse(string) do
    case Regex.named_captures(~r/^(?<name>.+) can fly (?<speed>\d+) km\/s for (?<flying_time>\d+) seconds, but then must rest for (?<resting_time>\d+) seconds.$/, string) do
      %{"name" => name, "speed" => speed, "flying_time" => flying_time, "resting_time" => resting_time} ->
        %Reindeer {
          name: name,
          speed: String.to_integer(speed),
          flying_time: String.to_integer(flying_time),
          resting_time: String.to_integer(resting_time),
        }
    end
  end
  
  def distance_after(reindeer, seconds) do
    reindeer.speed * reindeer.flying_time * full_cycles(reindeer, seconds) +
    reindeer.speed * remaining_flying_time(reindeer, seconds)
  end

  defp full_cycles(reindeer, seconds) do
    div(seconds, total_cycle_time(reindeer))
  end

  defp remaining_flying_time(reindeer, seconds) do
    Enum.min([
      rem(seconds, total_cycle_time(reindeer)),
      reindeer.flying_time
    ])
  end

  defp total_cycle_time(reindeer) do
    reindeer.flying_time + reindeer.resting_time
  end
end
