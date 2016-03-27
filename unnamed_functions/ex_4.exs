prefix = fn first -> (fn last -> "#{first} #{last}" end) end

fib = fn
  0 -> 0
  1 -> 1
  n -> fib.(n - 1) + fib.(n - 2)
end
