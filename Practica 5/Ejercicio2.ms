-- crea array 10x10 de cubos de lado 1 
for x = 1 to 10 do
for y = 1 to 10 do
Box pos:[x*2,y*2,0] name:("dot_" + x as string + "_" + y as string) \
      lengthsegs:1 widthsegs:1 heightsegs:1 \
      length:1 width:1 height:1 

	
-- crea materiales
mm = multimaterial numsubs:2 name:"Color"
mm.names = #("on", "off")
mm[1].diffuse = mm[1].ambient = white
mm[2].diffuse = mm[2].ambient = black

dots = $dot* as array -- creamos el array de objetos
dots.mat = mm -- asigna el material 

-- añade un modificador para cambiar indice de submaterial a cada objeto
for obj in dots do (
addModifier obj (materialModifier name:"MatMod")
	obj.modifiers[#MatMod].materialID = 2
)

-- animar materialID's
with animate on (
  for t = 0 to 100 by 1 do 
  (
    sliderTime = t
    for obj in dots do
      if (obj.transform.pos.x > 15*cos( 720 * t / 100 ) and obj.transform.pos.y > 15*sin( 720 * t / 100 )) then
      (  
		obj.modifiers[#MatMod].materialID = 1
	  )
	  else 
	  (
        obj.modifiers[#MatMod].materialID = 2
	  )	 
	  if(t<100) do
		if(dots[t+1].transform.pos.x > 15*cos( 720 * t / 100 ) and dots[t+1].transform.pos.y > 15*sin( 720 * t / 100 )) then
			(
			dots[t+1].modifiers[#MatMod].materialID = 2
			)
		else
			(			
			dots[t+1].modifiers[#MatMod].materialID = 1
			)				
  )
)

playAnimation()
--stopAnimation()