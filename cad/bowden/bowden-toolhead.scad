use <Chamfers-for-OpenSCAD/Chamfer.scad>;

$fs = 0.01;

c_dist = 30; // distance from base to centreline of hotend.

difference () {
    union () {
        // Baseplate
        intersection(){
            translate([-23,-17,0]) chamferCube(46,46,7,0.5);
            translate([-23,-17,-10]) chamferCube(46,46,27,8);
        }
        intersection(){
            translate([-15,-22,0]) chamferCube(30,10,7,0.5); // baseplate extension
            translate([-15,-22,-10]) chamferCube(30,10,27,2); // baseplate extension
        }
        // E3d Boss
        translate([-19,0,0]) chamferCube(38,12,c_dist,1);
        // E3D Boss Struts
        translate([-17,0,0]) rotate([0,15,0]) translate([-8,0,0]) chamferCube(8,12,24,1);
        translate([17,0,0]) rotate([0,-15,0]) translate([0,0,0]) chamferCube(8,12,24,1);
        // Top Fan mount
        translate([-5.5,46+11,0]) chamferCylinder(7,5,5,0);
        translate([-5.5-4,20,0]) chamferCube(8,37.5,7,0.5);
        
        // Right Fan mount
        translate([38.1,5.8+13,0]) chamferCylinder(7,5,5,0);
        translate([10,5.8+13-4,0]) chamferCube(28.5,8,7,0.5);
        
        // Fan Duct
        // - upper straight duct
        translate([-5,-7,0]) cube([10,7,15]);
        // - mid flange duct
        translate([0,-7,0]) rotate([90,0,0])
            linear_extrude(height=10, scale=[2,0.46])
                translate([-5,0,0]) square([10,15]);
        // - lower main duct
        translate([-10,-50,0]) cube([20,43,7]);
        
        // End Nozzle
        translate([0,-48,7])
            linear_extrude(height=3, scale=[1,0.5])
                translate([-10,0,0]) square([20,7]);
    }
    // screw holes
    translate([-13,6,0]) chamferCylinder(c_dist, 1.7, 1.7, -0.5);
    translate([13,6,0]) chamferCylinder(c_dist, 1.7, 1.7, -0.5);
    // Nut Slots
    translate([-13-(5.6/2),6-3.2,c_dist-5.5]) cube([5.6, 20, 2.8]);
    translate([13-(5.6/2),6-3.2,c_dist-5.5]) cube([5.6, 20, 2.8]);
    
    translate([-13-(5.6/2),6-1.7,c_dist-5.5]) cube([5.6, 3.4, 3.2]);
    translate([13-(5.6/2),6-1.7,c_dist-5.5]) cube([5.6, 3.4, 3.2]);
    
    // Top Fan mount
    translate([-5.5,46+11,0]) cylinder(d=3.4, h=10);
    translate([-5.5,46+11,0]) cylinder(d=6.5, h=4, $fn=6);
    translate([-5.5,46+11,0]) cube([3.4,5.5,8.8], center=true);
    translate([-7.5,46+11-8,0]) cube([1.5,3.5,20]); // cable tie mount
    translate([-10,35,4]) cube([20,6,5]); // blower fan cable duct
    // Right Fan mount
    translate([38.1,5.8+13,0]) cylinder(d=3.4, h=10);
    translate([38.1,5.8+13,0]) cylinder(d=6.5, h=4, $fn=6);
    translate([38.1,5.8+13,0]) cube([3.4,5.5,8.8], center=true);
    
    // Head mount screws
    translate([17/2,-3.5,0]) cylinder(d=3.4, h=10);
    translate([-17/2,-3.5,0]) cylinder(d=3.4, h=10);
    translate([17/2,-3.5,3]) rotate([0,0,90]) cylinder(d=6.5, h=6, $fn=6);
    translate([-17/2,-3.5,3]) rotate([0,0,90]) cylinder(d=6.5, h=6, $fn=6);
    translate([17/2,15.5,0]) cylinder(d=3.4, h=10);
    translate([-17/2,15.5,0]) cylinder(d=3.4, h=10);
    translate([17/2,15.5,3]) rotate([0,0,90]) cylinder(d=6.5, h=6, $fn=6);
    translate([-17/2,15.5,3]) rotate([0,0,90]) cylinder(d=6.5, h=6, $fn=6);
    
    // E3D Mount
    translate([0,0,c_dist]) rotate([-90,0,0])union() {
        translate([0,0,9])cylinder(h=3, d=16.2);
        translate([0,0,-1]) cylinder(h=5, d=16.2);
        cylinder(h=12, d=12.2);
    }
    
    // Fan Ducting (top should be 45 down, bottom should only be 12 deep (at 25 deep)
    // - top entry flange
    translate([-9,11.5,8]) cube([18,1,12]);
    // - upper flange
    translate([0,12,7+7.5+50]) rotate([90,0,0])
        linear_extrude(height=12, scale=[0.45,1.14])
            translate([-9,-56,0]) square([18,12]);
    // - upper duct
    translate([-4,-7,1]) cube([8,7.5,13]);
    // - upper flange
    translate([0,-7,1]) rotate([90,0,0])
        linear_extrude(height=10, scale=[2.2,0.38])
            translate([-4,0,0]) square([8,13]);
    // - lower main duct
    translate([-9,-41,1]) cube([8.5,28,5]);
    translate([0.5,-41,1]) cube([8.5,28,5]);
    
    // bottom duct
    translate([-9,-38.5,3]) rotate([135,0,0]) cube([18,9,3]);
    // bottom cutoff
    translate([-11,-41,0]) rotate([135,0,0]) cube([22,26,10]);
    translate([-11,-50,4]) rotate([45,0,0]) cube([22,26,10]);
    
    // End Nozzle
    translate([0,-47,7])
        linear_extrude(height=3.5, scale=[1,0.3])
            translate([-9,0,0]) square([18,4.5]);
}
