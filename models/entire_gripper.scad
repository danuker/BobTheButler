use <mendel_misc.inc>
use <parametric_involute_gear_v5.0.scad>


sheet_height = 4;
sheet_length = 100;

sheet_width = 60;

M3_radius = 1.5;

M4_thick = 4;
M4_radius = 2;
M4_spacer_thick = 0.75;
tolerance = 0.1;

M5_radius = 2.5;

M8_nut_hole_radius = 4;
M8_nut_thick = 6.14;
M8_nut_external_radius = 7.2;

U_finger_thick = 3;

finger_thick = 6;
finger_first_half_length = 65;
finger_second_half_length = 75;
finger_width = 12;

M8_support_thick = 10;
M8_support_height = (5 * finger_thick + 2 * U_finger_thick + 8 * 2 *
M4_spacer_thick) / 2;
M8_support_width = 40;

dist_to_m8_support = sheet_length -M8_support_thick ;

dist_to_m3 = 10;

M5_nut_hole_radius = 2.5;

dist_to_screw_hole = 5;


bearing_external_radius = 11;
bearing_internal_radius = 4;
bearing_thickness = 7;

wall_bearing = 1;

large_bearing_internal_radius = 17;
large_bearing_external_radius = 31;
large_bearing_thickness = 14;
//-----------------------------------------------------------------------------------
module support2()
{
        difference(){
                union(){
                        cylinder (r = large_bearing_internal_radius + 2 * wall_bearing, h =
2 * wall_bearing, $fn = 100);
                        translate ([0, 0, 2 * wall_bearing]) cylinder (r =
large_bearing_internal_radius, h = large_bearing_thickness /
2-wall_bearing, $fn = 100);
                }
// holes
                cylinder (r = bearing_external_radius - wall_bearing, h =
large_bearing_thickness / 2 + 2 * wall_bearing, $fn = 50);
                translate ([0, 0, (large_bearing_thickness - bearing_thickness) / 2
+ wall_bearing]) cylinder (r = bearing_external_radius, h =
large_bearing_thickness / 2 + 2 * wall_bearing, $fn = 50);
// m5
                translate ([bearing_external_radius + M5_radius + 0.2, 0, 0])
cylinder (r = M5_radius, h = large_bearing_thickness / 2 + 2 *
wall_bearing, $fn = 40);
                translate ([-bearing_external_radius - M5_radius - 0.2, 0, 0])
cylinder (r = M5_radius, h = large_bearing_thickness / 2 + 2 *
wall_bearing, $fn = 40);
// m3
                translate ([0, bearing_external_radius + 2 *M3_radius, 0]) cylinder
(r = M3_radius, h = large_bearing_thickness / 2 + 2 * wall_bearing,
$fn = 20);
                translate ([0, -bearing_external_radius - 2 *M3_radius, 0]) cylinder
(r = M3_radius, h = large_bearing_thickness / 2 + 2 * wall_bearing,
$fn = 20);

        }
}
//-----------------------------------------------------------------------------------
module support1()
{
        difference(){
                cube([2 * M8_support_height, bearing_thickness, M8_support_width/2 ]);
                translate ([M8_support_height, -.5, M8_support_width/2])
rotate([-90,0,0]) cylinder (r = 10.5, h = bearing_thickness + 1, $fn =
100);
// m5 support
                translate ([M8_support_height - 13.5, 0, M8_support_width/2])
rotate([-90,0,0]) cylinder (r = 2.5, h = bearing_thickness, $fn =
100);
                translate ([M8_support_height + 13.5, 0, M8_support_width/2])
rotate([-90,0,0]) cylinder (r = 2.5, h = bearing_thickness, $fn =
100);
// m4 support
                translate ([4, bearing_thickness / 2, 0]) cylinder (r = M4_radius+
tolerance, h = M8_support_width/2, $fn = 30 );
                translate ([2 * M8_support_height - 4, bearing_thickness / 2, 0])
cylinder (r = M4_radius + tolerance, h = M8_support_width/2, $fn = 30
);
        }
}
//-----------------------------------------------------------------------------------

