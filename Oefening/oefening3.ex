# oefening3.exs

# Maak een lijst met je favoriete getallen
getallen = [7, 14, 21, 28]

# Print de hele lijst
IO.puts("Mijn lijst: #{inspect(getallen)}")

# Voeg een getal toe aan het begin
nieuwe_lijst = [35 | getallen]
IO.puts("Na toevoegen: #{inspect(nieuwe_lijst)}")

# Lengte van de lijst
IO.puts("Aantal elementen: #{length(nieuwe_lijst)}")

nieuwe_lijst = [11 , 14, 21, 28, 104]
IO.puts("Nieuwe lijst: #{inspect(nieuwe_lijst)}")

list_som = Enum.sum(nieuwe_lijst)
IO.puts("Som van de lijst: #{list_som}")

gemiddelde = list_som / length(nieuwe_lijst)
IO.puts("Gemiddelde: #{gemiddelde}")

max_waarde = Enum.max(nieuwe_lijst)
IO.puts("Max waarde: #{max_waarde}")

min_waarde = Enum.min(nieuwe_lijst)
IO.puts("Min waarde: #{min_waarde}")

gesorteerde_lijst = Enum.sort(nieuwe_lijst)
IO.puts("Gesorteerde lijst: #{inspect(gesorteerde_lijst)}")

omgekeerde_lijst = Enum.reverse(nieuwe_lijst)
IO.puts("Omgekeerde lijst: #{inspect(omgekeerde_lijst)}")

nieuwe_lijst = [11, 14, 21, 28, 14, 21, 104, 11, 21, 53, 13, 11, 64, 104]
unieke_waarden = Enum.uniq(nieuwe_lijst)
IO.puts("Unieke waarden: #{inspect(unieke_waarden)}")
