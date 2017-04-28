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

fn jump OBJ CP1 CP2 time1 time2 = 
(

local CP3 = sphere radius:0 
local T1 = sphere radius:0 
local T2 = sphere radius:0

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

rollout numSaltosSelect "numSaltos"
(
	label EActor "Actor:" 
	pickbutton UI_SelectorActor "Selecciona Actor"
	label LabelSaltos "Numero Saltos"
	spinner UI_NJ "Saltos (1-10)" range:[1,10,3] type:#Integer
	button UI_numSaltos "Aceptar"	
	
	on UI_SelectorActor picked obj do
	(
		global Traveler = obj
		UI_SelectorActor.text = obj.name
	)
	
	on UI_numSaltos pressed do
	(
		global numSaltos = UI_NJ.value
		DestroyDialog numSaltosSelect
		createDialog Salto
	)
	
)

global numSaltosLeft = numSaltos 

createDialog numSaltosSelect

rollout Salto ("Salto"+(numSaltos-numSaltosLeft+1) as string)
(
	label EP1 "P1:" 
	pickbutton UI_SelectorP1 "Selecciona P1"
	label EP2 "P2:" 
	pickbutton UI_SelectorP2 "Selecciona P2"
	
	spinner UI_IF "Comienzo" range:[0,1000,0] type:#Integer
	spinner UI_FF "Duracion" range:[5,100,20] type:#Integer
	button UI_CrearSalto "Crear"
	
	on UI_SelectorP1 picked obj do
	(
		global P1 = obj
		UI_SelectorP1.text = obj.name
	)
	on UI_SelectorP2 picked obj do
	(
		global P2 = obj
		UI_SelectorP2.text = obj.name
	)
	
	on UI_CrearSalto pressed do
	(
		  if salto != undefined do
		  (				    				  
			  jump Traveler P1.pos P2.pos UI_IF.value (UI_IF.value+UI_FF.value)
			  Traveler.showtrajectory = on
			  numSaltosLeft -= 1;			  
			  DestroyDialog Salto
			  if(numSaltosLeft > 0) do
			  (				  
				createDialog Salto
			  )
		  )
    )
)


