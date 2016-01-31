$fa=0.5;
$fs=0.5;

// RPi Dimensions: 65mm x 56mm

module corner(radius=4, height=3) {
    cylinder(r=radius, h=height, center=true);
}

module RPiMountingHole(h=20) {
    cylinder(r=1.825, h=h, center=true);
}

module baseMountingHole(h=20) {
    cylinder(r=3, h=h, center=true);
}

module baseCorners(padding=0, z=0) {
    for (x=[32.5+padding, -32.5-padding]) { 
        for (y=[32.5+padding, -32.5-padding]) { 
            translate([x, y, z])
            corner(radius=2.75, height=10);
        }
    }
}

module standoff(standoffHeight=4) {
    difference() {
        cylinder(r=2.75, h=standoffHeight, center=true);
        cylinder(r=1.825, h=standoffHeight*1.1, center=true);
    }
}

module spacer(radius=2.75, thickness=1.25, height=30) {
    difference() {
        cylinder(r=radius+thickness, height, center=true);
        cylinder(r=radius, 110, center=true);
    }
}



module enclosure(wallThickness=3,
                RPiOffsetX=-12,
                RPiOffsetY=0,
                edgePadding=12,
                printRPi=false,
                standoffHeight=4,
                spcRPiH=26,
                spcSpeakerH=18,
                spcGrillH=6,
                printGrill=false,
                totalRings=16,
                maxGrillHoleRadius=2.25) {
    
    // Base
    /*translate([0, 0, wallThickness/2])
        difference() {
            
            hull() {
                for (x=[32.5+edgePadding, -32.5-edgePadding]) { 
                    for (y=[32.5+edgePadding, -32.5-edgePadding]) { 
                        translate([x, y, 0])
                            corner(height=wallThickness);
                    }
                }
            }
            
            // holes; -3.5 from RPI edge
            translate([RPiOffsetX, RPiOffsetY, 0])
                for (x=[29.25, -29.25]) { 
                    for (y=[24.75, -24.75]) { 
                        translate([x, y, 0])
                            RPiMountingHole();
                    }
                }
            
            baseCorners(padding=edgePadding, z=0);
        };*/
        
    // Standoffs
    /*translate([RPiOffsetX, RPiOffsetY, 0])
        for (x=[29.25, -29.25]) { 
                for (y=[24.75, -24.75]) {  
                translate([x, y, standoffHeight/2 + wallThickness])
                    standoff(standoffHeight=4);
            }
        };*/

    
    // spacers; base -> speaker bottom mount
    /*for (x=[32.5+edgePadding, -32.5-edgePadding]) { 
        for (y=[32.5+edgePadding, -32.5-edgePadding]) { 
            translate([x, y, spcRPiH/2 + wallThickness])
            spacer(height=spcRPiH);
        }
    }*/
    
    difference() {
    
    // top plate
    difference() {
        
        mountZ = spcRPiH + wallThickness * 1.5;
        
        hull() {
            for (x=[32.5+edgePadding, -32.5-edgePadding]) { 
                for (y=[32.5+edgePadding, -32.5-edgePadding]) { 
                    translate([x, y, mountZ])
                        corner(height=wallThickness);
                }
            }
        }
        
        baseCorners(padding=edgePadding, z=mountZ);
        
        // camera mounts
        translate([-20, -28, 0]) {
            for (x=[10.5, -10.5]) { 
                for (y=[6, -6]) {
                    translate([x, y, mountZ])
                        cylinder(r=1.5, h=10, center=true);
                }
            }
        
            color([1, 0, 0])
                translate([0, -6, mountZ])
                    cube(9, true);
        }
        
        // motion detector mounts
        translate([20, 0, 0]) {
            for (x=[14.5, -14.5]) { 
                translate([x, -28, mountZ])
                    cylinder(r=1.5, h=10, center=true);
            }
        
            color([1, 0, 0])
                translate([0, -28, mountZ])
                    cube(24, true);
        }
        
        // lidar mounts
        for (x=[15, -15]) { 
                for (y=[10 + 4, -10 - 4]) { 
                    translate([x, y, 0])
                        cylinder(r=2, h=10, center=true);
                }
         }
         
        // proto board mounts
        for (x=[36.85, -36.85]) { 
            translate([x, 14, mountZ])
                cylinder(r=1.5, h=10, center=true);
        }
        
        // proto board (hide)
        /*translate([0, 14, mountZ])
                cube([81, 51, 100], center=true);*/
        
    }
    
    /*translate([70, 0, 0])
        cube(100, true);
    
    translate([-70, 0, 0])
        cube(100, true);
    
    translate([0, 70, 0])
        cube(100, true);*/
    }
}

enclosure(printGrill=false, totalRings= 16);

//spacer(height=41);

// screws
/*screwHeight = spcRPiH + (wallThickness * 4) + spcSpeakerH;
echo("outer screw height: ");
echo(screwHeight);
color("red")
translate([0, 0, screwHeight/2])
    cylinder(r=3, h=screwHeight, center=true);*/


