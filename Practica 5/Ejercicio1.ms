Teapot001 = teapot radius:5 wirecolor:green 
p1 = sphere radius:1 wirecolor:blue 
p2 = sphere radius:1 wirecolor:blue 
p3 = sphere radius:1 wirecolor:blue 
p4 = sphere radius:1 wirecolor:blue
pInt1 = sphere radius:0 wireColor: black
pInt2 = sphere radius:0 wireColor: black
pInt3 = sphere radius:0 wireColor: black
t1 = sphere radius:0 wireColor: red
t2 = sphere radius:0 wireColor: red

animate on
	at time 0
(
	p1.pos = [-50,-25,0]
	p2.pos = [-25,-25,0]
	p3.pos = [25,25,0]
	p4.pos = [50,25,0]
)


fn GetAngleFromNormal theNormal theAxys =
(
local theZ = normalize theNormal --this is the original vector
if (dot theZ theAxys) > 0.99999 then --if the vector is nearly parallel to Z, assume 0
eulerangles 0 0 0
else
(
local theY = normalize (cross theAxys theZ) --this is the Y axis orthogonal to the Normal and Up
local theX = normalize (cross theY theZ) --this is the X orthogonal to Normal and Y
local theTM = matrix3 theX theY theZ [0,0,0] --this is the matrix3 describing the orientation of the Normal
theTM.rotationpart as eulerangles --return its Euler rotation 
)
)

fn salto OBJ T1 T2 CP1 CP2 CP3 time1 time2 = 
(

DIST = (CP2-CP1)
CP3.pos = CP1 + ((normalize DIST)*(((length DIST)/100)*50))
CP3.pos = CP3.pos + [0, 0, length DIST]
V1 = (CP3.pos-CP1)
V2 = (CP2-CP3.pos)
ROT = OBJ.rotation
	
animate on
(
	/* POSICION - INTERPOLACION */
	for t in time1 to time2 by 1 do
	(
		at time t
		(
			T1.pos = CP1 + ((normalize V1)*(((length V1)/(time2-time1)*(t-time1))))
			T2.pos = CP3.pos + ((normalize V2)*(((length V2)/(time2-time1)*(t-time1))))
			V3 = (T2.pos-T1.pos)			
			OBJ.pos = T1.pos + ((normalize V3)*(((length V3)/(time2-time1)*(t-time1))))
			/* ROTACION */
			DIST1 = CP2-CP1
			ANG1 = (GetAngleFromNormal DIST1 [0,1,0])
			OBJ.rotation.z_rotation = ANG1.z+90			
			DIST2 = CP3.pos-OBJ.pos
			ANG2 = (GetAngleFromNormal DIST2 [0,0,1])
			if (t > time1 AND t < time2) then
				if (t < (time1+time2)/2) then
					OBJ.rotation.y_rotation = ANG2.y
				else				
					OBJ.rotation.y_rotation = -ANG2.y
		)
		
	)
	/* ESCALA - SQUASH */
	at time time1
	(
		OBJ.scale = [1, 1, 0.5]
		OBJ.rotation = ROT
		OBJ.pos = CP1
	)
	at time (time1+2)
	(
		OBJ.scale = [1, 1, 2]
	)
	at time ((time1+time2)/2)
	(
		OBJ.scale = [1, 1, 1]
	)	
	at time (time2-2)	
	(
		OBJ.scale = [1, 1, 2]
	)	
	at time time2	
	(
		OBJ.scale = [1, 1, 0.5]
		OBJ.rotation = ROT
		OBJ.pos = CP2
	)
)
)

salto Teapot001 t1 t2 p1.pos p2.pos pInt1 0 25
salto Teapot001 t1 t2 p2.pos p3.pos pInt2 25 75
salto Teapot001 t1 t2 p3.pos p4.pos pInt3 75 100
