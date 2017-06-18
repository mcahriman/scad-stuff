
*translate([12,6,16.5])
rotate([180,0,0])
rotate([0,90,0])
9g_motor();

difference() {
cube([16,12,5]);
translate([0,2,1])
cube([14,8,4]);

translate([10,6,2.5])
rotate([0,90,0])
cylinder($fn=20,d=2,h=10);

translate([5,6,0])
  cylinder($fn=20,d=1,h=10);

translate([11,6,0])
  cylinder($fn=20,d=1,h=10);    

}



module 9g_motor(){
	difference(){			
		union(){
			color("steel blue") cube([23,12.7,22], center=true);
			color("steel blue") translate([0,0,5]) cube([32,12,2], center=true);
			color("steel blue") translate([5.5,0,2.75]) cylinder(r=6, h=25.75, $fn=20, center=true);
			color("steel blue") translate([-.5,0,2.75]) cylinder(r=1, h=25.75, $fn=20, center=true);
			color("steel blue") translate([-1,0,2.75]) cube([5,5.6,24.5], center=true);		
			color("white") translate([5.5,0,3.65]) cylinder(r=2.35, h=29.25, $fn=20, center=true);				
		}
		//translate([10,0,-11]) rotate([0,-30,0]) cube([8,13,4], center=true);
		for ( hole = [14,-14] ){
			translate([hole,0,5]) cylinder(r=2.2, h=4, $fn=20, center=true);
		}	
	}
}