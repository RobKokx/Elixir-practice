# oefening9.exs

# Maak een map van jezelf
persoon = %{
  naam: "Rob",
  leeftijd: 28,
  stad: "Oss",
  hobby: "programmeren"
}

IO.puts("Naam: #{persoon.naam}")
IO.puts("Leeftijd: #{persoon[:leeftijd]}")  # Twee manieren om te accessen

# Update een map (immutable - maakt nieuwe map!)
oudere_persoon = %{persoon | leeftijd: 29}
IO.puts("Nieuwe leeftijd: #{oudere_persoon.leeftijd}")
IO.puts("Originele leeftijd: #{persoon.leeftijd}")  # Nog steeds 28!

# Voeg een key toe
persoon_met_email = Map.put(persoon, :email, "rob@example.com")
IO.inspect(persoon_met_email)

# Check of een key bestaat
heeft_email = Map.has_key?(persoon, :email)
IO.puts("Heeft email? #{heeft_email}")

auto =
  %{
    merk: "volkswagen",
    model: "polo",
    jaar: 2010,
    kleur: "zwart"
  }

auto = %{auto | jaar: 2025}

IO.inspect(auto)

auto = Map.put(auto, :prijs, 7525)

IO.inspect(auto)
