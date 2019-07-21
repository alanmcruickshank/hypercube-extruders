use <Chamfers-for-OpenSCAD/Chamfer.scad>;

$fs = 0.01;

/// Bearing Arm
// motor mount screws at 31mm apart and mounted with M3 screws

armBalance();

module armBalance(){
    difference(){
        union(){
            difference(){
                union(){
                    translate([-12,-5,-4]) chamferCube(36,10,10,0.5);
                    intersection(){ // clever chamfering
                        translate([-18.5,-5,-4]) chamferCube(32,10,10,0.5);
                        translate([-18.5,-10,-6]) chamferCube(32,20,12,4);
                    }
                    translate([0,-5,2]) scale([1,1,0.8]) rotate([-90,0,0]) cylinder(d=14, h=10);
                    // horizontal end
                    translate([23,-15,-4]) chamferCube(5,20,10,0.5);
                }
                translate([-9,-3.5,-20]) chamferCube(18,7,40,0.5);
            }
            translate([0,-3.5,3]) rotate([-90,0,0]) cylinder(d=8, h=1);
            translate([0,2.5,3]) rotate([-90,0,0]) cylinder(d=8, h=1);
        }
        translate([0,-10,3]) rotate([-90,0,0]) cylinder(d=4.8, h=20); // Snug M5 fit so no nut required
        translate([-15.5,-10,0]) rotate([-90,0,0]) cylinder(d=3.6, h=20); // slack M3 fit
        // slack slot for other moving bolt
        translate([15.5-2.5,-6,-3]) chamferCube(5,12,7,0.5);
        // top gap
        translate([11.5,-6,5]) chamferCube(12,12,8,0.5);
        // weight saving
        translate([15.5+2.5-3,-3,-2]) chamferCube(30,6,5,0.5); // lower
        
        translate([15.5+2.5+3,-3-10,-2]) chamferCube(30,6,5.5,0.5); // side (and tube gap)
        translate([23+2.5-1.8,-3-10,0]) chamferCube(3.6,6,4,0.5); // side (and tube gap)
        // tension hole
        translate([23+2.5,0,8]) cylinder(d=3.4, h=12);
        translate([23+2.5,-10,0]) cylinder(d=3.6, h=12);
    }
}

module 605_bearing(){
    difference(){
        rotate([-90,0,0]) translate([0,0,-2.5]) chamferCylinder(5,8,8,0.5);
        rotate([-90,0,0]) translate([0,0,-2.5]) chamferCylinder(5,2.5,2.5,-0.5);
    }
}
