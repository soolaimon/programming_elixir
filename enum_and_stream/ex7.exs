defmodule MyList do
  def span(from, to) when from > to, do: []
  def span(from, to) do
    [ from | span(from+1, to) ]
  end

  def primes_up_to(n) do
    for i <- MyList.span(2,n), Math.is_prime?(i), do: i
  end
end

defmodule Math do
  def is_prime?(2), do: true
  def is_prime?(n) do
    !Enum.any?(2..round(:math.sqrt(n)), &(rem(n, &1) == 0))
  end
end
