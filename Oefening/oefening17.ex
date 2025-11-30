# scoreboard.exs

defmodule Speler do
  defstruct [:naam, :score, :games_gespeeld]

  def nieuw(naam) do
    %Speler{naam: naam, score: 0, games_gespeeld: 0}
  end

  def voeg_score_toe(%Speler{} = speler, punten) do
    %{speler |
      score: speler.score + punten,
      games_gespeeld: speler.games_gespeeld + 1
    }
  end

  def gemiddelde(%Speler{games_gespeeld: 0}), do: 0.0
  def gemiddelde(%Speler{} = speler) do
    speler.score / speler.games_gespeeld
  end
end

defmodule Scoreboard do
  # Zoek speler in lijst
  def vind_speler(spelers, naam) do
    Enum.find(spelers, fn s -> s.naam == naam end)
  end

  # Voeg speler toe (als niet bestaat)
  def voeg_speler_toe(spelers, naam) do
    case vind_speler(spelers, naam) do
      nil -> spelers ++ [Speler.nieuw(naam)]
      _speler ->
        IO.puts("⚠️  Speler #{naam} bestaat al!")
        spelers
    end
  end

  # Update score van speler
  def update_score(spelers, naam, punten) do
    Enum.map(spelers, fn speler ->
      if speler.naam == naam do
        Speler.voeg_score_toe(speler, punten)
      else
        speler
      end
    end)
  end

  # Toon top N spelers
  def top(spelers, n \\ 5) do
    spelers
    |> Enum.sort_by(& &1.score, :desc)
    |> Enum.take(n)
  end

  # Toon alle spelers
  def toon(spelers) do
    IO.puts("\n=== 🏆 SCOREBOARD ===")

    spelers
    |> Enum.sort_by(& &1.score, :desc)
    |> Enum.with_index(1)
    |> Enum.each(fn {speler, positie} ->
      gem = Speler.gemiddelde(speler) |> Float.round(1)
      IO.puts("#{positie}. #{speler.naam} - #{speler.score} punten (#{speler.games_gespeeld} games, avg: #{gem})")
    end)

    IO.puts("")
  end

  # Statistieken
  def stats(spelers) do
    totaal_games = spelers |> Enum.map(& &1.games_gespeeld) |> Enum.sum()
    totaal_punten = spelers |> Enum.map(& &1.score) |> Enum.sum()

    IO.puts("\n=== 📊 STATISTIEKEN ===")
    IO.puts("Totaal spelers: #{length(spelers)}")
    IO.puts("Totaal games: #{totaal_games}")
    IO.puts("Totaal punten: #{totaal_punten}")
    IO.puts("")
  end

  # === JOUW OPDRACHTEN ===

  # 1. beste_speler/1 - Return speler met hoogste score
  # def beste_speler(spelers) do
  #   # Hint: Enum.max_by
  # end

  # 2. slechtste_speler/1 - Return speler met laagste score
  # def slechtste_speler(spelers) do
  #   # Hint: Enum.min_by
  # end

  # 3. gemiddelde_score/1 - Bereken gemiddelde score van alle spelers
  # def gemiddelde_score(spelers) do
  #   # Hint: totaal score / aantal spelers
  # end

  # 4. boven_gemiddelde/1 - Return spelers boven het gemiddelde
  # def boven_gemiddelde(spelers) do
  #   gem = gemiddelde_score(spelers)
  #   # Filter spelers waar score > gem
  # end

  # 5. BONUS: reset_scores/1 - Reset scores naar 0, behoud games_gespeeld
  # def reset_scores(spelers) do
  #   # Hint: Enum.map en update alleen :score field
  # end

  # 6. BONUS: verwijder_speler/2 - Verwijder een speler
  # def verwijder_speler(spelers, naam) do
  #   # Hint: Enum.filter
  # end

  # 7. BONUS: speler_info/2 - Toon gedetailleerde info van 1 speler
  # def speler_info(spelers, naam) do
  #   # Vind speler en print uitgebreide info
  # end
end

# === TEST HET SCOREBOARD ===

IO.puts("🎮 === SCOREBOARD DEMO ===\n")

# Start met lege lijst
spelers = []

# Voeg spelers toe
spelers =
  spelers
  |> Scoreboard.voeg_speler_toe("Rob")
  |> Scoreboard.voeg_speler_toe("Lisa")
  |> Scoreboard.voeg_speler_toe("Piet")
  |> Scoreboard.voeg_speler_toe("Anna")
  |> Scoreboard.voeg_speler_toe("Tom")

IO.puts("Spelers toegevoegd!")

# Probeer duplicate
spelers = Scoreboard.voeg_speler_toe(spelers, "Rob")

# Simuleer een paar games
IO.puts("\n🎲 Simuleren van games...")

spelers =
  spelers
  |> Scoreboard.update_score("Rob", 150)
  |> Scoreboard.update_score("Lisa", 200)
  |> Scoreboard.update_score("Piet", 120)
  |> Scoreboard.update_score("Anna", 250)
  |> Scoreboard.update_score("Tom", 80)
  |> Scoreboard.update_score("Rob", 180)
  |> Scoreboard.update_score("Lisa", 190)
  |> Scoreboard.update_score("Piet", 140)
  |> Scoreboard.update_score("Anna", 220)
  |> Scoreboard.update_score("Rob", 160)

Scoreboard.toon(spelers)
Scoreboard.stats(spelers)

IO.puts("=== 🥇 TOP 3 ===")
Scoreboard.top(spelers, 3) |> Scoreboard.toon()

# === TEST JOUW FUNCTIES ===

# # Test beste speler
# beste = Scoreboard.beste_speler(spelers)
# IO.puts("\n🏆 Beste speler: #{beste.naam} met #{beste.score} punten!")

# # Test slechtste speler
# slechtste = Scoreboard.slechtste_speler(spelers)
# IO.puts("😢 Slechtste speler: #{slechtste.naam} met #{slechtste.score} punten")

# # Test gemiddelde
# gem = Scoreboard.gemiddelde_score(spelers)
# IO.puts("\n📊 Gemiddelde score: #{Float.round(gem, 1)}")

# # Test boven gemiddelde
# boven_gem = Scoreboard.boven_gemiddelde(spelers)
# IO.puts("\n=== SPELERS BOVEN GEMIDDELDE ===")
# Scoreboard.toon(boven_gem)

# # Test reset
# IO.puts("\n=== NA SCORE RESET ===")
# spelers_reset = Scoreboard.reset_scores(spelers)
# Scoreboard.toon(spelers_reset)

# # Test verwijder speler
# spelers = Scoreboard.verwijder_speler(spelers, "Tom")
# IO.puts("\n=== NA VERWIJDEREN TOM ===")
# Scoreboard.toon(spelers)

# # Test speler info
# Scoreboard.speler_info(spelers, "Rob")
