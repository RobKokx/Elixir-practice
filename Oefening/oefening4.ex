# oefening4.exs

defmodule MijnFuncties do
  def begroet(naam) do
    "Hallo, #{naam}!"
  end

  def verdubbel(getal) do
    getal * 2
  end

  def drievoud(getal) do
    getal * 3
  end
end

IO.puts(MijnFuncties.begroet("Piet"))
IO.puts("5 verdubbeld = #{MijnFuncties.verdubbel(5)}")
IO.puts("5 drievoud = #{MijnFuncties.drievoud(5)}")
