# oefening8.exs

defmodule Teller do
  def tel_tot(0), do: IO.puts("Klaar!")

  def tel_tot(n) do
    IO.puts(n)
    tel_tot(n - 1)
  end
end

Teller.tel_tot(5)

defmodule Accumulate do
  def tel_op_tot(0, acc), do: acc

  def tel_op_tot(n, acc) when n > 0 do
    acc_totaal = acc + n
    new_n = n - 1
    tel_op_tot(new_n, acc_totaal)
  end
end

IO.inspect(Accumulate.tel_op_tot(5, 0))
