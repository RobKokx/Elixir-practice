# oefening19.exs

IO.puts("=== OEFENING 19: MESSAGES VERSTUREN ===\n")

# Basis message passing
defmodule Greeter do
  def loop do
    receive do
      {:greet, name} ->
        IO.puts("👋 Hallo #{name}!")
        loop()  # Blijf luisteren!

      {:bye, name} ->
        IO.puts("👋 Doei #{name}!")
        # Stop met loopen (process eindigt)

      other ->
        IO.puts("❓ Onbekend bericht: #{inspect(other)}")
        loop()
    end
  end
end

# Start het process
pid = spawn(fn -> Greeter.loop() end)

# Stuur messages
send(pid, {:greet, "Rob"})
Process.sleep(100)

send(pid, {:greet, "Lisa"})
Process.sleep(100)

send(pid, {:unknown, "test"})
Process.sleep(100)

send(pid, {:bye, "Rob"})
Process.sleep(100)

# Als we nu nog een message sturen, crasht het (process is dood)
# send(pid, {:greet, "Piet"})  # Dit wordt genegeerd

IO.puts("\n--- Messages verzonden ---\n")

# === BELANGRIJKE CONCEPTEN ===

# 1. send/2 - Stuur een message naar een process
#    send(pid, message)

# 2. receive do - Luister naar messages
#    Pattern match op verschillende message types!

# 3. self() - Je eigen PID krijgen

# === JOUW OPDRACHT ===

defmodule Calculator do
  # Start een calculator process
  def start do
    spawn(fn -> loop() end)
  end

  def loop do
    receive do
      {:add, a, b, caller_pid} ->
        result = a + b
        send(caller_pid, {:result, result})
        loop()

      {:multiply, a, b, caller_pid} ->
        result = a * b
        send(caller_pid, {:result, result})
        loop()

      # OPDRACHT: Voeg :subtract en :divide toe!
      # {:subtract, a, b, caller_pid} ->
      #   ...

      :stop ->
        IO.puts("Calculator stopt!")
        # Process eindigt

      _ ->
        IO.puts("Onbekende operatie!")
        loop()
    end
  end

  # Helper functies
  def add(calc_pid, a, b) do
    send(calc_pid, {:add, a, b, self()})

    receive do
      {:result, result} -> result
    after
      1000 -> :timeout
    end
  end

  def multiply(calc_pid, a, b) do
    send(calc_pid, {:multiply, a, b, self()})

    receive do
      {:result, result} -> result
    after
      1000 -> :timeout
    end
  end

  # OPDRACHT: Maak subtract/3 en divide/3 functies
end

# Test de calculator
IO.puts("=== CALCULATOR TEST ===")
calc = Calculator.start()

result1 = Calculator.add(calc, 5, 3)
IO.puts("5 + 3 = #{result1}")

result2 = Calculator.multiply(calc, 4, 7)
IO.puts("4 * 7 = #{result2}")

# Test jouw functies:
# result3 = Calculator.subtract(calc, 10, 3)
# IO.puts("10 - 3 = #{result3}")

send(calc, :stop)
Process.sleep(100)
