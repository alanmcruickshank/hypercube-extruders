use <Chamfers-for-OpenSCAD/Chamfer.scad>;

$fs = 0.01;

defaultExtruderClamp();

module defaultExtruderClamp(){
    extruderClamp(fx=19, fy=6);
}

module extruderClamp(fx, fy){
    difference () {
        union () {
            chamferCube(38,12,15,1);
            // fan mount face
            translate([fx-21.8,0,0]) chamferCube(21.8*2,12,7,0.5);
            // lower fan mount bar
            translate([0,12+31+0.5,0]) chamferCube(21.8+14+5.25,6.75,7,0.5);

            // throat plate (0.25mm clearance either side) - same depth as rest of front
            // thinner and thicker sections to provide clearance for side screws
            translate([5.25,0,0]) chamferCube(27.5,12+31+5,1,0.5);
            translate([5.25+8,0,0]) chamferCube(7.5+4,12+31+5,3,1);
            
            // Bottom Fan mount
            translate([fx+21.8,fy+38.2,0]) chamferCylinder(7,6,6,0.5);
            // Top Fan mount
            translate([fx-21.8,fy,0]) chamferCylinder(7,6,6,0.5);
            translate([fx+21.8,fy,0]) chamferCylinder(7,6,6,0.5); // FAKE
        }
        // screw holes
        translate([6,6,0]) chamferCylinder(15, 1.7, 1.7, -0.5);
        translate([38-6,6,0]) chamferCylinder(15, 1.7, 1.7, -0.5);
        
        // Bottom Fan mount
        translate([fx+21.8,fy+38.2,0]) chamferCylinder(7,1.7, 1.7,-0.5);
        translate([fx+21.8,fy+38.2,3]) rotate([0,0,0]) cylinder(d=6.5, h=30, $fn=6);
        translate([5+28,20,0]) cube([5,23.5,10]); // cutout for lower mounts
        translate([0,20,0]) cube([5,23.5,10]); // cutout for lower mounts
        // Top Fan mount
        translate([fx-21.8,fy,0]) chamferCylinder(7,1.7, 1.7,-0.5);
        translate([fx-21.8,fy,3]) rotate([0,0,90]) cylinder(d=6.5, h=30, $fn=6);
        
        // screw head holes (incl slight conical recess)
        translate([6,6,0]) chamferCylinder(3, 6.5/2, 2, -0.5);
        translate([38-6,6,0]) chamferCylinder(3, 6.5/2, 2, -0.5);
        translate([6,6,0]) cylinder(h=3, d=6.5);
        translate([6,6,3]) cylinder(h=1, d1=6.5, d2=3);
        translate([38-6,6,0]) cylinder(h=3, d=6.5);
        translate([38-6,6,3]) cylinder(h=1, d1=6.5, d2=3);
        
        // Duct mount screws
        translate([16,40,3.5]) rotate([-90,0,0]) cylinder(h=20, d=2.7); //(16 across from end)
        translate([22,40,3.5]) rotate([-90,0,0]) cylinder(h=20, d=2.7); //(16 across from end)
        
        // E3D Mount
        translate([19,0,15]) rotate([-90,0,0])union() {
            translate([0,0,9])cylinder(h=3, d=16.2);
            translate([0,0,-1]) cylinder(h=5, d=16.2);
            cylinder(h=12, d=12.2);
        }
    }
}
