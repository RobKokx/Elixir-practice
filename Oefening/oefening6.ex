# oefening6.exs

defmodule Checker do
  def check_getal(getal) when getal > 0 do
    "#{getal} is positief"
  end

  def check_getal(getal) when getal < 0 do
    "#{getal} is negatief"
  end

  def check_getal(0) do
    "Het is nul!"
  end
end

IO.puts(Checker.check_getal(5))
IO.puts(Checker.check_getal(-3))
IO.puts(Checker.check_getal(0))

defmodule Check_Age do
  def check_leeftijd(leeftijd) when leeftijd < 18 do
    IO.puts("U bent minderjarig")
  end

  def check_leeftijd(leeftijd) when leeftijd >= 18 and leeftijd <= 65 do
    IO.puts("U bent volwassen")
  end

  def check_leeftijd(leeftijd) when leeftijd > 65 do
    IO.puts("U bent senior")
  end
end

Check_Age.check_leeftijd(16)
Check_Age.check_leeftijd(30)
Check_Age.check_leeftijd(70)
