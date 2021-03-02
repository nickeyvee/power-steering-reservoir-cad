reservoir_height = 94.5;
reservoir_diameter = 83.6;
reservoir_diameter_bottom = 79.0;

small_fitting_radius = 5.65;
small_fitting_length = 65;
small_fitting_offset_x = reservoir_height - 46.3;
small_fitting_offset_z = 40;

large_fitting_radius = 8.15;
large_fitting_length = 75;
large_fitting_offset_x = 10;
large_fitting_offset_z = 14;

container_thickness = 2.6;

difference () {        
    union () {
        rotate([90, 0, 0])
            translate([reservoir_diameter - large_fitting_offset_x, large_fitting_offset_z, -25])
                cylinder(r=large_fitting_radius, h=large_fitting_length);
        
        rotate([90, 0, 0])
            translate([reservoir_diameter - large_fitting_offset_x, large_fitting_offset_z, 40])
                cylinder(r2=large_fitting_radius, r1=large_fitting_radius+1, h=10);
     
        rotate([90, 0, 0])
            translate([reservoir_diameter-30, small_fitting_offset_z, -30])
                cylinder(r=small_fitting_radius, h=small_fitting_length);
        
        rotate([90, 0, 0])
            translate([reservoir_diameter-30, small_fitting_offset_z, -30])
                cylinder(r=small_fitting_radius+4, h=25);
        
        rotate([90, 0, 0])
            translate([reservoir_diameter-30, small_fitting_offset_z, small_fitting_length -35])
                cylinder(r2=small_fitting_radius, r1=small_fitting_radius+1, h=10);

              
        minkowski () {
            hull() {
              translate([reservoir_diameter, reservoir_diameter/2, 25])
                  cylinder(d=15, h=container_thickness);

              translate([reservoir_diameter, reservoir_diameter/2, reservoir_height])
                  cylinder(d=reservoir_diameter, h=container_thickness);

              translate([reservoir_diameter, reservoir_diameter/2, 0])
                  cylinder(d=reservoir_diameter_bottom, h=container_thickness);
            }
            sphere(r=2);
       }
    }
    
    translate([reservoir_diameter, reservoir_diameter/2, container_thickness])
        cylinder(d=reservoir_diameter-container_thickness, h=reservoir_height + container_thickness + 1);
    
    rotate([90, 0, 0])
        translate([reservoir_diameter - large_fitting_offset_x, large_fitting_offset_z, -25])
            cylinder(r=large_fitting_radius-3, h=large_fitting_length+1);
 
    rotate([90, 0, 0])
        translate([reservoir_diameter-30, small_fitting_offset_z, -25])
            cylinder(r=small_fitting_radius-2, h=small_fitting_length+1);
}
