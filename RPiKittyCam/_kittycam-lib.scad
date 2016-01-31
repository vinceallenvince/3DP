$fa=0.5;
$fs=0.5;


// 38mm spacers

module corner(radius=4, height=3) {
    cylinder(r=radius, h=height, center=true);
}

module baseCorners(width=32.5, height=32.5, padding=0, z=0) {
    for (x=[width+padding, -width-padding]) { 
        for (y=[height+padding, -height-padding]) { 
            translate([x, y, z])
            corner(radius=2.75, height=10);
        }
    }
}

module spacer(radius=2.75, thickness=1.25, height=38) {
    difference() {
        cylinder(r=radius+thickness, height, center=true);
        cylinder(r=radius, 110, center=true);
    }
}

module kittycam (render_spacer=false,
                    spacer_height=38,
                    render_bottom_plate=true,
                    render_middle_plate=true,
                    render_top_plate=true) {
                        
    if (render_spacer) {
        spacer(height=spacer_height);
    } else {
        
        difference() {
        
            // RPi footprint = 100mm = 3.93 inches
            RPiSize = 100;
            wallThickness = 3;
            hullCornerRadius = 4;
            size = (RPiSize / 2) - hullCornerRadius; // subtract the hull corner radius
            hull() {
                for (x=[size, -size]) { 
                    for (y=[size, -size]) { 
                        translate([x, y, 0])
                            cylinder(r=4, h=wallThickness, center=true);
                    }
                }
            }
        
            if (render_bottom_plate) {
                
                // RPi mounting holes
                translate([-12, 0, 0]) 
                    for (x=[29.25, -29.25]) 
                        for (y=[24.75, -24.75])
                            translate([x, y, 0]) 
                                cylinder(r=1.825, h=10, center=true);
            }
            
            if (render_middle_plate) {
                    
                // lidar
                translate([0, 20, 0])   // was 20, 20, 0
                    for (x=[15, -15])
                        for (y=[10 + 4, -10 - 4])
                            translate([x, y, 0])
                                cylinder(r=2, h=10, center=true);
                // lidar slot        
                translate([0, 44, 0])     
                     cube([20, 2, 20], center=true);   
                        
                // protoboard 45.5mm x 25.4mm
                translate([0, -20, 0])
                    for (x=[22.75, -22.75])
                        for (y=[12.7, -12.7])
                            translate([x, y, 0])
                                cylinder(r=1.75, h=10, center=true);
                
                // camera slot        
                cube([20, 2, 20], center=true);
            }
            
            
            if (render_top_plate) {
                
                // camera mounts
                translate([0, -6, 0]) // was -30, 18, 0
                    for (x=[10.5, -10.5]) 
                        for (y=[6, -6])
                            translate([x, y, 0])
                                cylinder(r=1.5, h=10, center=true);
          
                // camera lens
                color([1, 0, 0])
                    translate([0, 0, 0])
                        cube(9, true);
        
                // lidar hole
                translate([0, 20, 0])   // was 20, 20, 0
                        cube([24, 14, 12], center=true);
                
                translate([0, 20, 0]) 
                    for (x=[15, -13])    
                        translate([x, 0, 0])
                            cylinder(r=11, h=10, center=true);   
   
   
                // LEDs
                translate([10.5, -42, 0])
                    cylinder(r=1.75, h=10, center=true);
        
                translate([-10.5, -42, 0])
                    cylinder(r=1.75, h=10, center=true);
        
            }
         
            // corners
            cornerRadius = 2.85; // M5 hex nut has a 5mm wide bolt
            c = RPiSize / 2 - cornerRadius * 2;
            for (x=[c, -c])
                for (y=[c, -c])
                    translate([x, y, 0])
                        cylinder(r=cornerRadius, h=10, center=true);
                
                
            translate([60, 0, 0])
                cube([50, 100, 10], center=true);
                
            translate([-60, 0, 0])
                cube([50, 100, 10], center=true);
                
            translate([0, 60, 0])
                cube([100, 50, 10], center=true);
                
            translate([0, -25, 0])
                cube([100, 60, 10], center=true);
                
        }
    }
}

kittycam(render_spacer=false,
            spacer_height=38,
            render_bottom_plate=false,
            render_middle_plate=false,
            render_top_plate=true);


    
    
    
