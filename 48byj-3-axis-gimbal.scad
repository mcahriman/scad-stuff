use <./stepper.scad>;


// here we will draw a platform
//stuff with triangle supports where byj motor fits

//front panel (roll motor)

module roll_support(front_panel_thickness = 3, front_panel_height=35,
        front_panel_width=48,front_support_height=20,panel_offset_y = 8,debug=false) {
    
    module front_panel_assembly() {
        translate([0,0,3])
        rotate([0,180,0])
        #stepper();


        difference() {
            translate([0,panel_offset_y ,front_panel_thickness / 2]) {
                cube([front_panel_width,
                      front_panel_height,
                      front_panel_thickness],center=true);
                }
            stepper_holes(debug=debug);
        }
        
        translate([0, -panel_offset_y ,front_support_height/2 + front_panel_thickness ])
        cube([front_panel_width,front_panel_thickness,front_support_height],
              center=true);
    }
    module side_support() {
        linear_extrude(front_panel_thickness)
        polygon([ [panel_offset_y - front_panel_height,0], 
                  [panel_offset_y ,0],
                  [panel_offset_y ,front_support_height+front_panel_thickness],
                  [panel_offset_y - front_panel_thickness ,front_support_height+front_panel_thickness],
                  [panel_offset_y - front_panel_height,15] ]);
    }
    
    
    
    module full_roll_support_assembly() {
        front_panel_assembly();
        translate([front_panel_width/2,-front_panel_thickness/2,0])
        rotate([90,0,-90])
        side_support();
        translate([-front_panel_width/2+front_panel_thickness,-front_panel_thickness/2,0])
        rotate([90,0,-90])
        side_support();
    }
    
    
    full_roll_support_assembly();
    translate([-front_panel_width/2,front_panel_height/2- panel_offset_y,front_support_height/2])
    rotate([0,-90,0])
    shaft_holder_with_inserts(d=15);
    
    translate([front_panel_width/2,front_panel_height/2- panel_offset_y,front_support_height/2])
    rotate([0,90,0])
    cylinder(d=7.5,h=7.5,$fn=25);

    
    
}


module support_rib(support_height=50, support_width=30) {
    linear_extrude(2){
    support_rib_depth=7;
    polygon( [[0,0],[support_rib_depth,0],[support_rib_depth,support_height],[support_rib_depth-1,support_height]]);
    }
}

module support_plane(support_height=50) {
    linear_extrude(3) {
        hull() {
        translate([0,8])
        circle(d=28);
        translate([-21,4])
            square([42,support_height],center=false);
        }
    }
}

module pitch_motor_support() {

    support_height=50;
    support_width=30;


    module motor_support() {
        support_plane();
    }


    difference() {
        
        union() {
            motor_support();
            translate([-18,support_height+4,-7])
            rotate([180,-90,0])
            support_rib();
        
            translate([16,support_height+4,-7])
            rotate([180,-90,0])
            support_rib();

        }
        translate([0,0,-3])
        stepper_holes(h=6);
    }
      

    translate([-10,-9.5,-35.5])
    rotate([0,90,0]){
        roll_support(); 
    }
    translate([0,0,3.5])
    rotate([180,0,180])
    *stepper();
    
    translate([-37,support_height+3,-71])
    cube([74,3,74]);
}
translate([0,53,53])
rotate([-90,0,0])
pitch_motor_support(); 