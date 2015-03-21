module axle(bodyWidth=38, axleRadius=3, tireWidth=10) {
    
    axleBodyHeight = bodyWidth-tireWidth + 2;
    axleCapHeight = tireWidth - 1;
    
    // body
    cylinder(r=axleRadius, h=axleBodyHeight, center=true);
    
    // caps
    translate([0, 0, axleBodyHeight/2 + axleCapHeight/2])
        cylinder(r1=axleRadius, r2=axleRadius*0.75, h=tireWidth - 1, center=true);
    
    translate([0, 0, -axleBodyHeight/2 + -axleCapHeight/2])
        cylinder(r1=axleRadius*0.75, r2=axleRadius, h=tireWidth - 1, center=true);
    
    // cap spacer
    for(zOffset=[1, -1])
        translate([0, 0, zOffset*(axleBodyHeight/2 + axleCapHeight/2)])
            cube([axleRadius*1.9, 1, tireWidth - 1], center=true);

    // wheel stops
    for(zOffset=[1,-1])
            translate([0, 0, zOffset*(bodyWidth/2 - tireWidth/2 - 0.25)])
                rotate([90, 0, 0])
                    cube([1, 0.5, axleRadius*2.25], center=true);

    for(zOffset=[1,-1])
            translate([0, 0, zOffset*(bodyWidth/2 - tireWidth/2 - 0.25)])
                rotate([90, 0, 90])
                    cube([1, 0.5, axleRadius*2.25], center=true);
        
}
