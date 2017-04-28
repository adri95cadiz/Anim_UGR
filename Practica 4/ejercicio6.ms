ball = sphere radius:10 wireColor:blue

animate on for t in 0 to 50 by 1 do
	at time t
( 		
	ball.pos = [(t*4)-100, 50 * sin( 720 * t * 2 / 100 ), 0]
)	
animate on for t in 50 to 100 by 1 do
	at time t
( 		
	ball.pos = [-(t*4)+300, 50 * sin( 720 * t * 2 / 100 ), 0]
)	


b2 = sphere radius:4 wireColor:red
animate on for t in 0 to 100 by 5 do
	at time t 
	(
		b2.pos = ball.pos + [20 * cos( 720 * t / 100 ), 20 * sin( 720 * t / 100 ) , 20 * tan( 720 * t / 100 ) ] 
	)
         
b3 = sphere radius:4 wireColor:red
animate on for t in 0 to 100 by 5 do
	at time t 
	(
		b3.pos = ball.pos + [20 * sin( 720 * t / 100 ), 20 * cos( 720 * t / 100 ) , 20 * tan( 720 * t / 100 ) ] 
	)