Tea = teapot radius:5 wireColor: green
t1 = sphere radius:1 wireColor: red
t2 = sphere radius:1 wireColor: red
p1 = sphere radius:1 wireColor: blue
p2 = sphere radius:1 wireColor: blue
p3 = sphere radius:1 wireColor: blue

animate on
	at time 0
(
	p1.pos = [-50,-50,0]
	p2.pos = [50,-50,0]
	p3.pos = [50,50,0]
)
fn interpolacion OBJ T1 T2 CP1 CP2 CP3= 
(

V1 = (CP2-CP1)
V2 = (CP3-CP2)

animate on
(
	for t in 0 to 100 by 1 do
	(
		at time t
		(
			T1.pos = CP1 + ((normalize V1)*(((length V1)/100)*t))
			T2.pos = CP2 + ((normalize V2)*(((length V2)/100)*t))
			V3 = (T2.pos-T1.pos)			
			OBJ.pos = T1.pos + ((normalize V3)*(((length V3)/100)*t))
		)
		
	)
)
)

interpolacion Tea t1 t2 p1.pos p2.pos p3.pos