module gripper_support()
{
        difference(){
                union(){
                        cube([sheet_length, sheet_width, sheet_height]);
                        translate ([dist_to_m8_support, sheet_width / 2 - M8_support_width
/ 2, sheet_height]) cube([M8_support_thick, M8_support_width,
M8_support_height]);
                }

                // canal
                translate([10, sheet_width / 2 - M4_radius - tolerance ,0])
cube([55, M4_thick + 2 * tolerance, sheet_height]);
                // holes from margin
                translate([dist_to_screw_hole, dist_to_screw_hole, 0]) cylinder(h =
sheet_height, r = M4_radius, $fn = 30);
                translate([dist_to_screw_hole, sheet_width - dist_to_screw_hole, 0])
cylinder(h = sheet_height, r = M4_radius, $fn = 30);
                // m8 support
                translate([dist_to_m8_support, sheet_width / 2, sheet_height +
M8_support_height ]) rotate([0, 90, 0]) cylinder (h =
M8_support_thick, r = M8_nut_hole_radius + 0.5, $fn = 50);
                translate([dist_to_m8_support +(M8_support_thick - M8_nut_thick) /2
, sheet_width / 2, sheet_height + M8_support_height ]) rotate([0, 90,
0]) cylinder (h = M8_nut_thick, r = M8_nut_external_radius, $fn = 6);
                // m3 holes
                translate([dist_to_m8_support + M8_support_thick / 2, sheet_width /2
- M8_support_width/2 + dist_to_m3, 0]) cylinder(r = M4_radius, h =
sheet_height + M8_support_height, $fn = 30);
                translate([dist_to_m8_support + M8_support_thick / 2, sheet_width /2
 + M8_support_width/2 - dist_to_m3, 0]) cylinder(r = M4_radius, h =
sheet_height + M8_support_height, $fn = 30);
// m5
                translate([dist_to_m8_support, sheet_width / 2 - 15, sheet_height +
M8_support_height ]) rotate([0, 90, 0]) cylinder (h =
M8_support_thick, r = M5_nut_hole_radius, $fn = 50);
                translate([dist_to_m8_support, sheet_width / 2 + 15, sheet_height +
M8_support_height ]) rotate([0, 90, 0]) cylinder (h =
M8_support_thick, r = M5_nut_hole_radius, $fn = 50);
                // remove some sheet
                translate([15, 0, 0]) cube([sheet_length - M8_support_thick - 15,
10, sheet_height]);
                translate([15, sheet_width - 10, 0]) cube([sheet_length -
M8_support_thick - 15, 10, sheet_height]);
                // remove material around M8 support
                translate([dist_to_m8_support, 0, 0]) cube([M8_support_thick,
(sheet_width - M8_support_width)/2, sheet_height]);
                translate([dist_to_m8_support, sheet_width - (sheet_width -
M8_support_width)/2, 0]) cube([M8_support_thick, (sheet_width -
M8_support_width)/2, sheet_height]);
        }
}
//-----------------------------------------------------------------------------------
module finger ()
{

        difference(){
                union(){
                        translate([finger_width/ 2,finger_width/ 2, 0 ]) cylinder(r
=finger_width / 2, h = finger_thick );
                        translate([finger_width/ 2,0, 0 ]) cube([finger_first_half_length -
finger_width / 2, finger_width, finger_thick]);
                }
                translate([dist_to_screw_hole, finger_width/2 - M4_radius -
tolerance, 0]) cube([25, M4_thick+2 * tolerance, finger_thick]);

                translate([50 + dist_to_screw_hole + M4_radius, finger_width/2, 0])
cylinder (r = M4_radius, h = finger_thick, $fn = 30);
        }
        translate([finger_first_half_length, 0, 0]) rotate([0, 0, 33])
        difference(){
                cube([finger_second_half_length, 12, finger_thick]);
                translate([finger_second_half_length / 2, 38, 0]) cylinder (r = 32,
h  = finger_thick, $fn = 100);
        }
}
//-----------------------------------------------------------------------------------
module bearing_support()
{

wall = 1;

