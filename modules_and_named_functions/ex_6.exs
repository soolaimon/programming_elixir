defmodule Chop do

  def guess(actual, range = low..high) do
    guess = div(low+high, 2)
    IO.puts("Is it #{guess}?")
    _guess(actual, guess, range)
  end

  defp _guess(actual, actual, _), do: IO.puts("It is #{actual}")

  defp _guess(actual, guess, _low..high) when guess < actual do
    guess(actual, guess+1..high)
  end

  defp _guess(actual, guess, low.._high) when guess > actual do
    guess(actual, low..guess-1)
  end

end


# IO.puts chop.guess(442, 1..1000)
