module wheel(tireRadius=13, tireWidth=10, rimDepth=3, rimInset=3, axleRadius=3) {
    
    module tires() {
        cylinder(r=tireRadius, h=tireWidth);
    }
            
    module rim() {
        translate([0, 0, tireWidth - rimDepth])
        cylinder(r=tireRadius - rimInset, h=tireWidth);
    }
    
    difference() {
        difference() {
            tires();
            rim();
        }
    
        // tunnel for axles
        cylinder(r=axleRadius, h=tireWidth*4, center=true);
    }
}