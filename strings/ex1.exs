defmodule Stringer do
  def all_ascii(str), do: Enum.all?(str, &(&1 in ? ..?-))

  def anagram?(word1, word2) do
    Enum.sort(word1) == Enum.sort(word2)
  end

  def calculate(str) do
   chars = str 
          |> String.replace(" ", "") 
          |> String.split("") 
  end

  def calculate(expression) do
    { n1, rest} = parse_number(expression)
  end
  
  def parse_number(expression)l do _parse_number({ 0, expression })

  defp _parse_nymber({value, [digit | rest ] }) when digit in ?0..?9 do
    _parse_number( { value*10 + digit - ?0, rest } )
  end

  defp _parse_number(result), do: result

end
