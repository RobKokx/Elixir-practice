# oefening5.exs

defmodule Rekenmachine do
  def bereken(:plus, a, b), do: a + b
  def bereken(:min, a, b), do: a - b
  def bereken(:keer, a, b), do: a * b
  def bereken(:deel, a, b), do: a / b
  #macht functie
  def bereken(:macht, a, b), do: :math.pow(a, b)
end

IO.puts("10 + 5 = #{Rekenmachine.bereken(:plus, 10, 5)}")
IO.puts("10 - 5 = #{Rekenmachine.bereken(:min, 10, 5)}")
IO.puts("10 * 5 = #{Rekenmachine.bereken(:keer, 10, 5)}")
IO.puts("10 / 5 = #{Rekenmachine.bereken(:deel, 10, 5)}")
#macht functie uitslag uitprinten
IO.puts("10 ^ 5 = #{Rekenmachine.bereken(:macht, 10, 5)}")
