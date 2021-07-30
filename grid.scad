$fn=50;

edge=4.9;
box_size=60;
grid_size=3;

grid_len=grid_size*box_size;

intersection() {
    for (i = [0:grid_size]) {
        translate([i*box_size-grid_len/2, grid_len/2, 0]) {
            rail(grid_len);
        }
        rotate([0, 0, 90]) {
            translate([i*box_size-grid_len/2, grid_len/2, 0]) {
                rail(grid_len);
            }
        }
    }
    translate([-grid_len/2, -grid_len/2, 0]) {
        cube([grid_len, grid_len, edge]);
    }
}

module rail(len) {
    rotate([90,0,0]) {
        linear_extrude(height = len) {
            polygon([[edge,0],[0,edge],[-edge,0]]);
        }
    }
}