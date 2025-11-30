# oefening18.exs

# Basis: spawn een process
IO.puts("=== OEFENING 18: EERSTE PROCESS ===\n")

# Spawn een simpel process
pid = spawn(fn ->
  IO.puts("👋 Hallo vanuit een nieuw process!")
  IO.puts("Mijn PID is: #{inspect(self())}")
end)

IO.puts("Main process PID: #{inspect(self())}")
IO.puts("Spawned process PID: #{inspect(pid)}")

# Wacht even zodat het andere process kan printen
Process.sleep(100)

IO.puts("\n--- Process is klaar ---\n")

# Spawn meerdere processen
IO.puts("=== SPAWNING 5 PROCESSEN ===\n")

Enum.each(1..5, fn n ->
  spawn(fn ->
    IO.puts("Process #{n} draait! PID: #{inspect(self())}")
    Process.sleep(n * 100)  # Verschillend timing
    IO.puts("Process #{n} is klaar!")
  end)
end)

# Wacht zodat alle processen kunnen finishen
Process.sleep(1000)

IO.puts("\n--- Alle processen klaar ---\n")

# === JOUW OPDRACHT ===

# 1. Maak een functie die een process spawnt dat van N tot 0 telt
defmodule ProcessCounter do
  def countdown(n) do
    spawn(fn -> do_countdown(n) end)
  end

  defp do_countdown(0) do
    IO.puts("🎉 Klaar!")
  end

  defp do_countdown(n) do
    IO.puts("#{n}...")
    Process.sleep(500)
    do_countdown(n - 1)
  end
end

# Test:
IO.puts("=== COUNTDOWN TEST ===")
ProcessCounter.countdown(5)
Process.sleep(3000)  # Wacht tot countdown klaar is

# 2. OPDRACHT: Maak meerdere countdowns parallel
# Spawn 3 processen die tegelijk tellen van 3, 5, en 7
# Kijk hoe ze door elkaar heen printen!

# Jouw code hier:
IO.puts("\n=== PARALLEL COUNTDOWNS ===")
# ...
