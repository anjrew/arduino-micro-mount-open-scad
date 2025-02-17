
// Bracket dimensions
bracket_width  = 20;  // mm
bracket_length = 48;  // mm
bracket_height = 4;   // mm

// Object dimensions (the recess cutout)
// For example: 18mm wide, 20mm long, 1.5mm tall
extend_margin = 1;
object_width  = 17.75;   // mm
object_length = 48.27;   // mm
object_length_start = (bracket_length - object_length) / 2;   // mm

object_height = 1.76;  // mm
object_allowance = 0.1;
object_height_allowance = object_height + (object_allowance * 2);

object_width_allowance = object_width + (object_allowance * 2);
object_width_start = (bracket_width - object_width) / 2; 

// Pin cutout
pin_width = 17.77;
pin_length = 43.1;
pin_height = 12;
pin_width_start = (bracket_width - pin_width) / 2; 
pin_length_start = (bracket_length - pin_length) / 2;   // mm
pin_width_allowance = pin_width + (object_allowance * 2);

clamp_width = 0.6;
clamp_width_start = pin_width_start + clamp_width; 
clamp_width_gap = pin_width_allowance - (clamp_width * 2);


difference() {
    // Base bracket: 20mm (width) x 20mm (length) x 4mm (height)
    cube([bracket_width,bracket_length,bracket_height]);
    
    // Cutout: 18mm (width) x 20mm (length) x 1.5mm (depth)
    // It’s centered in the x-direction (leaving a 1mm margin on each side)
    // and positioned so that the recess is on the top surface (starting at 4-1.5 = 2.5mm high)
    
    // The allowance for the board
    translate([object_width_start, object_length_start-extend_margin, 1.8])
        cube([object_width_allowance, object_length + extend_margin, object_height_allowance]);
    
   // Allowance for Pins
   translate([pin_width_start, pin_length_start, 2.62])
        cube([pin_width_allowance, pin_length, pin_height]);
    
   // Break through the middle
   translate([clamp_width_start, object_length_start-extend_margin, 2.62])
        cube([clamp_width_gap, object_length + extend_margin, pin_height]);
}
