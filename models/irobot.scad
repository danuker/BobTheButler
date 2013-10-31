irobot_height = 10;
irobot_radius = 20;
irobot_back_space_width = 20;
irobot_back_space_depth = 5;


module irobot(){
    difference(){

    //The main body
    cylinder(h = irobot_height, r = irobot_radius);
    

    //The space inside
    translate([-irobot_back_space_width/2, 0, irobot_height-irobot_back_space_depth])  
	// difference(){
	
    cube([irobot_back_space_width, irobot_radius*2, irobot_back_space_depth]);
}
}

irobot();