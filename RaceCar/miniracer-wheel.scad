module wheel(tireRadius=13, tireWidth=10, rimDepth=3, rimInset=3) {
    
    module tires(radiusOffset=0, widthOffset=0) {
        cylinder(r=tireRadius+radiusOffset, h=tireWidth+widthOffset, center=true);
    }
            
    module rim() {
        translate([0, 0, tireWidth - rimInset])
        cylinder(r=tireRadius - rimInset, h=tireWidth, center=true);
    }
    
    difference() {
        tires();
        rim();
    }
}