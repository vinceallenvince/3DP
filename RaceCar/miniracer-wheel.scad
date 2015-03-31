module wheel(tireRadius=13, tireWidth=10, rimDepth=3, rimInset=3, axleRadius=3) {
    
    treadWidth = 1;
    
    module tires() {
        cylinder(r=tireRadius, h=tireWidth);
    }
            
    module rim() {
        translate([0, 0, tireWidth - rimDepth])
        cylinder(r=tireRadius - rimInset, h=tireWidth);
    }
    
    module treadCanals() {
        for (offsetZ=[0.25, 0.75]) {
            translate([0, 0, tireWidth*offsetZ])
                difference() {
                    cylinder(r=tireRadius*2, h=treadWidth, center=true);
                    translate([0, 0, -1])
                        cylinder(r=tireRadius-1, h=3, center=true);
                }
        }
    }
    
    difference() {
        difference() {
            difference() {
                tires();
                rim();
            }
    
            // tunnel for axles
            cylinder(r=axleRadius, h=tireWidth*4, center=true);
        }
        
        // TODO: finish tire tread
        //tread
        //treadCanals();
        
        //#treadTeethLarge(rot=45);
        //#treadTeethLarge(rot=-45);
        
        /*for (rotateZ=[10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340, 350, 360])
            rotate([0, 0, rotateZ])
                translate([0, tireRadius, tireWidth*0.125 - treadWidth*0.25])
                    treadTeethSmall(rot=45);
        
        for (rotateZ=[10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340, 350, 360])
            rotate([0, 0, rotateZ])
                translate([0, tireRadius, tireWidth*0.875 - treadWidth*0.25])
                    treadTeethSmall(rot=-45);*/
        
    
    }
    
    module treadTeethSmall(rot=45) {
        rotate([0, rot, 0])
            cube([0.5, 1, 1], center=true);
    }
    
    module treadTeethLarge(rot=45) {
        translate([0, tireRadius, tireWidth*0.5])
        rotate([0, rot, 0])
            cube([0.5, 1, 3], center=true);
    }
    
    
    
}

wheel();