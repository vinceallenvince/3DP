include <miniracer-body.scad>
include <miniracer-wheel.scad>

$fa=0.5;
$fs=0.5;

module miniracer(bodyWidth=38, bodyLength=68, bodyHeight=24, tireRadius=13, tireWidth=10, rimDepth=3, rimInset=3, axleRadius=3, axleZOffset=6, roofOffset=0.9, headLightRadius=4.5, bodyType=1, singleItem) {
    
    axleYOffset = bodyLength/2 - tireRadius*1.375;
    axleRadiusOffset=1;
    
    difference() {
        
       body();
    
        // tunnel for axles
        for(yOffset=[-1,1])
            translate([0, yOffset * axleYOffset, axleZOffset])
                rotate([0, 90, 0])
                    cylinder(r=axleRadius*axleRadiusOffset, h=bodyWidth + tireWidth, center=true);
        
        // wheel wells
        for(yOffset=[-1,1])
            for(xOffset=[-1,1])
            translate([xOffset*(bodyWidth/2), yOffset*axleYOffset, axleZOffset])
                rotate([0, 90, 0])
                    wheel(tireRadius=tireRadius + 2);
    }
    
    
}

miniracer();