  difference(){
                translate ([-bearing_external_radius - 2 *
wall,-bearing_external_radius - 2 * wall,0]) cube ([2 *
bearing_external_radius + 4 * wall, 2 * bearing_external_radius + 4 *
wall, bearing_thickness + wall], center = false);
                translate([0,0,wall]) cylinder (r = bearing_external_radius, h =
bearing_thickness, center = false, $fn=100);
                cylinder (r = bearing_external_radius - wall, h = bearing_thickness
+ wall, center = false, $fn=100);

                translate([bearing_external_radius - wall, bearing_external_radius -
wall, 0]) cylinder(r = M3_radius, h = bearing_thickness + wall, center
= false, $fn = 30);
                translate([bearing_external_radius - wall, -(bearing_external_radius
- wall), 0]) cylinder(r = M3_radius, h = bearing_thickness + wall,
center = false, $fn = 30);
                translate([-(bearing_external_radius - wall),
bearing_external_radius - wall, 0]) cylinder(r = M3_radius, h =
bearing_thickness + wall, center = false, $fn = 30);
                translate([-(bearing_external_radius - wall),
-(bearing_external_radius - wall), 0]) cylinder(r = M3_radius, h =
bearing_thickness + wall, center = false, $fn = 30);

        }
}
//-----------------------------------------------------------------------------------
module U()
{
        margin = 2;


margin_height = 20;

margin_width = 18;

        difference(){
                union(){
                        translate ([-M8_support_height + margin, -bearing_external_radius
- 2 * wall_bearing,0]) cube ([2 * M8_support_height - 2 * margin, 2 *
bearing_external_radius + 4 * wall_bearing, U_finger_thick], center =
false);
                        //urechile
                        difference(){
                                union(){
                                        translate([-M8_support_height + margin,  -margin_width / 2,
U_finger_thick]) cube([U_finger_thick, margin_width, margin_height]);
                                        translate([-M8_support_height + margin,  0, U_finger_thick +
margin_height]) rotate([0, 90, 0]) cylinder(r = margin_width / 2, h =
U_finger_thick, $fn = 50);
                                }
                                translate([-M8_support_height + margin - 0.5,  0, U_finger_thick +
margin_height + 1]) rotate([0, 90, 0]) cylinder(r = M4_radius, h =
U_finger_thick + 1, $fn = 30);
                        }
                        difference(){
                                union(){
                                        translate([M8_support_height - margin - U_finger_thick,
-margin_width / 2, U_finger_thick]) cube([U_finger_thick,
margin_width, margin_height]);
                                        translate([M8_support_height - margin- U_finger_thick,  0,
U_finger_thick + margin_height]) rotate([0, 90, 0]) cylinder(r =
margin_width / 2, h = U_finger_thick, $fn = 50);
                                }
                                translate([M8_support_height - margin - 0.5 - U_finger_thick,  0,
U_finger_thick + margin_height + 1]) rotate([0, 90, 0]) cylinder(r =
M4_radius, h = U_finger_thick + 1, $fn = 50);
                        }
                }
                cylinder (r = bearing_external_radius - 1, h = U_finger_thick,
center = false, $fn=100);

                translate([bearing_external_radius - wall_bearing,
bearing_external_radius - wall_bearing, 0]) cylinder(r = M3_radius, h
= bearing_thickness + wall_bearing, center = false, $fn = 30);
                translate([bearing_external_radius - wall_bearing,
-(bearing_external_radius - wall_bearing), 0]) cylinder(r = M3_radius,
h = bearing_thickness + wall_bearing, center = false, $fn = 30);
                translate([-(bearing_external_radius - wall_bearing),
bearing_external_radius - wall_bearing, 0]) cylinder(r = M3_radius, h
= bearing_thickness + wall_bearing, center = false, $fn = 30);
                translate([-(bearing_external_radius - wall_bearing),
-(bearing_external_radius - wall_bearing), 0]) cylinder(r = M3_radius,
h = bearing_thickness + wall_bearing, center = false, $fn = 30);

        }
}
//-------------------------------------------------------------------------------
module gear_M8_long()
{

gear_thick = 35;
hub_thick = 10;

M3_nut_external_radius = 3.5;
M3_nut_external_radius_edges = 3.1;
M3_nut_thick = 3;

