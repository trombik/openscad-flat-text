flat_text_base_hight = 1.2;
flat_text_holder_thickness = 3;
flat_text_holder_width = 25;
flat_text_holder_angle = 60;
flat_text_holder_base_depth = 25;

module __flat_text_hoilder_base()
{
    hull() {
        translate([flat_text_holder_base_depth, 0, 0]) circle(d = flat_text_holder_thickness, $fn = 15);
        circle(d = flat_text_holder_thickness, $fn = 15);
    }
}

module __flat_text_hoilder() {
    rotate(flat_text_holder_angle) {
        difference() {
            hull() {
                translate([10, 0, 0]) circle(d = flat_text_holder_thickness, $fn = 15);
                circle(d = flat_text_holder_thickness, $fn = 15);
            }
            hull() {
                translate([10, 0, 0]) square(flat_text_base_hight, center = true);
                translate([1000, 0, 0]) circle(d = flat_text_base_hight);
            }
        }
    }
}

module flat_text_holder()
{
    linear_extrude(height = flat_text_holder_width, center = true, convexity = 10, twist = 0) {
        __flat_text_hoilder();
        __flat_text_hoilder_base();
    }
}

flat_text_holder();
