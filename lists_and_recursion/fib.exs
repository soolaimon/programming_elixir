defmodule Fib do
  def of_index(0), do: 0
  def of_index(1), do: 1
  def of_index(n), do: of_index(n-1) + of_index(n-2)
end
