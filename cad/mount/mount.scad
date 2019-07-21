use <Chamfers-for-OpenSCAD/Chamfer.scad>;

$fa = 6;
$fs = 0.4;

a = 26;
b = 30;

rotate([120,0,0]) difference() {
    union() {
        // 6mm thick, 3.5 deep of thread
        // vertical (base)
        chamferCube(b, 6, 15, 1);
        // vertical slant
        translate([0,0,14.5]) rotate([-30,0,0]) translate([0,0,-12]) difference(){
            chamferCube(b, 6, 32, 1);
            // Mounting Holes
            translate([b/2 + 17/2,0,a]) rotate([-90,0,0]) cylinder(d=3.4, h=10);
            translate([b/2 - 17/2,0,a]) rotate([-90,0,0]) cylinder(d=3.4, h=10);
            translate([b/2 + 17/2,0,a]) rotate([-90,0,0]) cylinder(d=6.5, h=3, $fn=6);
            translate([b/2 - 17/2,0,a]) rotate([-90,0,0]) cylinder(d=6.5, h=3, $fn=6);
            translate([b/2 + 17/2,5,a]) rotate([-90,0,0]) cylinder(d=6, h=30);
            translate([b/2 - 17/2,5,a]) rotate([-90,0,0]) cylinder(d=6, h=30);
        }
        //horizontal
        translate([0,0,10]) chamferCube(b, 20+6, 5, 1);
    }
    // Frame holes
    translate([b/2,16,8]) cylinder(d=5.4, h=10);
    translate([b/2,16,13]) cylinder(d=10, h=50);

    //Weight Saving Hole
    translate([b/2 ,-1,38]) rotate([-90,0,0]) chamferCylinder(18, 10, 10, -2);
    translate([b/2 ,-10,-3]) rotate([-90,0,0]) chamferCylinder(18, 10, 10, -2);
}
