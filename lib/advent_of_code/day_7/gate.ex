defprotocol AdventOfCode.Day7.Gate do
  def print(gate, circuit)
  def signal?(gate)
  def solve(gate, signals)
end
