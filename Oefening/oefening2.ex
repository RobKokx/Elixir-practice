# oefening2.exs

defmodule PrintTheCalcs do
  def make_calcs(a, b) do
    som = a + b
    verschil = a - b
    product = a * b
    quotient = a / b
    rest = rem(a, b)

    {som, verschil, product, quotient, rest}
  end

  def print(a, b, som, verschil, product, quotient, rest) do
    IO.puts(" ")
    IO.puts("#{a} + #{b} = #{som}")
    IO.puts("#{a} - #{b} = #{verschil}")
    IO.puts("#{a} * #{b} = #{product}")
    IO.puts("#{a} / #{b} = #{quotient}")
    IO.puts("Rest van #{a} / #{b} = #{rest}")
  end

  def calcAndPrint(a, b) do
    {som, verschil, product, quotient, rest} = make_calcs(a, b)
    print(a, b, som, verschil, product, quotient, rest)
  end
end

a = 10
b = 3

PrintTheCalcs.calcAndPrint(a, b)

a = 20
b = 6

PrintTheCalcs.calcAndPrint(a, b)

a = 2
b = 87

PrintTheCalcs.calcAndPrint(a, b)
