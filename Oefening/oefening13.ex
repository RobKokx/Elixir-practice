# oefening13.exs

defmodule Student do
  defstruct [:naam, :cijfers]

  def gemiddelde(%Student{cijfers: cijfers}) do
    Enum.sum(cijfers) / length(cijfers)
  end

  def geslaagd?(%Student{} = student) do
    gemiddelde(student) >= 5.5
  end
end

defmodule Klas do
  def print_resultaten(studenten) do
    studenten
    |> Enum.each(fn student ->
      gem = Student.gemiddelde(student)
      status = if Student.geslaagd?(student), do: "GESLAAGD", else: "GEZAKT"
      IO.puts("#{student.naam}: #{gem} - #{status}")
    end)
  end

  def top_student(studenten) do
    studenten
    |> Enum.max_by(fn student -> Student.gemiddelde(student) end)
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

defmodule Garage do
  defstruct [:autos]

  def totaal_kms(%Garage{autos}) do
    Enum.sum(auto.kilometers)
  end

  def oudste_auto(%Garage{autos}) do
    Enum.min(autos.jaar)
  end

end


defmodule MakeStructs do
  def make_struct(:student, naam, cijfers) do
    %Student{naam: naam, cijfers: cijfers}
  end

  def make_struct(:auto, merk, model, bouwjaar) do
    %Auto{merk: merk, model: model, jaar: bouwjaar}
  end
end

# Maak een klas
studenten = [
  MakeStructs.make_struct(:student, "Rob",[8, 7, 9, 8]),
  MakeStructs.make_struct(:student, "Lisa",[6, 5, 7, 6]),
  MakeStructs.make_struct(:student, "Piet",[4, 5, 3, 4])
]

Klas.print_resultaten(studenten)

beste = Klas.top_student(studenten)
IO.puts("\nBeste student: #{beste.naam}")
