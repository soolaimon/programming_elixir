defmodule MyList do
  def all?(list), do: all?(list, fn x -> !!x end)
  def all?([], _func), do: true
  def all?([head | tail], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  def each([], _func), do: []
  def each([ head | tail ], func), do: [ func.(head) | each(tail, func) ]

  def filter([], _func), do: []
  def filter([ head | tail ], func) do
    if func.(head) do
      [ head, filter(tail, func) ]
    else
      [ filter(tail, func) ]
    end
  end

  # def split([], _count), do: []
  #
  # def split(list, 0) do
  #    [list]
  # end
  # def split([ head | tail ], count ) do
  #    [ head | split(tail, count-1) ]
  # end
# [1,2,3,4,5], 3
  def split(list, count), do: _split(list, [], count)
  defp _split([], front, _), do: [ Enum.reverse(front), [] ]
  defp _split(tail, front, 0), do: [ Enum.reverse(front), tail ]
  defp _split([ head | tail ], front, count) do
    _split(tail, [ head | front ], count-1)
    # _split([2,3,4,5], [1, []] , 2)
    # _split([3,4,5], [3 | 1,[]], 1)
  end

  def take(list, n), do: hd(split(list, n))


  def flatten(list), do: _flatten(list,  [])

  defp _flatten([h|t], tail) when is_list(h) do
    _flatten(h, _flatten(t, tail))
  end

  defp _flatten([h|t], tail) do
    [ h | _flatten(t, tail) ]
  end

  defp _flatten([], tail) do
    tail
  end

end
