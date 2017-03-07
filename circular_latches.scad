use <basic_latch.scad>
$fn=100;
module circular_latches(radius=50, count=6, arc=360,  base_width=5, latch_width=15, base_height=10, latch_height=5, latch_angle=10 ) {
   step = arc/count;
   union()
   for(i = [0:step:arc]) {
       x=sin(i)*radius; y=cos(i)*radius;
       translate([x,y,0])
         rotate([0,0,-i])
         latch(base_width,latch_width,base_height,latch_height,latch_angle);
   }
}

#union(){
    circular_latches(radius=15.5/2, base_width=2, latch_width=3, base_height=8, latch_height=2, latch_angle=40);
    rotate([0,180,0])
    cylinder(d1=15.5+4,d2 =15, h=5);
    cylinder(d=15.5+4,h=1);
    translate([0,0,-5])
    rotate([90,0,0])
    difference() {    
        cylinder(d=3,h=1);
        translate([0,0,-0.5])
        cylinder(d=1.5,h=2);
    }

}