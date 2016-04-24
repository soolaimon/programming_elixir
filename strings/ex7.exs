defmodule Calculator do
  @rates [ NC: 0.075, TX: 0.08 ]

  def calculate_tax(filename) do
    file = File.read!(filename)
    String.split(file,"\n") 
              |> Enum.drop(1) 
              |> Enum.drop(-1)
              |> Enum.map(&(String.split(&1, ","))) 
              |> Enum.map(&(parse_order(&1))) 
              |> Enum.map(&(add_total(&1)))
  end


  def parse_order([ id, ship_to, net_amount ]) do
    [ id: id, ship_to: String.to_atom(String.replace(ship_to, ":", "")), net_amount: String.to_float(net_amount) ]
  end

  def add_total(order = [id: _, ship_to: state, net_amount: net ]) do
    rate = Keyword.get(@rates, state, 0)
    tax = rate * net
    total = net + tax
    Keyword.put(order, :total_amount, total)
  end

end
