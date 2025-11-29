# todo_list.exs

defmodule Todo do
  defstruct [:id, :titel, :voltooid]

  def nieuw(id, titel) do
    %Todo{id: id, titel: titel, voltooid: false}
  end

  def voltooi(%Todo{} = todo) do
    %{todo | voltooid: true}
  end

  def status(%Todo{voltooid: true}), do: "[✓]"
  def status(%Todo{voltooid: false}), do: "[ ]"
end

defmodule TodoList do
  # Start met lege lijst
  def nieuw(), do: []

  # Voeg todo toe
  def voeg_toe(lijst, titel) do
    id = length(lijst) + 1
    nieuwe_todo = Todo.nieuw(id, titel)
    lijst ++ [nieuwe_todo]
  end

  # Markeer todo als voltooid
  def voltooi(lijst, id) do
    Enum.map(lijst, fn todo ->
      if todo.id == id do
        Todo.voltooi(todo)
      else
        todo
      end
    end)
  end

  # Verwijder todo
  def verwijder(lijst, id) do
    Enum.filter(lijst, fn todo -> todo.id != id end)
  end

  # Toon alle todos
  def toon(lijst) do
    IO.puts("\n=== MIJN TODO's ===")

    lijst
    |> Enum.each(fn todo ->
      IO.puts("#{todo.id}. #{Todo.status(todo)} #{todo.titel}")
    end)

    totaal = length(lijst)
    voltooid = lijst |> Enum.filter(& &1.voltooid) |> length()

    IO.puts("\nTotaal: #{totaal} | Voltooid: #{voltooid} | Te doen: #{totaal - voltooid}\n")
  end

  # Filter functies
  def alleen_open(lijst) do
    Enum.filter(lijst, fn todo -> !todo.voltooid end)
  end

  def alleen_voltooid(lijst) do
    Enum.filter(lijst, fn todo -> todo.voltooid end)
  end

  # === JOUW OPDRACHTEN - VOEG DEZE FUNCTIES TOE! ===

  # 1. count_open/1 - Tel hoeveel todos nog open zijn
  def count_open(lijst) do
    lijst
    |> Enum.filter(& &1.voltooid == false)
    |> Enum.count()
  end

  # 2. count_voltooid/1 - Tel hoeveel todos voltooid zijn
  def count_voltooid(lijst) do
    lijst
    |> Enum.filter(& &1)
  end

  def count(:open, lijst) do
      lijst
    |> Enum.filter(& &1.voltooid == false)
    |> Enum.count()
  end

  def count(:closed, lijst) do
    lijst
    |> Enum.filter(& &1.voltooid == true)
    |> Enum.count()
  end

  def count(lijst) do
    Enum.count(lijst)
  end


  # 3. clear_voltooid/1 - Verwijder alle voltooide todos
  def clear_voltooid(lijst) do
    Enum.filter(lijst, fn todo -> not todo.voltooid end)
  end

  # 4. zoek/2 - Zoek todos die bepaalde tekst bevatten
  # Hint: String.contains?(todo.titel, zoekterm)
  # def zoek(lijst, zoekterm) do
  #   # Jouw code hier!
  # end

  # 5. BONUS: toggle/2 - Wissel status van todo (voltooid <-> open)
  # def toggle(lijst, id) do
  #   # Jouw code hier!
  # end

  # 6. BONUS: edit/3 - Wijzig de titel van een todo
  # def edit(lijst, id, nieuwe_titel) do
  #   # Jouw code hier!
  # end
end

# === TEST JE TODO LIST ===

IO.puts("🎯 === TODO LIST DEMO ===")

# Maak een nieuwe lijst
lijst = TodoList.nieuw()

# Voeg wat todos toe
lijst =
  lijst
  |> TodoList.voeg_toe("Elixir leren")
  |> TodoList.voeg_toe("Boodschappen doen")
  |> TodoList.voeg_toe("Sporten")
  |> TodoList.voeg_toe("Code reviewen")

TodoList.toon(lijst)

# Voltooi een paar todos
lijst =
  lijst
  |> TodoList.voltooi(1)
  |> TodoList.voltooi(3)

TodoList.toon(lijst)

# Filter op open todos
IO.puts("=== ALLEEN OPEN TAKEN ===")
lijst
|> TodoList.alleen_open()
|> TodoList.toon()

# Filter op voltooide todos
IO.puts("=== VOLTOOIDE TAKEN ===")
lijst
|> TodoList.alleen_voltooid()
|> TodoList.toon()

IO.puts("=== TEST JOUW FUNCTIES HIER ===")

# Test count_open
IO.puts("=== ALLEEN OPEN TAKEN TELLEN===")
open_count = TodoList.count(:open, lijst)
IO.puts("Aantal open: #{open_count}")

# Test count_voltooid
IO.puts("=== ALLEEN GESLOTEN TAKEN TELLEN===")
closed_count = TodoList.count(:closed, lijst)
IO.puts("Aantal voltooid: #{closed_count}")

# Test count_voltooid
IO.puts("=== ALLE TAKEN TELLEN===")
count = TodoList.count(lijst)
IO.puts("Aantal taken: #{count}")

# Test voltooid is verwijdert
IO.puts("=== VOLTOOIDE TAKEN VERWIJDERD ===")
only_uncompleted = TodoList.clear_voltooid(lijst)
IO.puts("De lijst voor af")
IO.inspect(lijst)
IO.puts("de lijst na de clearing: ")
IO.inspect(only_uncompleted)

# Test zoek
# resultaten = TodoList.zoek(lijst, "en")
# IO.puts("\n=== ZOEK RESULTATEN: 'en' ===")
# TodoList.toon(resultaten)

# Test clear_voltooid
# lijst = TodoList.clear_voltooid(lijst)
# IO.puts("\n=== NA CLEAR VOLTOOID ===")
# TodoList.toon(lijst)
