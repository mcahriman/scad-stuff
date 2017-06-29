module stepper() {
    translate([0,8,-9.5])
    scale([10,10,10])
    import("3dparty/StepMotorModel.stl",convexivity=4);
}

module stepper_holes(h=3,$fn=15) {
   
    cylinder(d=10,h=h);
    translate([17.5,8,0]) cylinder(d=3.5,h=h);
    translate([-17.5,8,0]) cylinder(d=3.5,h=h);

}

module shaft_holder_with_inserts(h=10, d=10,shaft_x=3, shaft_y=5, d_ins=4, h_ins=4, tolerance = 0.3, thickness=2) {
    
    //calculating minimum viable d
    shaft_larger_side =  shaft_x > shaft_y ? shaft_x : shaft_y;
    
    min_d = shaft_larger_side + 2*tolerance + (2*tolerance + h_ins) *2;
    
    
    if(min_d > d) echo("Too small holder diameter set, actual d is: ", min_d);
    actual_d = min_d > d ? min_d : d;
    
    min_h = d_ins+tolerance*2 +thickness*2;
    if(min_h > h) echo("Too small holder hight is set, actual h is: ", min_h);
    actual_h = min_h > h ? min_h : h;


    inserts_holes_rotate_direction = shaft_x > shaft_y ? [90,0,0] : [0,90,0];
    inserts_holes_translate = shaft_x > shaft_y ? 
        [0,actual_d/2,actual_h-d_ins/2-thickness] : [-actual_d/2,0,actual_h-d_ins/2-thickness];
    
    difference() {
        cylinder(d=actual_d ,h=actual_h);
        translate([0,0,actual_h/2])
        cube([shaft_x+tolerance,shaft_y+tolerance,actual_h], center=true);
        translate(inserts_holes_translate)
        rotate(inserts_holes_rotate_direction) cylinder(h=actual_d, d=d_ins+tolerance, $fn=15);
    }
}

shaft_holder_with_inserts();