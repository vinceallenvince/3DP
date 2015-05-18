$fa=0.5;
$fs=0.5;

module grillInsert(r=10, a=10, h=30, cylinderRadius=10) {
    translate([r * cos(a), r * sin(a), 0])
        cylinder(r=cylinderRadius, h=h, center=true);
}


module grillPattern(rings=12, stepFactor=120) {
    for (step = [1 : rings]) {
        for (i = [0 : stepFactor/step : 360]) {
            grillInsert(r = 30 * step, a = i, h=10);
        }
    }
}

grillPattern(stepFactor=120);
   