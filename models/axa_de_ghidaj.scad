module ghidaj_support()
{
        difference(){
                translate ([-41,-10,0]) cube ([82, 20, 6], center = false);
                cylinder (r = 4, h = 6, center = false, $fn = 50);
                translate([33.5, -4, 0]) cube([5, 7, 6], center = false);
                translate([-38.5, -4, 0]) cube([5, 7, 6], center = false);
                translate([0,0,3])rotate([-90,0,0]) cylinder(h = 12, r = 1.5, $fn = 30);
        }
}
ghidaj_support();