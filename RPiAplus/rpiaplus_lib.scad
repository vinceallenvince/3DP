$fa=0.5;
$fs=0.5;

RPiFootprintHeight = 3;
standoffHeight = 6;

// create an array holding 4 locations for mounting holes // 3, 62, 3, 53
footprintPadding = 12;

module corner(height=RPiFootprintHeight) {
    color("cyan")
    cylinder(r=3, h=height, center=true);
}

module RPiMountingHole(h=20) {
    //cylinder(r=3.1, h=19, center=true); // pads
    cylinder(r=1.825, h=h, center=true);
}

module baseMountingHole(h=20) {
    cylinder(r=3, h=h, center=true);
}

module standoff() {
    color("cyan")
    difference() {
        cylinder(r=2.75, h=standoffHeight, center=true);
        cylinder(r=1.825, h=standoffHeight*1.1, center=true);
    }
}

// base
// need base mounting holes
/*difference() {
    
    hull() {
        for (x=[3 - footprintPadding, 62 + footprintPadding]) { 
            for (y=[3 - footprintPadding, 53 + footprintPadding]) { 
                translate([x, y, 0])
                    corner();
            }
        }
    }
    
    // holes
    for (x=[3.5, 61.5]) { 
        for (y=[3.5, 52.5]) { 
            translate([x, y, 0])
                RPiMountingHole();
        }
    }
    
    // corners
    for (x=[6 - footprintPadding, 59 + footprintPadding]) { 
        for (y=[6 - footprintPadding, 50 + footprintPadding]) { 
            translate([x, y, 0])
            corner(height=10);
        }
    }
}*/



// standoffs
/*for (x=[3.5, 61.5]) { 
    for (y=[3.5, 52.5]) { 
        translate([x, y, standoffHeight/2 + RPiFootprintHeight/2])
            standoff();
    }
}*/

// RPi footprint
difference() {
    color("red")
    hull() {
        for (x=[3, 62]) { 
            for (y=[3, 53]) { 
                translate([x, y, standoffHeight + RPiFootprintHeight])
                    corner();
            }
        }
    }

    // holes
    for (x=[3.5, 61.5]) { 
        for (y=[3.5, 52.5]) { 
            translate([x, y, 0])
                RPiMountingHole(40);
        }
    }
}
    
