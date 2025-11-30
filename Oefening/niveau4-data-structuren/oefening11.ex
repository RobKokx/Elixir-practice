# oefening11.exs

defmodule Berekeningen do
  # Return tuple met meerdere waarden
  def deel_met_rest(a, b) do
    quotient = div(a, b)
    rest = rem(a, b)
    {:ok, quotient, rest}
  end

  # Return :error tuple als het niet kan
  def veilig_delen(_a, 0) do
    {:error, "Kan niet delen door nul!"}
  end

  def veilig_delen(a, b) do
    {:ok, a / b}
  end

  # Pattern match op de return value
  def print_resultaat(a, b) do
    case veilig_delen(a, b) do
      {:ok, resultaat} ->
        IO.puts("Resultaat: #{resultaat}")

      {:error, bericht} ->
        IO.puts("Error: #{bericht}")
    end
  end
end

# Gebruik tuples
{:ok, quotient, rest} = Berekeningen.deel_met_rest(10, 3)
IO.puts("10 / 3 = #{quotient} rest #{rest}")

Berekeningen.print_resultaat(10, 2)
Berekeningen.print_resultaat(10, 0)

defmodule CheckTheNumber do
  def check_number(getal) when getal > 0 do
    {:positief, getal}
  end

  def check_number(getal) when getal < 0 do
    {:negatief, getal}
  end

  def check_number(getal) when getal == 0 do
    {:isNul, getal}
  end


  def print(getal) do
    case check_number(getal) do
      {:positief, getal} ->
        IO.puts("het getal #{getal} is positief")

      {:negatief, getal} ->
        IO.puts("het getal #{getal} is negatief")

      {:isNul, getal} ->
        IO.puts("het getal #{getal} is nul")
    end
  end
end

CheckTheNumber.print(15)
CheckTheNumber.print(-4)
CheckTheNumber.print(0)
