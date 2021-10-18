/************************************************************************

    cover.scad
    
    Razer Kiyo Webcam Cover
    Copyright (C) 2021 Simon Inns
    
    This is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
    Email: simon.inns@gmail.com
    
************************************************************************/

include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/shapes.scad>

module lens_cover()
{
    difference() {
        union() {
            // Circular central part
            move([0,0,-5.5]) cyl(l=6.5, d=30, center=false);

            // Arm
            arm_width = 21.5;
            move([-35,-(arm_width/2),-5.5]) cuboid([28,arm_width,3], center=false);

            // Hinge
            move([-35,0,-3]) rotate([90,0,0]) cyl(h=arm_width, d=5);
        }

        // Circular centre
        move([0,0,-5.5 + 3]) cyl(l=6.5 + 2, d=30 - 6, center=false);

        // Hinge centre
        move([-35,0,-3]) rotate([90,0,0]) cyl(h=26, d=3);

        move([-35,10.5,-3]) rotate([90,0,0]) cyl(h=0.75, d=7);
        move([-35,-10.5,-3]) rotate([90,0,0]) cyl(h=0.75, d=7);

        // Hole for activity LED
        move([-17,-(1.5/2),-8]) cuboid([2,1.5,6], center=false);
    }
}

module render_cover()
{
    rotate([0,90,0]) {
        move([38 ,0,-32]) {
            lens_cover();
        }
    }

    //lens_cover();
}