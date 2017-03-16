use <circular_latches.scad>
$fn=50;
translate([0,0,50])
difference(){ 
    cylinder(d=60, h=3);
    cylinder(d=4,h=3);
}
difference() {
cylinder(d=46,h=50)
translate([0,0,-1]);
    cylinder(d=36,h=62);
    
}
circular_latches(radius=23, count=8, latch_angle=30, latch_width=8, latch_rotate = [180,0,0]);