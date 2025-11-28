# oefening12.exs

defmodule Persoon do
  # Definieer de struct
  defstruct [:naam, :leeftijd, :email, stad: "Onbekend"]  # stad heeft default

  # Helper functie om nieuwe persoon te maken
  def nieuw(naam, leeftijd) do
    %Persoon{naam: naam, leeftijd: leeftijd}
  end

  # Functie die alleen op Persoon struct werkt
  def begroet(%Persoon{naam: naam}) do
    "Hoi #{naam}!"
  end

  # Update leeftijd
  def verjaar(%Persoon{} = persoon) do
    %{persoon | leeftijd: persoon.leeftijd + 1}
  end
end

# Maak structs
rob = %Persoon{naam: "Rob", leeftijd: 28, stad: "Oss"}
piet = Persoon.nieuw("Piet", 25)

IO.puts(Persoon.begroet(rob))
IO.inspect(rob)

# Verjaardag!
rob_na_verjaardag = Persoon.verjaar(rob)
IO.puts("Na verjaardag: #{rob_na_verjaardag.leeftijd}")
