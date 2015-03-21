module roof(bodyWidth=38, bodyLength=68, bodyHeight=24, roofOffset=0.9) {
    
    difference() {
        intersection() {
            translate([-bodyWidth*roofOffset/2, 0, -bodyHeight/2])
                rotate([0, 90, 0])
                    cylinder(r=bodyLength/2.5, h=bodyWidth*roofOffset, center=false);
            translate([-bodyWidth, -bodyLength, 0])
                cube([bodyWidth*2, bodyLength*2, bodyHeight*2], false);
        }
      
        translate([bodyWidth * roofOffset, 0, -bodyHeight/2])
            rotate([0, 90, 0])
                cylinder(r=bodyLength / 2.75, h=bodyWidth, center=true);
      
        translate([-bodyWidth * roofOffset, 0, -bodyHeight/2])
            rotate([0, 90, 0])
                cylinder(r=bodyLength / 2.75, h=bodyWidth, center=true);        
    }
}