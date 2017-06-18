module stepper() {
    translate([0,0,9.5])
    scale([10,10,10])
    import("3dparty/StepMotorModel.stl",convexivity=4);
}

module bottom_pad() {
cylinder(d=70, h=2);
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
                cylinder(d=70, h=3);
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
        
        cylinder(d=9.5,h=4);
        translate([18,12-9.5/2,0])
        cylinder(d=3.5,h=4);
        translate([-18,12-9.5/2,0])
        cylinder(d=3.5,h=4);

        // mounting holes
    
    
        for(i=[0:30:360]) { 
            
          rotate([0,0,i])
          translate([0,30,0])
          cylinder(d=3.3,h=4, $fn=50);
        }
    }
    
    translate([12,-1.5,0]) cube([6,3,8]);
}

*bottom_pad();

translate([0,0,35])
rotate([180,0,0])
{ 
  *  #rotor();
    rotate([0,0,180])
    translate([0,7.5,-49])
    
 *   #stepper();
};


rotor();
