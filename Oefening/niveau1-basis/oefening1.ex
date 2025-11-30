# Maak een bestand: oefening1.exs
defmodule Oefening1 do
  # Hulpfunctie om informatie te printen
  def print_info(naam, leeftijd, is_student, lengte) do
    IO.puts(" ")
    IO.puts("Hallo, mijn naam is #{naam}")
    IO.puts("Ik ben #{leeftijd} jaar oud")
    IO.puts("Student? #{is_student}")
    IO.puts("Lengte: #{lengte}m")
  end
end

# Definieer variabelen
naam = "Jouw naam"
leeftijd = 25
is_student = true
lengte = 1.75

# Print ze uit
Oefening1.print_info(naam, leeftijd, is_student, lengte)

# opnieuw gedefinieerde varriablen:
naam = "Rob Kokx"
leeftijd = 28
is_student = true
lengte = 1.80

#print ze uit, nogmaals!
Oefening1.print_info(naam, leeftijd, is_student, lengte)
