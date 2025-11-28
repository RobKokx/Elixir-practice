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

defmodule Auto do
  defstruct [:merk, :model, :jaar, kilometers: 0]

  def nieuwe_auto(merk, model, jaar) do
  %Auto{merk: merk, model: model, jaar: jaar}
  end

  def rijd(%Auto{} = auto, km) do
    %{auto | kilometers: auto.kilometers + km}
  end

  def info(%Auto{} = auto) do
    """
    Ik rijd in een #{auto.merk},
    Het is een #{auto.merk} #{auto.model}.
    De auto is #{auto.jaar} geleden gebouwd.
    Er is momenteel #{auto.kilometers} kilometer mee gereden.
    """
  end

end


# Maak structs
defmodule MakeStruct do
  def make_struct(:persoon, name, leeftijd,email) do
    %Persoon{naam: name, leeftijd: leeftijd, email: email}
  end

  def make_struct(:auto, merk, model, bouwjaar) do
    %Auto{merk: merk, model: model, jaar: bouwjaar}
  end
end

rob = MakeStruct.make_struct(:persoon, "Rob", 28, "r.roko@mail.test")

IO.puts(Persoon.begroet(rob))
IO.inspect(rob)


# Verjaardag!
rob_na_verjaardag = Persoon.verjaar(rob)
IO.puts("Na verjaardag: #{rob_na_verjaardag.leeftijd}")

mijn_auto = MakeStruct.make_struct(:auto, "toyota", "yaris", 21)
IO.inspect(mijn_auto)
na_rijden = Auto.rijd(mijn_auto, 241)
IO.inspect(na_rijden)
IO.puts(Auto.info(mijn_auto))
mijn_auto = Auto.rijd(mijn_auto, 5421)
IO.puts(Auto.info(mijn_auto))
