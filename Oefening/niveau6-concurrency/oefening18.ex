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
    IO.puts("#{n}....")
    Process.sleep(500)
    do_countdown(n - 1)
  end
end

# Test:
IO.puts("=== COUNTDOWN TEST ===")
ProcessCounter.countdown(5)
Process.sleep(3000)  # Wacht tot countdown klaar is

# 2. OPDRACHT: Maak meerdere countdowns parallel
  # Wacht tot alle countdowns klaar zijn

# Jouw code hier:
IO.puts("\n=== PARALLEL COUNTDOWNS ===")
ProcessCounter.countdown(3)
ProcessCounter.countdown(5)
ProcessCounter.countdown(7)
Process.sleep(5000)

# === EXTRA CHALLENGES ===

# 3. Race Condition Demo
IO.puts("\n=== RACE CONDITION ===")

defmodule Counter do
  # Shared counter (NIET veilig - demonstratie!)
  def start do
    spawn(fn -> loop(0) end)
  end

  defp loop(count) do
    receive do
      :increment ->
        IO.puts("Count is nu: #{count + 1}")
        loop(count + 1)

      {:get, caller} ->
        send(caller, {:count, count})
        loop(count)
    end
  end
end

# Spawn counter
counter = Counter.start()

# Meerdere processen proberen tegelijk te incrementen
Enum.each(1..10, fn n ->
  spawn(fn ->
    send(counter, :increment)
  end)
end)

Process.sleep(500)

# 4. Process Monitor - Check of process nog leeft
IO.puts("\n=== PROCESS MONITORING ===")

defmodule ProcessMonitor do
  def spawn_and_monitor(seconds) do
    pid = spawn(fn ->
      IO.puts("Process #{inspect(self())} start! Leeft #{seconds} seconden...")
      Process.sleep(seconds * 1000)
      IO.puts("Process #{inspect(self())} sterft nu!")
    end)

    # Monitor het process
    ref = Process.monitor(pid)
    {pid, ref}
  end

  def wait_for_exit(ref) do
    receive do
      {:DOWN, ^ref, :process, pid, reason} ->
        IO.puts("⚠️  Process #{inspect(pid)} is gestopt: #{reason}")
    end
  end
end

{pid, ref} = ProcessMonitor.spawn_and_monitor(2)
IO.puts("Monitoring process: #{inspect(pid)}")
ProcessMonitor.wait_for_exit(ref)

# 5. OPDRACHT: Parallel Fibonacci
IO.puts("\n=== PARALLEL FIBONACCI ===")

defmodule ParallelFib do
  # Bereken fibonacci getal
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n - 1) + fib(n - 2)

  # OPDRACHT: Bereken fibonacci voor lijst van getallen PARALLEL
  def calculate_parallel(lijst) do
    parent = self()

    # Spawn process voor elk getal
    pids = Enum.map(lijst, fn n ->
      spawn(fn ->
        result = fib(n)
        send(parent, {:result, n, result})
      end)
    end)

    # Verzamel resultaten
    # ... jouw code hier ...
  end
end

# Test (maak de functie eerst af!):
# getallen = [10, 15, 20, 25, 30]
# IO.puts("Berekenen fibonacci voor: #{inspect(getallen)}")
# resultaten = ParallelFib.calculate_parallel(getallen)
# IO.inspect(resultaten)

# 6. CHALLENGE: Process Pool
IO.puts("\n=== PROCESS POOL CHALLENGE ===")

defmodule WorkerPool do
  # Maak een pool van N workers
  # Elke worker kan taken uitvoeren
  # Verdeel werk automatisch over workers

  # def start(pool_size) do
  #   # Spawn pool_size worker processen
  #   # Return lijst van PIDs
  # end

  # def assign_work(pool, work_items) do
  #   # Verdeel work_items over de pool
  #   # Round-robin of random verdeling
  # end
end

# Als je dit implementeert:
# pool = WorkerPool.start(4)
# WorkerPool.assign_work(pool, 1..20)
