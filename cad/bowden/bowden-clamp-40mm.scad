use <Chamfers-for-OpenSCAD/Chamfer.scad>;

$fs = 0.01;

difference () {
    union () {
        chamferCube(38,12,13,1);
        // cable tie lugs (upper)
        translate([-2,4,4]) chamferCube(42,7,5,1);
        // struts
        translate([-1,0,0]) chamferCube(8,40,12,1);
        translate([31,0,0]) chamferCube(8,40,12,1);
        // struts (long)
        translate([-1,0,0]) chamferCube(8,50,8,1);
        translate([31,0,0]) chamferCube(8,50,8,1);
        // fan ducting (joins)
        translate([19-(23/2)-3,10,0]) chamferCube(3,10,12,1);
        translate([19+(23/2),10,0]) chamferCube(3,10,12,1);
        // fan ducting
        translate([19-(23/2)-3,12,0]) chamferCube(3,28,17,1);
        translate([19+(23/2),12,0]) chamferCube(3,28,17,1);
        // base ducting
        translate([4,44,0]) chamferCube(30,6,2,1);
    }
    // screw holes
    translate([6,6,0]) chamferCylinder(13, 1.5, 1.5, -0.5);
    translate([38-6,6,0]) chamferCylinder(13, 1.5, 1.5, -0.5);
    // cable tie holes
    translate([-1,6,0]) cube([1.5,3,20]);
    translate([37.5,6,0]) cube([1.5,3,20]);
    
    // screw head holes (incl slight conical recess)
    translate([6,6,0]) chamferCylinder(3, 6.5/2, 2, -0.5);
    translate([38-6,6,0]) chamferCylinder(3, 6.5/2, 2, -0.5);
    translate([6,6,0]) cylinder(h=3, d=6.5);
    translate([6,6,3]) cylinder(h=1, d1=6.5, d2=3);
    translate([38-6,6,0]) cylinder(h=3, d=6.5);
    translate([38-6,6,3]) cylinder(h=1, d1=6.5, d2=3);
    
    // E3D Mount
    translate([19,0,13]) rotate([-90,0,0])union() {
        translate([0,0,9])cylinder(h=3, d=16.2);
        translate([0,0,-1]) cylinder(h=5, d=16.2);
        cylinder(h=12, d=12.2);
    }
    
    // fan mount holes
    // 2.7mm dia
    translate([19-16,14,0]) cylinder(h=20, d=2.7);
    translate([19+16,14,0]) cylinder(h=20, d=2.7);
    translate([19-16,14+32,0]) cylinder(h=20, d=2.7);
    translate([19+16,14+32,0]) cylinder(h=20, d=2.7);
    
    translate([-5,0,0]) linear_extrude(height=12) polygon([[0,0],[7,0],[0,7]]);
    translate([37+6,0,0]) linear_extrude(height=12) polygon([[0,0],[-7,0],[0,7]]);
    
    // beautification lofts
    translate([-3,12,0]) rotate([0,30,0]) translate([-8,0,0]) chamferCube(8,50,20,1);
    translate([41,12,0]) rotate([0,-30,0]) translate([0,0,0]) chamferCube(8,50,20,1);
    translate([-3,52,0]) rotate([30,0,0]) translate([-8,0,0]) chamferCube(80,50,20,1);
    //translate([31,0,0]) chamferCube(8,50,12,1);
}
