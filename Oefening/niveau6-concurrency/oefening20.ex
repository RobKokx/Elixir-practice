# oefening20.exs

IO.puts("=== OEFENING 20: PARALLEL PROCESSING ===\n")

defmodule ParallelProcessor do
  # Verwerk een lijst parallel
  def map_parallel(lijst, functie) do
    parent = self()

    # Spawn een process voor elk item
    lijst
    |> Enum.map(fn item ->
      spawn(fn ->
        result = functie.(item)
        send(parent, {:result, item, result})
      end)
    end)

    # Verzamel alle resultaten
    lijst
    |> Enum.map(fn _item ->
      receive do
        {:result, item, result} -> {item, result}
      end
    end)
    |> Enum.sort_by(fn {item, _result} -> item end)
    |> Enum.map(fn {_item, result} -> result end)
  end

  # Slow functie om parallel processing te demonstreren
  def slow_double(n) do
    Process.sleep(1000)  # Simuleer zware berekening
    n * 2
  end
end

# Test: sequential vs parallel
IO.puts("=== SEQUENTIAL (langzaam) ===")
sequential_start = System.monotonic_time(:millisecond)

sequential_result = Enum.map([1, 2, 3, 4, 5], fn n ->
  ParallelProcessor.slow_double(n)
end)

sequential_time = System.monotonic_time(:millisecond) - sequential_start
IO.puts("Resultaat: #{inspect(sequential_result)}")
IO.puts("Tijd: #{sequential_time}ms\n")

IO.puts("=== PARALLEL (snel!) ===")
parallel_start = System.monotonic_time(:millisecond)

parallel_result = ParallelProcessor.map_parallel([1, 2, 3, 4, 5], fn n ->
  ParallelProcessor.slow_double(n)
end)

parallel_time = System.monotonic_time(:millisecond) - parallel_start
IO.puts("Resultaat: #{inspect(parallel_result)}")
IO.puts("Tijd: #{parallel_time}ms\n")

speedup = Float.round(sequential_time / parallel_time, 1)
IO.puts("🚀 Speedup: #{speedup}x sneller!\n")

# === JOUW OPDRACHT ===

# Maak een functie die parallel zoekt in een lijst
defmodule ParallelSearch do
  # Zoek een waarde in grote lijst (parallel!)
  def find_parallel(lijst, target) do
    # Split lijst in chunks
    chunk_size = div(length(lijst), 4)  # 4 parallel processen

    lijst
    |> Enum.chunk_every(chunk_size)
    |> Enum.map(fn chunk ->
      parent = self()
      spawn(fn ->
        # Zoek in deze chunk
        found = Enum.find(chunk, fn x -> x == target end)
        send(parent, {:search_result, found})
      end)
    end)

    # Verzamel resultaten
    # Als één process het vindt, zijn we klaar!
    # Jouw code hier...
  end
end

# Test met grote lijst
grote_lijst = Enum.to_list(1..10_000)

# OPDRACHT: Implementeer find_parallel en test het!
