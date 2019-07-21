use <Chamfers-for-OpenSCAD/Chamfer.scad>;

$fs = 0.01;

rotate([0,90,0])
    blowerDuct();

module blowerDuct(){
    translate([0,0,0])
        union(){
            difference(){
                union(){
                    rotate([0,90,0]) translate([-1,0,0]) ductSegment(rsi=3, rso=15, rei=5.5, reo=8, h=16, c=0.5);
                    // under duct body
                    translate([-10,-8-14,-8.5]) chamferCube(16+3.5,8+14,5.5,0.5);   //-36
                    // mounting bracket
                    translate([-19.5,-8,-8.5]) chamferCube(29,9,10.5,0.5);
                    // locating bracket
                    translate([-19.5,-8,-8.5]) chamferCube(29,1.5,13,0.5);
                }
                translate([-10,1,-7]) rotate([0,0,-90])  chamferSegment(rsi=2, rso=2+16, rei=20, reo=25, h=3);
                translate([-17,-40,-16]) rotate([0,-10,0]) cube([17,32,20]);
                translate([-20,-28,-16]) cube([16,2,20]);
                // mounting holes
                translate([-14,-2.5,-8.5]) chamferCylinder(20,1.5,1.5,-2);
            }
            // angle duct
            translate([-5,-17,-7]) rotate([0,-20,0]) difference(){
                union(){
                    translate([-1,-5,-2.5]) chamferCube(10,14,5,0.5);
                }
                translate([-2,-4,-1.5]) chamferCube(20,12,3,0.5);
                translate([-4,-10,-10]) cube([4,20,20]);
                rotate([0,10,0]) translate([4,-10,-10]) cube([40,20,20]);

            }
            // angle diffuser
            translate([-9,-2,-8]) rotate([0,0,-45]) chamferCube(10,2,5,0.5);
        }
    }

///////////////////////// MODULES

module ductNozzle(l, ws, we, hs, he, t=1.5){
    difference(){
       linear_extrude(height=l, scale=[he/hs,we/ws])
            translate([0,-ws/2]) offset(delta=t, chamfer=true)
                square([hs,ws]);

        linear_extrude(height=l, scale=[he/hs,we/ws])
            translate([0,-ws/2]) square([hs,ws]);
    }
}

module ductSegment(rsi,rso,rei,reo,h,t=1.5, c=1){
    // the radii are about the INSIDE of the duct
    translate([0,0,-h/2]) difference(){
        translate([0,0,-t]) chamferSegment(rsi=rsi-t, rso=rso+t, rei=rei-t, reo=reo+t, h=h+(2*t), c=c);
        chamferSegment(rsi=rsi, rso=rso, rei=rei, reo=reo, h=h, c=c);
    }
}

module chamferSegment(rsi, rso, rei, reo, h, c=1){
    // radius, start/end, inner/outer
    // goes clockwise from start to end
    intersection(){
        difference(){
            scale([1,rso/reo,1]) chamferCylinder(h,reo,reo,c);
            scale([1,rsi/rei,1]) chamferCylinder(h,rei,rei,-c);
        }
        // keep only the near segment
        cube([max(rso, reo),max(rso, reo),h]);
    }
}
