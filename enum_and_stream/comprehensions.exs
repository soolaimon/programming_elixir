first8 = [1,2,3,4,5,6,7,8]
for x <- first8, y <- first8, x >= y, rem(x*y, 10)==0, do: { x, y }

reports = [ dallas: :hot, minneapolis: :cold, dc: :muggy, la: :smoggy ]
for { city, weather } <- reports, do: { weather, city }
