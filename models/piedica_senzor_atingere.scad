radius1 = 9.8;
radius2 = 3.3;
height1 = 8;
height2 = 19;
trans_small_cyl_location = 6;

//--------------------------------------
module piedica_senzor_atingere()
{
  union(){
    color("red") cylinder(r = radius1, h = height1, $fn=40);
    translate([trans_small_cyl_location, 0, height1]) color("yellow") cylinder(r = radius2, h = height2, $fn = 40);
  }
}

piedica_senzor_atingere();