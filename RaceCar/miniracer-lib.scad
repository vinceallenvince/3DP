include <miniracer-body.scad>
include <miniracer-axle.scad>
include <miniracer-wheel.scad>
include <miniracer-hubcap.scad>

$fa=0.5;
$fs=0.5;

module miniracer(bodyWidth=38, bodyLength=68, bodyHeight=24, tireRadius=13, tireWidth=10, rimDepth=3, rimInset=3, axleRadius=3, axleZOffset=6, roofOffset=0.9, headLightRadius=4.5, bodyType=1, singleItem) {
    
    axleYOffset = bodyLength/2 - tireRadius*1.375;
    axleRadiusOffset=1.25;
    tireWidthOffset = tireWidth+4;
    difference() {
        
       body(bodyType=bodyType);
    
        // tunnel for axles
        for(yOffset=[-1,1])
            translate([0, yOffset * axleYOffset, axleZOffset])
                rotate([0, 90, 0])
                    cylinder(r=axleRadius*axleRadiusOffset, h=bodyWidth + tireWidth*2, center=true);
        
        // wheel wells
        for(yOffset=[-1,1])
            for(xOffset=[-1,1])
                translate([xOffset*(bodyWidth/2-tireWidthOffset/2), yOffset*axleYOffset, axleZOffset])
                    rotate([0, xOffset*90, 0])
                        wheel(tireRadius=tireRadius+2, tireWidth=tireWidthOffset);
    }
    
    // wheel well guard
    for(yOffset=[-1,1])
        for(xOffset=[-1,1])
            translate([xOffset*(bodyWidth/2-tireWidthOffset/2), yOffset*axleYOffset, axleZOffset])
                    rotate([0, xOffset*90, 0])
                    difference() {
                        cylinder(r=axleRadius*1.5, h=1, center=false);
                        cylinder(r=axleRadius*1.25, h=8, center=true);
                    }
                    
    // axles
    for(yOffset=[-1,1])
        translate([0, yOffset * axleYOffset, axleZOffset])
            rotate([0, 90, 0])
                axle();
   
    // wheels
    for(yOffset=[-1,1])
        for(xOffset=[-1,1])
            translate([xOffset*(bodyWidth/2-tireWidth/2), yOffset*axleYOffset, axleZOffset])
                rotate([0, xOffset*90, 0])
                    wheel(tireRadius=tireRadius, tireWidth=tireWidth, axleRadius=axleRadius);
    
    // hubcaps
    for(yOffset=[-1,1])
        for(xOffset=[-1,1])
            translate([xOffset*(bodyWidth/2-tireWidth/2+tireWidth-(rimDepth-2)), yOffset*axleYOffset, axleZOffset])
                rotate([0, xOffset*-90, 0])
                    hubcap();
    
}