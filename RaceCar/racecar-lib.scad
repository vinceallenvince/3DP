$fa=0.5;
$fs=0.5;

module racecar(bodyWidth=38, bodyLength=68, bodyHeight=24, tireRadius=13, tireWidth=10, rimDepth=3, rimInset=3, axleRadius=3, axleZOffset=6, roofOffset=0.9, headLightRadius=4.5) {
    
axleYOffset = bodyLength/2 - tireRadius*1.375;

module wheels()
    difference() {
        difference() {
            tires();
            axles(tapered=false);
            axles(yOffset=-axleYOffset, tapered=false);
        }
        rims();
    }

module tires(radiusOffset=0, widthOffset=0)
    for(yOffset=[-1,1])
        for(xOffset=[-1,1])
            translate([xOffset*(bodyWidth/2), yOffset*axleYOffset, axleZOffset])
                rotate([0, 90, 0])
                    cylinder(r=tireRadius+radiusOffset, h=tireWidth+widthOffset, center=true);
        
module rims()
    for(yOffset=[-1,1])
        for(xOffset=[-1,1])
            translate([xOffset * ((bodyWidth/2) + tireWidth - rimDepth), yOffset * axleYOffset, axleZOffset])
                rotate([0, 90, 0])
                    cylinder(r=tireRadius - rimInset, h=tireWidth, center=true);
        
module hubCaps()
    difference() {
        for(yOffset=[-1,1])
            for(xOffset=[-1,1])
                translate([xOffset * (bodyWidth/2 + tireWidth/2 - rimDepth/2), yOffset * axleYOffset, axleZOffset])
                    rotate([0, 90, 0])
                        color([1, 1, 1])
                        if (xOffset == 1) {
                            cylinder(r2=tireRadius-rimInset, r1=(tireRadius-rimInset)*0.9, h=rimDepth-1, center=true);
                        } else {
                            cylinder(r1=tireRadius-rimInset, r2=(tireRadius-rimInset)*0.9, h=rimDepth-1, center=true);
                        }
        axles(tapered=false);
        axles(yOffset=-axleYOffset, tapered=false);
    }

module axles(length=bodyWidth - tireWidth, tapered=true, axleRadiusOffset=1) {
    if (tapered==false) {
        echo(axleRadiusOffset);
        for(yOffset=[-1,1])
            translate([0, yOffset * axleYOffset, axleZOffset])
                rotate([0, 90, 0])
                    cylinder(r=axleRadius*axleRadiusOffset, h=bodyWidth + tireWidth, center=true);
    } else {
        for(yOffset=[-1,1])
            color([1, 0, 0])
            translate([bodyWidth/2 + 0.5, yOffset * axleYOffset, axleZOffset])
                    rotate([0, 90, 0])
                        cylinder(r1=axleRadius, r2=axleRadius*0.75, h=tireWidth - 1, center=true);
        
        for(yOffset=[-1,1])
            color([1, 0, 0])
                translate([-bodyWidth/2 - 0.5, yOffset * axleYOffset, axleZOffset])
                    rotate([0, 90, 0])
                        cylinder(r1=axleRadius*0.75, r2=axleRadius, h=tireWidth - 1, center=true);
        
        for(yOffset=[-1,1])
            translate([0, yOffset * axleYOffset, axleZOffset])
                rotate([0, 90, 0])
                    cylinder(r=axleRadius, h=bodyWidth-tireWidth + 2, center=true);
       
            
    }
    
    for(xOffset=[-1,1])
        for(yOffset=[-1,1])
            translate([xOffset*(bodyWidth/2 + 0), yOffset * axleYOffset, axleZOffset])
                rotate([0, 90, 0])
                    cube([axleRadius*1.9, 1, tireWidth], center=true);
}

module body() {
    radiusOffset = 2;
    difference() {
        union() {
            hull() {
                for(yOffset=[-1,1])
                    for(xOffset=[-1,1])
                        translate([xOffset * (bodyWidth/2) - (xOffset*2), yOffset * (bodyLength/2) - (yOffset*2), 0])
                            cylinder(r=2, h=bodyHeight, center=true);
                
                resize([bodyWidth*1.1, bodyLength*1.1, 0])    
                    cylinder(r1=bodyWidth, r2=bodyWidth*0.9, h=bodyHeight, center=true);
            }
            translate([0, -bodyWidth/8, 0])
                roof();
        }
        tires(radiusOffset=radiusOffset, widthOffset=2);
        axles(radius=axleRadius*1.25, length=bodyWidth, tapered=false, axleRadiusOffset=1.25);
        axles(radius=axleRadius*1.25, length=bodyWidth, yOffset=-axleYOffset, tapered=false, axleRadiusOffset=1.25);
        lights();
        /*cubeHeight = 10;
        translate([0, 0, (bodyHeight / 2) + (cubeHeight / 2) - axleZOffset / 2])
            cube([bodyWidth/2, bodyLength * .9, cubeHeight], center=true);*/    
    }
    
    // axle guard
    /*for(yOffset=[-1,1])
        for(xOffset=[-1,1])
            translate([xOffset * (bodyWidth/2 - radiusOffset/2), yOffset * axleYOffset, axleZOffset])
                rotate([0, 90, 0])
                    %cylinder(r=2.5, h=tireWidth, center=true);*/
    
}
    
module roof()
    difference() {
        difference() {
            rotate([0, 90, 0])
                cylinder(r=bodyLength / 2.5, h=bodyWidth * roofOffset, center=true);
            translate([-bodyWidth, -bodyLength, -bodyHeight / 2])
                cube([bodyWidth * 2, bodyLength * 2, bodyHeight * 2], false);
            
        }
      translate([bodyWidth * roofOffset, 0, 0])
                rotate([0, 90, 0])
                    cylinder(r=bodyLength / 2.75, h=bodyWidth, center=true);
      
      translate([-bodyWidth * roofOffset, 0, 0])
                rotate([0, 90, 0])
                    cylinder(r=bodyLength / 2.75, h=bodyWidth, center=true);  
    }

module windows() {
    
    difference() {
        windowDepth = bodyWidth - (bodyWidth * roofOffset);
        for(xOffset=[-1,1])
        color([1, 0, 0])
        translate([xOffset * ((bodyWidth * roofOffset) / 2 - windowDepth / 2), 0, 0])
            rotate([0, 90, 0])
                cylinder(r=bodyLength / 2.75, h=windowDepth / 2, center=true);
        
        translate([-bodyWidth, -bodyLength, -bodyHeight / 2])
                cube([bodyWidth * 2, bodyLength * 2, bodyHeight * 2], false);
    }
}

module lights() {
    depth = 6;
    for(yOffset=[1,-1])
        for(xOffset=[1,-1])
            translate([xOffset * (bodyWidth/2 - headLightRadius*2), yOffset * (bodyLength/2 + depth/2), -bodyHeight/2 + headLightRadius*2])
                rotate([90, 0, 0])
                    if (yOffset == 1) {
                        cylinder(r=headLightRadius, h=depth, center=true);
                    } else {
                        cylinder(r=headLightRadius/2, h=depth, center=true);
                    }
}


    // build the parts
    union() {
        body();
        //windows();
        wheels();
        hubCaps();
        axles();
    }
}
