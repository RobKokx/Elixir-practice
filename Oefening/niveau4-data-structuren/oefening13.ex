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
  defstruct [:merk, :model, :jaar, :kilometers]

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

  def totaal_kms(%Garage{autos: autos}) do
    autos
    |> Enum.map(& &1.kilometers)
    |> Enum.sum()
  end

  def oudste_auto(%Garage{autos: autos}) do
    Enum.min_by(autos, & &1.jaar)
  end


  def nieuwste_auto(%Garage{autos: autos}) do
    Enum.max_by(autos, & &1.jaar)
  end

end


defmodule MakeStruct do
  def make_struct(:student, naam, cijfers) do
    %Student{naam: naam, cijfers: cijfers}
  end

  def make_struct(:auto, merk, model, bouwjaar, kilometers) do
    %Auto{merk: merk, model: model, jaar: bouwjaar, kilometers: kilometers}
  end

  def make_struct(:garage, autos) do
    %Garage{autos: autos}
  end
end

autos = [
  MakeStruct.make_struct(:auto, "Toyota", "Yaris", 2018,245126),
  MakeStruct.make_struct(:auto, "Volkswagen", "Golf", 2015, 148521),
  MakeStruct.make_struct(:auto, "Honda", "Civic", 2020, 74563),
  MakeStruct.make_struct(:auto, "Ford", "Focus", 2012, 312956)
]

garage = MakeStruct.make_struct(:garage, autos)

totale_kms = Garage.totaal_kms(garage)
IO.puts("De totale gereden aantal kilometers is:#{totale_kms}")

oudste_auto = Garage.oudste_auto(garage)
IO.puts("Mijn oudste auto die ik heb is die #{oudste_auto.merk} #{oudste_auto.model} daar.")

nieuwte_auto = Garage.nieuwste_auto(garage)
IO.puts("Mijn nieuwste auto die ik heb is de #{nieuwte_auto.merk} #{nieuwte_auto.model} hier.\n")


# Maak een klas
studenten = [
  MakeStruct.make_struct(:student, "Rob",[8, 7, 9, 8]),
  MakeStruct.make_struct(:student, "Lisa",[6, 5, 7, 6]),
  MakeStruct.make_struct(:student, "Eva",[4, 5, 3, 4])
]

Klas.print_resultaten(studenten)

beste = Klas.top_student(studenten)
IO.puts("\nBeste student: #{beste.naam}")
