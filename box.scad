$fn=50;

box_height=40;
box_size=60;
radius=5;
wall=2;
label_size=10;
label_length=30;

difference() {
    box(box_height, box_size, radius);
    
    translate([0, 0, wall]) {
        box(box_height, box_size-2*wall, radius-wall);
    }
}

translate([(-box_size)/2, 0, box_height]) label(label_length, label_size);

module label(length, size) {
    translate([wall, -length/2, -wall]) minkowski() {
        rotate([-90, 0, 0]) linear_extrude(height = length) polygon([[0,0], [size, 0], [0, size]]);
        sphere(wall);
    }
}

module box(height, size, radius) {
    difference() {
        linear_extrude(height=height) {
            minkowski() {
                square(size-2*radius, center=true);
                circle(radius);
            }
        }
        
        translate([-size/2, -size/2, 0]) difference() {
            translate([-0.5, -0.5, -1]) cube([size+1, size+1, radius+1]);
            translate([radius, radius, 0]) minkowski() {
                cube([size-2*radius, size-2*radius, radius]);
                cylinder(radius, 0, radius);
            }
        }
    }
}



