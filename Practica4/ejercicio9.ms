Tea = teapot radius:5 wireColor: green
g1 = sphere radius:1 wireColor: yellow
g2 = sphere radius:1 wireColor: yellow
t1 = sphere radius:1 wireColor: red
t2 = sphere radius:1 wireColor: red
t3 = sphere radius:1 wireColor: red
p1 = sphere radius:1 wireColor: blue
p2 = sphere radius:1 wireColor: blue
p3 = sphere radius:1 wireColor: blue
p4 = sphere radius:1 wireColor: blue

animate on
	at time 0
(
	p1.pos = [-50,-50,0]
	p2.pos = [50,-50,0]
	p3.pos = [50,50,0]
	p4.pos = [-50,50,0]
)
fn interpolacion OBJ G1 G2 T1 T2 T3 CP1 CP2 CP3 CP4= 
(

V1 = (CP2-CP1)
V2 = (CP3-CP2)
V3 = (CP4-CP3)	

animate on
(
	for t in 0 to 100 by 1 do
	(
		at time t
		(
			T1.pos = CP1 + ((normalize V1)*(((length V1)/100)*t))
			T2.pos = CP2 + ((normalize V2)*(((length V2)/100)*t))
			V4 = (T2.pos - T1.pos)
			G1.pos = T1.pos + ((normalize V4)*(((length V4)/100)*t))
			T3.pos = CP4 + ((normalize V3)*(((length V3)/100)*t))
			V5 = (T3.pos - T2.pos)
			G2.pos = T2.pos + ((normalize V5)*(((length V5)/100)*t))
			V6= (G2.pos - G1.pos)
			OBJ.pos = G1.pos + ((normalize V6)*(((length V6)/100)*t))
		)
		
	)
)
)

interpolacion Tea g1 g2 t1 t2 t3 p1.pos p2.pos p3.pos p4.pos
