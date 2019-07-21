use <Chamfers-for-OpenSCAD/Chamfer.scad>;

$fs = 0.01;

// ptfe tube is 4mm OD

defaultMainBody();

module defaultMainBody(){
    mainBody(
        x=2, // Offset from centre of extruder centreline
        c_dist=7+15+2.5 // distance from base to centreline of hotend.
    );
}

module mainBody(x, c_dist, hob_dia=4){
    difference () {
        union () {
            // Baseplate
            translate([-19+x,-31,0]) chamferCube(38,46,c_dist-12,0.5); // throat (provides thinnest point for airflow)
            translate([-15,-17,0]) chamferCube(30,46,6,0.5); // main baseplate
            // E3d Boss
            translate([-19+x,0,0]) chamferCube(38,15,c_dist,1); // Boss
            // Motor
            translate([-10+x,12.5,0]) chamferCube(24,43,c_dist+hob_dia+21,1); // Upper Motor Mount

            // Tensioner Lug
            intersection(){
                translate([x-1,42,c_dist-6]) chamferCube(22,20,18,8);
                translate([x+6,50,c_dist-6]) cube([8,20,20]);
            }
            // Fan Mount
            translate([-19+x,-31,0]) chamferCube(5,33,c_dist,1);
            translate([-19+x,-31,0]) chamferCube(5,30,c_dist+15,0.5);
            // Fan Grille
            translate([19+x-5,-31+28,0]) chamferCube(5,10,c_dist,1);
            translate([19+x-5,-31+0,0]) chamferCube(5,2,c_dist+15,0.5);  // up
            translate([19+x-5,-31+9,0]) chamferCube(5,2,c_dist+15,0.5);  // up
            translate([19+x-5,-31+19,0]) chamferCube(5,2,c_dist+15,0.5);  // up
            translate([19+x-5,-31+28,0]) chamferCube(5,2,c_dist+15,0.5);  // up
            translate([19+x-5,-31,c_dist+-6]) chamferCube(5,30,2,0.5);  // cross
            translate([19+x-5,-31,c_dist+4]) chamferCube(5,30,2,0.5);  // cross
            translate([19+x-5,-31,c_dist+13]) chamferCube(5,30,2,0.5);  // cross
            // Heatsink seal
            translate([-19+x,-31,0]) chamferCube(35,2,c_dist,0.5);
            // cable tie lug (lower right)
            translate([10,7,11]) chamferCube(12,7,5,1);
            // cable tie lug (upper right)
            translate([10,46,21]) chamferCube(7,7,5,1);
            // cable tie lug (lower left)
            translate([-18,-7,1.5]) chamferCube(12,7,5,1);
            // cable tie lug (lower lower left)
            translate([-18,-27,1.5]) chamferCube(12,7,5,1);
            // cable tie lug (upper left)
            translate([-9-7,48.5,0]) chamferCube(17,7,5,1);
            // cable tie lug (upper left lower)
            translate([-9-7,19,1]) chamferCube(7,7,5,1);
            
            // add mount points for blower fan
            intersection(){
                translate([-19+x,-38,0]) chamferCube(5,8,c_dist+15-7,0.5);
                translate([-19+x,-28,c_dist+1]) rotate([45,0,0]) chamferCube(5,30,30,0.5);
            }
            // the right one just as a nub
            intersection(){
                translate([19+x-5,-38,0]) chamferCube(5,8,c_dist+15-7,0.5);
                translate([19+x-5,-28,c_dist+1]) rotate([45,0,0]) chamferCube(5,30,30,0.5);
            }
            

        }
        // screw holes
        translate([-13+x,6,0]) chamferCylinder(c_dist, 1.7, 1.7, -0.5);
        translate([13+x,6,0]) chamferCylinder(c_dist, 1.7, 1.7, -0.5);
        // Nut Slots
        translate([-13+x+3.2-20,6-2.8,c_dist-5.5]) cube([20, 5.6, 2.8]);
        translate([13+x-3.2,6-2.8,c_dist-5.5]) cube([20, 5.6, 2.8]);
        translate([-13+x-1.7,6-2.8,c_dist-5.5]) cube([3.4, 5.6, 3.2]);
        translate([13+x-1.7,6-2.8,c_dist-5.5]) cube([3.4, 5.6, 3.2]);
        // cable tie hole (lower right)
        translate([19.5,9,0]) cube([1.5,3,38]);
        translate([19.5,2,18]) cube([1.5,8,38]);
        // cable tie hole (upper right)
        translate([14.5,48,10]) cube([1.5,3,20]);
        // cable tie hole (lower left)
        translate([-17.5,-5,0]) cube([1.5,3,8]);
        // cable tie hole (lower lower left)
        translate([-17.5,-25,0]) cube([1.5,3,8]);
        // cable tie hole (upper left)
        translate([-8.5-7,48+2.5,0]) cube([1.5,3,8]);
        // cable tie hole (upper left lower)
        translate([-8.5-7,21,0]) cube([1.5,3,8]);

        // Fan Holes
        translate([-20, -15-1, c_dist]) rotate([0,90,0]) cylinder(d=25, h=36);
        translate([-20, -15-1+12, c_dist+12]) rotate([0,90,0]) cylinder(d=2.7, h=36);
        translate([-20, -15-1+12, c_dist-12]) rotate([0,90,0]) cylinder(d=2.7, h=36);
        translate([-20, -15-1-12, c_dist+12]) rotate([0,90,0]) cylinder(d=2.7, h=36);
        translate([-20, -15-1-12, c_dist-12]) rotate([0,90,0]) cylinder(d=2.7, h=36);
        
        // Carriage screw clearance
        translate([x-40,6-36-6,-20]) chamferCube(80,10,29,5); // base stress relief (bearing)
        translate([19,6+37,0]) cylinder(d=14, h=8);
        translate([19,6+37,8]) cylinder(d1=14, d2=6, h=6);
        //translate([-19,6+36,0]) cylinder(d=8, h=6);
        
        // Head mount screws
        translate([17/2,-3.5,0]) cylinder(d=3.4, h=20);
        translate([-17/2,-3.5,0]) cylinder(d=3.4, h=20);
        translate([17/2,-3.5,3]) rotate([0,0,90]) cylinder(d=6.5, h=80, $fn=6);
        translate([-17/2,-3.5,3]) rotate([0,0,90]) cylinder(d=6.5, h=80, $fn=6);
        translate([17/2,15.5,0]) cylinder(d=3.4, h=20);
        translate([-17/2,15.5,0]) cylinder(d=3.4, h=20);
        translate([17/2,15.5,3]) rotate([0,0,0]) cylinder(d=6.5, h=80, $fn=6);
        translate([-17/2,15.5,3]) rotate([0,0,0]) cylinder(d=6.5, h=80, $fn=6);
        
        // E3D Mount
        translate([x,0,c_dist]) rotate([-90,0,0])union() {
            // TWEEK HERE IF THE E3D Head has a non-standard mount
            translate([0,0,8])cylinder(h=4.5, d=16.2);
            translate([0,0,-1]) cylinder(h=4, d=16.2);
            cylinder(h=12, d=12.2);
            // heat sink hole
            translate([0,0,-40]) cylinder(h=16, d=24);
            // ptfe tube hole
            translate([0,0,9])cylinder(h=60, d=4.4);
        }
        
        // Stepper Mount
        translate([-30+x,12,5]) chamferCube(23,60,50,1); // Upper Motor Mount
        translate([-30+x+31,10,c_dist+hob_dia]) chamferCube(23,60,50,1); // Upper Motor Relief
        translate([-30+x+31-4,25,c_dist+hob_dia]) chamferCube(23,18,50,1); // Upper Motor Relief
        
        translate([x-30,12+1+21,c_dist+hob_dia]) rotate([0,90,0]) cylinder(h=26, d=23); //centre locating opening
        translate([x-30,12+1+21,c_dist+hob_dia]) rotate([0,90,0]) cylinder(h=50, d=12); //Mk8 gear hole - with a little clearance (is 9mm dia, leaving 10mm)
        // lower motor mount screws
        translate([x-30, 12+1+21-15.5, c_dist+hob_dia-15.5]) rotate([0,90,0]) cylinder(h=60, d=3.4); //mounting hole
        translate([x+11, 12+1+21-15.5, c_dist+hob_dia-15.5]) rotate([0,90,0]) cylinder(h=60, d=8); //mounting hole (relief) (use 20mm M3)
        translate([x-30, 12+1+21-15.5, c_dist+hob_dia+15.5]) rotate([0,90,0]) cylinder(h=60, d=3.4); //mounting hole
        //translate([x+1, 12+1+21-15.5, c_dist+5.15+15.5]) rotate([0,90,0]) cylinder(h=60, d=8); //mounting hole (relief)
        // upper motor mount screws
        translate([x-30, 12+1+21+15.5, c_dist+hob_dia-15.5]) rotate([0,90,0]) cylinder(h=60, d=3.4); //mounting hole
        translate([x+11, 12+1+21+15.5, c_dist+hob_dia-15.5]) rotate([0,90,0]) cylinder(h=60, d=8); //mounting hole (relief)
        translate([x-30, 12+1+21+15.5, c_dist+hob_dia+15.5]) rotate([0,90,0]) cylinder(h=60, d=3.4); //mounting hole
        //translate([x+1, 12+1+21+15.5, c_dist+5.15+15.5]) rotate([0,90,0]) cylinder(h=60, d=8); //mounting hole (relief)
        // bearing hole
        translate([x-30,12+1+21,c_dist-8]) rotate([0,90,0]) cylinder(h=60, d=18); //bearing hole
        translate([-30+x+33,10,c_dist+5.15]) chamferCube(23,50,50,1); // bearing arm mount
        // Bearing Arm Cavity
        translate([x-5.5,13,5]) chamferCube(11,50,15,0.5); // main cavity
        translate([x-5.5,20,2]) chamferCube(11,50,17,0.5); // end cavity
        translate([x-3.5,34-9,-2]) chamferCube(7,18,17,0.5); // bearing insert cavity
        translate([x-40,34-6,2]) chamferCube(80,12,17,0.5); // base stress relief (bearing)
        // Tensioner
        translate([x+10,34+25,10]) cylinder(h=60, d=3.6); // tensioner 2 bolt hole
        
        // Cable passthrough hole
        translate([x-30,4,8]) rotate([0,90,0]) cylinder(h=60, d=8);
        translate([x-40,2,-2]) chamferCube(80,4,7,0.5); // base stress relief (pass through)
        
        // weight save and stress relief under throat
        translate([x-40,-20,1]) chamferCube(38,12,c_dist-15,0.5); // L
        translate([x-13,-40,1]) chamferCube(11,30,c_dist-16,0.5); // L
        translate([x+2,-20,1]) chamferCube(38,12,c_dist-15,0.5); // R
        translate([x+2,-40,1]) chamferCube(11,30,c_dist-16,0.5); // L
        
        // weight saver in motor mount 
        translate([x+5,34-10,16]) chamferCube(17,20,17,0.5); // bearing insert cavity
    }
}
