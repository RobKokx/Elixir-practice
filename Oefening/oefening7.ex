# oefening7.exs

getallen = [1, 2, 3, 4, 5]

# Vermenigvuldig elk getal met 2
verdubbeld = Enum.map(getallen, fn x -> x * 2 end)
IO.puts("Verdubbeld: #{inspect(verdubbeld)}")

# Filter alleen even getallen
even = Enum.filter(getallen, fn x -> rem(x, 2) == 0 end)
IO.puts("Even getallen: #{inspect(even)}")

# Som van alle getallen
totaal = Enum.sum(getallen)
IO.puts("Totaal: #{totaal}")


#10 cijfers en dan even
getallenTotEnMetTien = [1,2,3,4,5,6,7,8,9,10]

evenUitTien = Enum.filter(getallenTotEnMetTien, fn x -> rem(x, 2) == 0 end)

IO.puts("Even getallen tot en met tien: #{inspect(evenUitTien)}")
