object_heigth = 16.072;
pololu_screw_radius = 1.0922;
height_error = -0.02;

module omni_wheel()
{
difference() {
	union() {
		//bring the whole object at z = 0
		translate([0,0,2.072])  import_stl("omniwheel36mmouter_fixed.stl");
		difference() {
			color([0,0,1]) cylinder(h = object_heigth, r = 2.6, $fn=25);
			color([0,1,1]) cylinder(h = object_heigth, r = 1.7, $fn=25);
		}

		translate([1.3,-1.7,0]) color([1,1,1]) cube([1.2,3.4, object_heigth]);

		// adauga piedica pentru electrozi pentru o fixare mai buna
		translate([10,16,9]) rotate([0,0,84]) color([1,0,0]) cube([0.8,2,3]);
		translate([-8,16.2,9]) rotate([0,0,96]) color([1,0,0]) cube([0.8,2,3]);

		translate([16.2,8,9]) rotate([0,0,6]) color([1,0,0]) cube([0.8,2,3]);
		translate([16,-10,9]) rotate([0,0,-4]) color([1,0,0]) cube([0.8,2,3]);

		translate([10,-16.9,9]) rotate([0,0,92]) color([1,0,0]) cube([0.8,2,3]);
		translate([-8,-17,9]) rotate([0,0,84]) color([1,0,0]) cube([0.8,2,3]);

		translate([-17,8,9]) rotate([0,0,-6]) color([1,0,0]) cube([0.8,2,3]);
		translate([-16.8,-10,9]) rotate([0,0,6]) color([1,0,0]) cube([0.8,2,3]);
	}
	//gauri pentru suruburile pololu (raza de pololu_screw_radius)
	translate([6.35,0,height_error]) color([1,0,1]) cylinder(h = object_heigth+0.06, r = pololu_screw_radius, $fn=25);
	translate([-6.35,0,height_error]) color([1,0,1]) cylinder(h = object_heigth+0.06, r = pololu_screw_radius, $fn=25);
	translate([0,6.35,height_error]) color([1,0,1]) cylinder(h = object_heigth+0.06, r = pololu_screw_radius, $fn=25);
	translate([0,-6.35,height_error]) color([1,0,1]) cylinder(h = object_heigth+0.06, r = pololu_screw_radius, $fn=25);

}
//translate([0,18,0]) rotate([90,0,90]) color([1,0,0]) cylinder(h = 10, r=1.5, $fn=25);
}

omni_wheel();