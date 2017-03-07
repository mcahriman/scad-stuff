// The first ever stuff I made in openscad
// Contains some doubtful historical value

//313.44/74 = 45+37+7/X
//74
// L=23.7 (angle)

// d(magneto) = 5mm
// x=21

//110 mm cone r slope

//move 3.5mm+33.8mm

$fn=500;
module ckt_cup() {

 
    union() {
     difference() {
      cylinder(r1=100.7,r2=0,h=44,$fn=40);
      translate([0,0,30])
        cylinder(d=60,h=20);    
      
      };
      rotate_extrude(convexity = 40, $fn=40) 
        translate([106, 0, 0])
        difference() {
          circle(r = 6, $fn = 40);
          translate([-7,-16,0]) square(15);
        }
  }
}

module ckt_cup_opt() {

 
    union() {
     difference() {
      cylinder(r1=100.7,r2=0,h=44);
      translate([0,0,30])
        cylinder(d=60,h=20);    
      
      };
      rotate_extrude(convexity = 40) 
        translate([106, 0, 0])
        scale([1,2,1])
        square(11, center=true);
  }
}



module ckt_valve() {
union() {
cylinder(d=7,h=15);
translate([0,0,10]) {
        cylinder (d=29.6,h=5);
        translate([0,0,5])
          cylinder(h=31, d1=29.6, d2=11);
        translate([0,0,36])
          cylinder(d=15,h=2);
}
}
}


module servo_support() {

    


difference() {
    
    union() {
        translate([-20,0,1])
            cube([50,30,15]);
        translate([-20,0,15])
            cube([50,5,70]);
    }
    translate([0,100.7,0])
        ckt_cup_opt();
    
    translate([-9,14,5.7])
    rotate([23.7,0,0])
    cylinder(h=5,d=5);

    translate([9,14,5.7])
    rotate([23.7,0,0])
    cylinder(h=5,d=5);
    
    translate([28,-1,80])
    rotate ([-90,0,0])
    cylinder(h=20,d=3);


    translate([-17,-1,80])
    rotate ([-90,0,0])
    cylinder(h=20,d=3);

    
   translate([-17,-1,60])
   cube([44,24,15]); 
    
        
   translate([-17,-1,40])
   cube([44,24,15]); 

    
   translate([-17,-1,20])
   cube([44,24,15]); 
};

}

if(1) {
translate([0,100.7,0])
ckt_cup();

translate([0,37.3,14])  
ckt_valve();
}

//translate([0,0,30])
//rotate([0,90,0])
servo_support();

//ckt_cup_opt();
//ckt_cup();