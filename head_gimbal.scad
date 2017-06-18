module stepper() {
    translate([0,0,9.5])
    scale([10,10,10])
    import("3dparty/StepMotorModel.stl",convexivity=4);
}

module motor_plate(plate_diameter=50) {
     difference() {
        cylinder(d=plate_diameter, h=2, $fn=60);
        cylinder(d=9.5,h=2);
        
        //central mark and motor mounting holes
        translate([0,7.5,0]) {
            cylinder(d=1,h=2);
            translate([17.5,0,0]) {
                cylinder(d=3,h=2,$fn=20);
            }
            translate([-17.5,0,0]) {
                cylinder(d=3,h=2, $fn=20);
            }
        }
    }   
}
difference() {
translate([0,0,21]) {

    translate([-2,0,14]) {
       cube([8,12,12], center=true);
    }
    difference() {
    translate([0,0,1])
    cylinder(d=12,h=7);

    translate([0,0,4])
        cube([3,5,8], center=true);
    
    }
}



}

translate([-25,7,55])
rotate([0,90,0])
rotate([0,0,180])
#stepper();

difference() {
translate([-25,0,55])
rotate([0,90,0])
translate([0,0,19])
motor_plate(plate_diameter=55);

translate([-1,-19,55])
cube([10,20,55], center=true);
}
translate([20,6,55])
rotate([0,90,-90])
#stepper();


// enclosure and YAW motor mount

difference() {
    cylinder(d=63,h=19,$fn=60);
    cylinder(d=58,h=19,$fn=60);
    translate([0,32,5]) {
        cube([10,10,10], center=true);
    }
}
translate([0,0,19])
motor_plate(plate_diameter=63);