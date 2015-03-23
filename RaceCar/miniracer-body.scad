include <miniracer-roof.scad>
include <miniracer-lights.scad>

module body(bodyType=1, bodyWidth=38, bodyLength=68, bodyHeight=24, roofOffset=0.9, headLightRadius=4.5) {
    
    module main() {
        hull() {
            for(yOffset=[-1,1])
                for(xOffset=[-1,1])
                    translate([(xOffset*bodyWidth/2) - xOffset*2, (yOffset*bodyLength/2) - yOffset*2, 0])
                        cylinder(r=2, h=bodyHeight);
        
            resize([bodyWidth*1.1, bodyLength*1.1, 0]) {
                if (bodyType==1) {
                    cylinder(r1=bodyWidth, r2=bodyWidth*0.9, h=bodyHeight);
                } else if (bodyType==2) {
                    cylinder(r1=bodyWidth*0.9, r2=bodyWidth, h=bodyHeight);
                } // if bodyType==3 squared body; no inner cylinder
            }
        }
    }
    
    difference() {
        union() {
            main();
            translate([0, -bodyWidth/8, bodyHeight])
                roof();
        
        }
        lights(depth=4, bodyWidth=bodyWidth, bodyLength=bodyLength, bodyHeight=bodyHeight, headLightRadius=headLightRadius);
    }
    
}
