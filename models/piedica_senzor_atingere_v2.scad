width = 10;
length = 100;
height = 10;
r_small_cyl = 2.5;
r_large_cyl = 4;
r_surub = 1.5;

//--------------------------------------
module piedica_senzor_atingere_v2()
{
  difference(){
    color("red") cube([width, length, height]);
    translate([0, 13 + r_small_cyl, 0]) color("yellow") cylinder(h=height, r=r_small_cyl, $fn=40);
    translate([0, 19.3  + r_small_cyl*2 + r_large_cyl, 0]) color("black") cylinder(h=height, r=r_large_cyl, $fn=40);
    translate([0, 25.6 + r_small_cyl*3 + r_large_cyl*2, 0]) color("yellow") cylinder(h=height, r=r_small_cyl, $fn=40);
   translate([0, 13 + r_small_cyl, 5]) rotate([90, 0, 0]) color("green") cylinder(h=13 + r_small_cyl, r=r_surub, $fn=40);
  }
}

piedica_senzor_atingere_v2();