        difference(){
                union(){
                        gear (number_of_teeth=10,
                                circular_pitch=253,
                                gear_thickness = gear_thick,
                                rim_thickness = gear_thick,
                                rim_width = 0,
                                hub_thickness = 0,
                                hub_diameter = 0,
                                bore_diameter = 9,
                                circles=0);
                        translate([0, 0, gear_thick]) cylinder(r = 8.5, h = 10);
                }
//prima
                translate([0, 10, gear_thick + hub_thick / 2])
rotate([90,0,0])cylinder (r = 1.5, h =20, $fn = 30, center = false);

                translate([0, 4, gear_thick + hub_thick / 2]) rotate([0,90,0])
rotate([-90,0,0])cylinder (r = M3_nut_external_radius, h
=M3_nut_thick, $fn = 6, center = false);
                translate([-M3_nut_external_radius_edges, 4, gear_thick + hub_thick
/ 2]) cube (size = ([2 * M3_nut_external_radius_edges, M3_nut_thick,
20]), center = false);

                translate([0, -7, gear_thick + hub_thick / 2]) rotate([0,90,0])
rotate([-90,0,0])cylinder (r = M3_nut_external_radius, h
=M3_nut_thick, $fn = 6, center = false);
                translate([-M3_nut_external_radius_edges, -7, gear_thick + hub_thick
/ 2]) cube (size = ([2 * M3_nut_external_radius_edges, M3_nut_thick,
20]), center = false);

// big hole
                translate([0, 0, 0]) cylinder(r = 4.5, h = gear_thick + hub_thick, $fn = 100);

        }
}
//-------------------------------------------------------------------------------
module lego_gear()
{

gear_thick = 7;
hub_thick = 7;

M3_nut_external_radius = 3.5;
M3_nut_external_radius_edges = 3.1;
M3_nut_thick = 3;

distance2 = 20;
distance3 = 30;
radius1 = 10;
radius2 = 8;

        difference(){
                        gear (number_of_teeth=66,
                                circular_pitch=253,
                                gear_thickness = gear_thick,
                                rim_thickness = gear_thick,
                                rim_width = 0,
                                hub_thickness = 0,
                                hub_diameter = 0,
                                bore_diameter = 9,
                                circles=0);

// big hole
                translate([0, 0, 0]) cylinder(r = 9, h = gear_thick + hub_thick, $fn = 100);

// holes
//              cylinder (r = bearing_external_radius - wall_bearing, h =large_bearing_thickness / 2 + 2 * wall_bearing, $fn = 50);
//              translate ([0, 0, (large_bearing_thickness - bearing_thickness) /2 + wall_bearing]) cylinder (r = bearing_external_radius, h =large_bearing_thickness / 2 + 2 * wall_bearing, $fn = 50);
// m5
                translate ([bearing_external_radius + M5_radius + 0.2, 0, 0])
cylinder (r = M5_radius, h = 10, $fn = 40);
                translate ([-bearing_external_radius - M5_radius - 0.2, 0, 0])
cylinder (r = M5_radius, h = 10, $fn = 40);
// m3
                translate ([0, bearing_external_radius + 2 *M3_radius, 0]) cylinder
(r = M3_radius, h = 10, $fn = 20);
                translate ([0, -bearing_external_radius - 2 *M3_radius, 0]) cylinder
(r = M3_radius, h = 10, $fn = 20);
//save material
                translate ([distance2, distance2, 0]) cylinder (r = radius1, h = 10,$fn = 40);
                translate ([distance2, -distance2, 0]) cylinder (r = radius1, h =10, $fn = 40);
                translate ([-distance2, -distance2, 0]) cylinder (r = radius1, h =10, $fn = 40);
                translate ([-distance2, distance2, 0]) cylinder (r = radius1, h =10, $fn = 40);

                translate ([distance3, 0, 0]) cylinder (r = radius2, h = 10, $fn = 40);
                translate ([-distance3, 0, 0]) cylinder (r = radius2, h = 10, $fn = 40);
                translate ([0,distance3, 0]) cylinder (r = radius2, h = 10, $fn = 40);
                translate ([0,-distance3, 0]) cylinder (r = radius2, h = 10, $fn = 40);

        }
}
//-------------------------------------------------------------------------------



