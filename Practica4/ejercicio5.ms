Sphere001 = sphere radius:5 wireColor:blue
Sphere002 = sphere radius:5 wireColor:blue
Sphere003 = sphere radius:5 wireColor:blue
Sphere004 = sphere radius:5 wireColor:blue
Sphere005 = sphere radius:5 wireColor:blue
Sphere006 = sphere radius:5 wireColor:blue
Sphere007 = sphere radius:5 wireColor:blue
Sphere008 = sphere radius:5 wireColor:blue
Sphere009 = sphere radius:5 wireColor:blue
Sphere010 = sphere radius:5 wireColor:blue
Sphere011 = sphere radius:5 wireColor:blue

animate on
	at time 0
(
	Sphere001.pos = [-50, 0, 0]	
	Sphere002.pos = [-40, 0, 0]	
	Sphere003.pos = [-30, 0, 0]	
	Sphere004.pos = [-20, 0, 0]	
	Sphere005.pos = [-10, 0, 0]	
	Sphere006.pos = [0, 0, 0]	
	Sphere007.pos = [10, 0, 0]	
	Sphere008.pos = [20, 0, 0]	
	Sphere009.pos = [30, 0, 0]	
	Sphere010.pos = [40, 0, 0]	
	Sphere011.pos = [50, 0, 0]	
)
animate on for t in 0 to 100 by 1 do
		at time t
	( 		
		Sphere001.pos = [-50, 30 * sin( 720 * t / 100 ), 0]	
		Sphere002.pos = [-40, 30 *sin( 720 * (10+t) / 100 ), 0]	
		Sphere003.pos = [-30, 30 *sin( 720 * (20+t) / 100 ), 0]	
		Sphere004.pos = [-20, 30 *sin( 720 * (30+t) / 100 ), 0]	
		Sphere005.pos = [-10, 30 *sin( 720 * (40+t) / 100 ), 0]	
		Sphere006.pos = [0, 30 *sin( 720 * (50+t) / 100 ), 0]	
		Sphere007.pos = [10, 30 *sin( 720 * (60+t) / 100 ), 0]	
		Sphere008.pos = [20, 30 *sin( 720 * (70+t) / 100 ), 0]	
		Sphere009.pos = [30, 30 *sin( 720 * (80+t) / 100 ), 0]	
		Sphere010.pos = [40, 30 *sin( 720 * (90+t) / 100 ), 0]	
		Sphere011.pos = [50, 30 *sin( 720 * (100+t) / 100 ), 0]	
	)