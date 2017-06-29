include <stepper.scad>;

//this design has appeared bogus a bit

module bottom_pad() {
cylinder(d=70, h=2, $fn=100);
cylinder(d=12,h=3);
difference() {
    
cylinder(d=8,h=10,$fn=30);
translate([0,0,3+3.5])
cube([3.3,5.3,7],center=true);
}
}


module rotor() {
    difference() {
        union() {
            difference(){
                cylinder(d=70, h=3, $fn=100);
            }
            difference() {
                //bearing holder
                cylinder(d=27,h=10);
                translate([0,0,4])
                cylinder(d=22.2,h=7,$fn=100);
                translate([0,0,1])
                cylinder(d=20,h=7,$fn=100);
                
            }
        }
        // servos holes
        servos_holes();

        // mounting holes
    
    
        for(i=[0:30:360]) { 
            
          rotate([0,0,i])
          translate([0,30,0]) {
          translate([0,0,2])
          cylinder(d=4.5,h=1, $fn=20);
          cylinder(d=3.3,h=4, $fn=20);
          }
        }
    }
    
    translate([12,-1.5,0]) cube([6,3,8]);
}

module servos_holes() {
        cylinder(d=9.5,h=4);
        translate([18,12-9.5/2,0])
        cylinder(d=3.5,h=4);
        translate([-18,12-9.5/2,0])
        cylinder(d=3.5,h=4);

}

module tilt_support() {
    difference() {
        intersection() {
        translate([15,-35,0])
            cube([21,70,60]);
            cylinder(d=70,h=60);
        }
        translate([18,-25,4])
        cube([35,50,60]);
        translate([4,-7,0]) rotate([0,90,0]) cylinder(d=10,h=20);
        translate([4,-15,14]) rotate([0,90,0]) cylinder(d=17,h=20);
        
        translate([14,13,35]) rotate([0,90,0]) {
            
            cylinder(d=10,h=20);
            translate([18,-(12-9.5/2),0])
            cylinder(d=3.5,h=20);
            translate([-18,-(12-9.5/2),0])
            cylinder(d=3.5,h=20);
        
        }
        
        for(i=[0:30:360]) { 

                rotate([0,0,i])
                translate([0,30,0]) {
                translate([0,0,2])
                cylinder(d=4.5,h=1, $fn=20);
                cylinder(d=3.3,h=4, $fn=20);
            }
        }
    }
}


module assembly() {
    rotate([180,0,0])
    *rotor();

    translate([0,-7.5,19])
    rotate([180,0,0])
    #stepper();

    translate([37,5,35])
    rotate([-90,90,90])
    #stepper();


    translate([-9,15,55])
    rotate([-90,90,0])
    #stepper();

    rotate([180,0,0])
    rotor();
    tilt_support();
    translate([0,0,-4])
    bottom_pad();
}
module t_axis_support() {
    
    #stepper();
    
    translate([0,0,19]) {
        difference() {
            translate([-21,-16.5,0]) {
                cube([42,20,2]);
            }
            translate([0,-(12-8/2),0]) servos_holes();
        }
    }
    translate([-21,-16.5,0]) cube([42,2,21]);
    difference() {
        union() {
            cylinder(d=32,h=19);
            #cube([42,20,19]);
        }
        cylinder(d=29,h=19);
        translate([-21,-5,0])
        cube([42,30,30]);
        
        
    }
}


assembly();

*t_axis_support();