module motor_cap() {

h_cylinder = 4;
h_peripherical_legs = 7;
radius_peripherical_legs = 2.25;
radius_central_hole = 1.5;
radius_cylinder = 11.65;
marginal_distance = 1.2;
per_leg_trans = radius_cylinder-radius_peripherical_legs-marginal_distance;

gear_thick = 15;

        difference() {
                union() {
                // Main cylinder
                cylinder(h = h_cylinder, r2 = radius_cylinder, r1 =
8.4, center = false, $fn = 100);

                translate ([0,0,-gear_thick])    gear (number_of_teeth=10,
                                circular_pitch=253,
                                gear_thickness = gear_thick,
                                rim_thickness = gear_thick,
                                rim_width = 0,
                                hub_thickness = gear_thick,
                                hub_diameter = 25,
                                bore_diameter = 0,
                                circles=0);

                // Peripherical legs
                translate([per_leg_trans, 0, h_cylinder])
color("black") cylinder(h = h_peripherical_legs, r =
radius_peripherical_legs, center = false, $fn= 100);
                translate([-per_leg_trans, 0, h_cylinder])
color("black") cylinder(h = h_peripherical_legs, r =
radius_peripherical_legs, center = false, $fn= 100);
                translate([0, per_leg_trans, h_cylinder])
color("black") cylinder(h =h_peripherical_legs, r =
radius_peripherical_legs, center = false, $fn= 100);
                translate([0, -per_leg_trans, h_cylinder])
color("black") cylinder(h =h_peripherical_legs, r =
radius_peripherical_legs, center = false, $fn= 100);
                }
                // Central hole
                translate ([0, 0, -gear_thick]) cylinder(h =
h_cylinder + gear_thick, r =radius_central_hole, center = false, $fn =
100);

        }
}
//-----------------------------------------------------------------------------------------
module big_bearing_tshirt()
{
  large_wall = 3;
k = 3;
        difference (){
                translate ([-large_bearing_external_radius - k * large_wall,
-large_bearing_external_radius - k * large_wall, 0])  cube ([2 *
(large_bearing_external_radius + k * large_wall), 2 *
(large_bearing_external_radius + k * large_wall),
large_bearing_thickness/2 + large_wall]);
                translate ([0, 0, large_wall]) cylinder (r =
large_bearing_external_radius + 0.1, h = large_bearing_thickness, $fn
= 100);
                cylinder (r = large_bearing_external_radius - large_wall, h =
large_bearing_thickness, $fn = 100);
                difference (){
                translate ([0, 0, large_wall]) cylinder (r =
large_bearing_external_radius + 10 * large_wall, h =
large_bearing_thickness, $fn = 100);
                translate ([0, 0, large_wall]) cylinder (r =
large_bearing_external_radius + large_wall, h =
large_bearing_thickness, $fn = 100);

                }
        }
}

//-------------------------------------------------------------------------------
module big_bearing_tshirt_plate()
{
  large_wall = 3;
k = 3;
        difference (){
                translate ([-large_bearing_external_radius - k * large_wall,
-large_bearing_external_radius - k * large_wall, 0])  cube ([2 *
(large_bearing_external_radius + k * large_wall), 2 *
(large_bearing_external_radius + k * large_wall), large_wall]);
                cylinder (r = large_bearing_external_radius - large_wall, h =
large_bearing_thickness, $fn = 100);
        }
}

//-------------------------------------------------------------------------------
//big_bearing_tshirt_plate();

//big_bearing_tshirt();

//motor_cap();

lego_gear();

//support1();

//gear_M8_long();

//U();

//bearing_support();

//finger();

//gripper_support();