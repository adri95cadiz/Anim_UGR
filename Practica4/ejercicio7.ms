Tetera = Teapot radius:10 wireColor:blue
p1 = sphere radius:1 wireColor:red
p2 = sphere radius:1 wireColor:red

animate on
	at time 0
(
	p1.pos = [-50, 0, 0]
	p2.pos = [50, 0, 0]
)

fn interpolacion objeto t p1 p2 = 
(
  V1 = (p2-p1)
  objeto.pos = p1 + ((normalize V1)*(((length V1)/100)*t))
)

animate on
(
  for t in 0 to 100 by 1 do
  (
    at time t
    (
      interpolacion Tetera t p1.pos p2.pos
    )
  )
)

