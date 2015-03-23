module lights(depth=6, bodyWidth=38, bodyLength=68, bodyHeight=24, headLightRadius=4.5) {
    for(yOffset=[1,-1])
        for(xOffset=[1,-1])
            translate([xOffset*(bodyWidth/2-headLightRadius*2), yOffset*(bodyLength/2), bodyHeight/2+headLightRadius])
                rotate([90, 0, 0])
                    if (yOffset == 1) {
                        cylinder(r=headLightRadius, h=depth, center=true);
                    } else {
                        cylinder(r=headLightRadius/2, h=depth, center=true);
                    }
}
