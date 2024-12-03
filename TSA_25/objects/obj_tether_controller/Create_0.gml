tether = true;
tether_legnth = 16;
points = [0,0,0,0,0,0,0,0,0,0,0,0];
for (i=0;i<8;i++) {
	objec[i] =instance_create_layer(x,y,"Instances",obj_link);	
}
function segment(lengths,iterations) {
	var r0= lengths;
	var r1 = lengths;
	var x0 = x
	var y0 = y
	var x1=0;
	var y1 = 0;
	for (i=0;i<iterations;i++) {
		if (i!=0) {
			x1 = points[i*2-2];
			y1 = points[i*2-1];
		}
		else {
			if sqrt(sqr(obj_player_b.x-x)+sqr(obj_player_b.y-y))<=lengths*(iterations+1) {
				x1 = obj_player_b.x;
				y1 = obj_player_b.y;
			}	
		}
		var d =sqrt(sqr(x1-x)+sqr(y1-y))
		if (i!=iterations-1) {
			r0 = (d/(lengths*(iterations+1-i)))*(lengths*(iterations-i))
		}
		else {
			r0 = lengths
		}
		if d > r0 + r1 {
		    return}
		if d < abs(r0-r1){
		    return}
		if d == 0 and r0 == r1{
		    return}
		else{
		    var a=(sqr(r0)-sqr(r1)+sqr(d))/(2*d)
			var h = 0;
			if a<r0{
				h=sqrt(sqr(r0)-sqr(a))
			}
			else {
			}
		    var x2=x0+a*(x1-x0)/d   
		    var y2=y0+a*(y1-y0)/d 
			
			var hx = (h*(y1-y0))/d
			var hy = (h*(x1-x0))/d
			
		    var x3=x2+hx
		    var y3=y2-hy

		    var x4=x2-hx
		    var y4=y2+hy
			
			var nx = 0;
			var ny = 0;
			
			if point_distance(x3,y3,0,0)<point_distance(x4,y4,0,0){
				nx = x3
				ny = y3
			}
			else {
				nx = x4
				ny = y4
			}
			draw_line(nx,ny,x1,y1);		
			if(i==iterations-1) {
				draw_line(nx,ny,x,y);
			}
			draw_rectangle(nx,ny,nx+10,ny+10,false)
		    //return (x3, y3, x4, y4)
			points[i*2] = nx;
			points[i*2+1] = ny;
		}
	}
}