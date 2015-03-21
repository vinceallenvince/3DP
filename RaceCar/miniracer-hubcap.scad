module hubCap(tireRadius=13, rimDepth=3, rimInset=3) {
    union() {
        cylinder(r=tireRadius-rimInset, h=1, center=false);
        translate([0, 0, 1])
            cylinder(r1=tireRadius-rimInset, r2=(tireRadius-rimInset)*0.9, h=rimDepth-2, center=false);
    }
}
