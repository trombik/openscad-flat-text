module base()
{
    hull() {
        translate([25, 0, 0]) circle(d = 3, $fn = 15);
        circle(d = 3, $fn = 15);
    }
}

module holder() {
    rotate(60) {
        difference() {
            hull() {
                translate([10, 0, 0]) circle(d = 3, $fn = 15);
                circle(d = 3, $fn = 15);
            }
            hull() {
                translate([10, 0, 0]) square(1.2, center = true);
                translate([1000, 0, 0]) circle(d = 1.2);
            }
        }
    }
}


linear_extrude(height = 25, center = true, convexity = 10, twist = 0) {
    holder();
    base();
}
