$fn=60;

union() {
    difference() {
        cylinder(d=50,h=45);
        translate([0,0,1])
        cylinder(d=48,h=45);
    }
    difference() {
        cylinder(d=8,h=45);
        translate([0,0,1])
        cylinder(d=6,h=45);
    }
}