reservoir_height = 135;
reservoir_radius = 50;

small_fitting_radius = 8;
small_fitting_length = 65;
small_fitting_offset_x = 30;
small_fitting_offset_z = 40;

large_fitting_radius = 12;
large_fitting_length = 75;
large_fitting_offset_x = 10;
large_fitting_offset_z = 14;

container_thickness = 5;

difference () {        
    union () {
        rotate([90, 0, 0])
            translate([reservoir_radius - large_fitting_offset_x, large_fitting_offset_z, -25])
                cylinder(r=large_fitting_radius, h=large_fitting_length);
        
        rotate([90, 0, 0])
            translate([reservoir_radius - large_fitting_offset_x, large_fitting_offset_z, 40])
                cylinder(r2=large_fitting_radius, r1=large_fitting_radius+1, h=10);
     
        rotate([90, 0, 0])
            translate([reservoir_radius-30, small_fitting_offset_z, -25])
                cylinder(r=small_fitting_radius, h=small_fitting_length);
        
        rotate([90, 0, 0])
            translate([reservoir_radius-30, small_fitting_offset_z, -25])
                cylinder(r=small_fitting_radius+4, h=25);
        
        rotate([90, 0, 0])
            translate([reservoir_radius-30, small_fitting_offset_z, small_fitting_length -35])
                cylinder(r2=small_fitting_radius, r1=small_fitting_radius+1, h=10);
        
        translate([-8, 25, 75]) cube([15, 50, container_thickness]);
            
            
        minkowski () {
            translate([reservoir_radius, reservoir_radius, 0])
                cylinder(r=reservoir_radius, h=reservoir_height);
            sphere(r=2);
       }
    }
    
    translate([reservoir_radius, reservoir_radius, container_thickness])
        cylinder(r=reservoir_radius-container_thickness, h=reservoir_height + container_thickness + 1);
    
    rotate([90, 0, 0])
        translate([reservoir_radius - large_fitting_offset_x, large_fitting_offset_z, -25])
            cylinder(r=large_fitting_radius-3, h=large_fitting_length+1);
 
    rotate([90, 0, 0])
        translate([reservoir_radius-30, small_fitting_offset_z, -25])
            cylinder(r=small_fitting_radius-3, h=small_fitting_length+1);
}
