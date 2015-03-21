include <miniracer-roof.scad>

module body(bodyType=2, bodyWidth=38, bodyLength=68, bodyHeight=24, roofOffset=0.9) {
    
    module main() {
        hull() {
            for(yOffset=[-1,1])
                for(xOffset=[-1,1])
                    translate([(xOffset*bodyWidth/2) - xOffset*2, (yOffset*bodyLength/2) - yOffset*2, 0])
                        cylinder(r=2, h=bodyHeight, center=false);
        
            resize([bodyWidth*1.1, bodyLength*1.1, 0]) {
                if (bodyType==1) {
                    cylinder(r1=bodyWidth*0.9, r2=bodyWidth, h=bodyHeight, center=false);
                } else if (bodyType==2) {
                    cylinder(r1=bodyWidth, r2=bodyWidth*0.9, h=bodyHeight, center=false);
                } // if bodyType==3 squared body; no inner cylinder
            }
        }
    }

    union() {
        main();
        translate([0, -bodyWidth/8, bodyHeight])
            roof();
        
    }
    
}
