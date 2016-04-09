Stream.cycle(~w{ green white } ) |>
Stream.zip(1..5) |>
Enum.map(fn {class, value} -> ~s{<tr class="#{class}"><tx>#{value}</td></tr>\n} end) |>
IO.puts
