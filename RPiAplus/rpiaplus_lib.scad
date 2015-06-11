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

module grillInsert(r=10, a=10, h=30, maxGrillHoleRadius, ringStep, totalRings) {
    translate([r * cos(a), r * sin(a), 0])
        cylinder(r=maxGrillHoleRadius * (1 - ringStep/totalRings), h=h, center=true);
        // !! should use a min here
}


module grillPattern(totalRings=16, stepFactor=90, h=10, spread=3.0, maxGrillHoleRadius=2.25) {
    for (ringStep = [1 : totalRings]) {
        for (i = [0 : stepFactor/ringStep : 360]) {
            grillInsert(r=spread*ringStep,
                        a=i, 
                        h=h,
                        maxGrillHoleRadius=maxGrillHoleRadius,
                        ringStep=ringStep,
                        totalRings=totalRings);
        }
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
    translate([0, 0, wallThickness/2])
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
        };
        
    // Standoffs
    translate([RPiOffsetX, RPiOffsetY, 0])
        for (x=[29.25, -29.25]) { 
                for (y=[24.75, -24.75]) {  
                translate([x, y, standoffHeight/2 + wallThickness])
                    standoff(standoffHeight=4);
            }
        };

    // RPi board
    if (printRPi==true) {
        difference() {
            translate([RPiOffsetX, RPiOffsetY, 0])
            hull() {
                for (x=[31, -31]) { 
                    for (y=[26.5, -26.5]) { 
                        translate([x, y, standoffHeight + wallThickness * 1.5])
                            corner(radius=3, height=wallThickness);
                    }
                }
            }
        
            // holes; -3.5 from RPI edge
            translate([RPiOffsetX, RPiOffsetY, 0])
                for (x=[29.25, -29.25]) { 
                    for (y=[24.75, -24.75]) { 
                        translate([x, y, 0])
                            RPiMountingHole(40);
                    }
                }
        }
    }
    
    // spacers; base -> speaker bottom mount
    for (x=[32.5+edgePadding, -32.5-edgePadding]) { 
        for (y=[32.5+edgePadding, -32.5-edgePadding]) { 
            translate([x, y, spcRPiH/2 + wallThickness])
            spacer(height=spcRPiH);
        }
    }
    
    // speaker bottom mount
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
        
        translate([0, 0, mountZ])
            cylinder(r1=22, r2=25, h=10, center=true);
    }
    
    // spacers; speaker bottom mount -> speaker top mount
    for (x=[32.5+edgePadding, -32.5-edgePadding]) { 
        for (y=[32.5+edgePadding, -32.5-edgePadding]) { 
            translate([x, y, spcRPiH + (wallThickness * 2) + spcSpeakerH/2])
            spacer(height=spcSpeakerH);
        }
    }
    
    // speaker top mount
    difference() {
        
        mountZ = spcRPiH + (wallThickness * 2.5) + spcSpeakerH;
        
        hull() {
            for (x=[32.5+edgePadding, -32.5-edgePadding]) { 
                for (y=[32.5+edgePadding, -32.5-edgePadding]) { 
                    translate([x, y, mountZ])
                        corner(height=wallThickness);
                }
            }
        }
     
        baseCorners(padding=edgePadding, z=mountZ);
        
        translate([0, 0, mountZ])
            cylinder(r1=26, r2=23, h=10, center=true);
    }
    
    // spacers; speaker top mount -> grill
    if (printGrill == true) {
        for (x=[32.5+edgePadding, -32.5-edgePadding]) { 
            for (y=[32.5+edgePadding, -32.5-edgePadding]) { 
                translate([x, y, spcRPiH + (wallThickness * 3) + spcSpeakerH + spcGrillH/2])
                spacer(height=spcGrillH);
            }
        }
        
        // Grill
        difference() {
            
            mountZ = spcRPiH + (wallThickness * 3.5) + spcSpeakerH + spcGrillH;
            
            hull() {
                for (x=[32.5+edgePadding, -32.5-edgePadding]) { 
                    for (y=[32.5+edgePadding, -32.5-edgePadding]) { 
                        translate([x, y, mountZ])
                            corner(height=wallThickness);
                    }
                }
            }
         
            baseCorners(padding=edgePadding, z=mountZ);
            
            translate([0, 0, mountZ])
                grillPattern(totalRings=totalRings, stepFactor=120, maxGrillHoleRadius=maxGrillHoleRadius);
        }
    }
}



// screws
/*screwHeight = spcRPiH + (wallThickness * 4) + spcSpeakerH;
echo("outer screw height: ");
echo(screwHeight);
color("red")
translate([0, 0, screwHeight/2])
    cylinder(r=3, h=screwHeight, center=true);*/


