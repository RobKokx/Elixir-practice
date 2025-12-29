defmodule Solution do
  @spec climb_stairs(n :: integer) :: integer

  def climb_stairs(n) when n <= 2 do
    n
  end

  def climb_stairs(n) do
    { fib1, fib2 } =
      Enum.reduce(1...(n-2), {1,2}, fn _i, {fib1, fib2} ->
        {fib2, fib1 + fib2}
      end)
    fib2
  end
end
