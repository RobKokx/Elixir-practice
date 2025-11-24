# oefening10.exs

defmodule Persooninfo do
  # Extract alleen naam uit de map
  def print_naam(%{naam: naam}) do
    "Hallo, #{naam}!"
  end

  # Extract meerdere waarden
  def print_info(%{naam: naam, leeftijd: leeftijd}) do
    "#{naam} is #{leeftijd} jaar oud"
  end

  # Check specifieke waarde
  def is_volwassen(%{leeftijd: leeftijd}) when leeftijd >= 18 do
    "Volwassen"
  end

  def is_volwassen(%{leeftijd: _leeftijd}) do
    "Minderjarig"
  end
end

rob = %{naam: "Rob", leeftijd: 28, stad: "Oss"}
kind = %{naam: "Lisa", leeftijd: 12}

IO.puts(Persooninfo.print_naam(rob))
IO.puts(Persooninfo.print_info(rob))
IO.puts(Persooninfo.is_volwassen(rob))
IO.puts(Persooninfo.is_volwassen(kind))

defmodule Autoinfo do
  def print_merk(%{merk: merk}) do
    "Het merk is #{merk}!"
  end

  def is_nieuw(%{jaar: jaar}) when jaar > 2020 do
    "Auto is nieuw, namelijk uit het jaar #{jaar}"
  end

  def is_nieuw(%{jaar: jaar}) do
    "Auto is niet nieuw, namelijk uit het jaar #{jaar}"
  end

  def print_volledig(%{merk: merk, model: model, jaar: jaar, kleur: kleur, prijs: prijs})do
    "De auto die ik rijd is een #{merk} #{model} uit het jaar #{jaar} in de kleur #{kleur}. Hij koste mij #{prijs}."
  end

end

  auto = %{merk: "vw", model: "polo", jaar: 2025, kleur: "zwart", prijs: 7525}
  oude_auto = %{merk: "mercedes", model: "benz", jaar: 2015, kleur: "wit", prijs: 1250}


  IO.puts(Autoinfo.print_merk(auto))
  IO.puts(Autoinfo.is_nieuw(auto))
  IO.puts(Autoinfo.is_nieuw(oude_auto))
  IO.puts(Autoinfo.print_volledig(auto))
  IO.puts(Autoinfo.print_volledig(oude_auto))
