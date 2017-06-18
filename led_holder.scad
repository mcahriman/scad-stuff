module clamp() {
difference() {
    translate([0,0,5])
    cube([16,12,10], center=true);

    translate([0,0,4])
    cube([12,12,8],center=true);
    
}
}
union() {
difference() {
clamp();
    translate([0,0,8])
    #cylinder(d1=5, d2=3, $fn=20,h=2);
}

translate([-5.5,0,0.5])
cube([1,12,1],center=true);


translate([5.5,0,0.5])
cube([1,12,1],center=true);
}