/************************************************************************

    clip.scad
    
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

module back_clip()
{
    // Depth Measurements
    light_depth = 3;
    ring_depth = 13;
    bezel_depth = 4;
    back_depth = 6;

    difference() {
        move([-(69/2) - 3,-(28/2),light_depth+ring_depth+bezel_depth]) cuboid([40 + 3,28,back_depth-1], center=false); // Stem of back

        union() {
            move([0,0,light_depth+ring_depth+bezel_depth-1]) cyl(l=back_depth+1, d=22, center=false); // Centre of back
            move([0,-(22/2),light_depth+ring_depth+bezel_depth-1]) cuboid([28,22,back_depth+1], center=false); // Stem of back
        }
    }
}

module front_clip()
{
    light_depth = 3;
    difference() {
        move([-(69/2) - 0.5,-(28/2),light_depth-6-2.5]) cuboid([40,28,5.5], center=false);

        // Remove centre ring
        move([0,0,-3 - 3]) cyl(l=light_depth + 3 + 4, d=42, center=false);

        // Remove centre of clip for light clearance
        move([-(69/2) - 6,-(21/2),light_depth-10]) cuboid([40,21,12], center=false);
    }
}

module top_connector()
{
    difference() {
        union() {
            move([0,0,-3]) cyl(l=20 + 6, d=69 + 1 + 5, center=false);
            move([-37.5,-(28/2), -3]) cuboid([3,28,26], center=false); // Flat bottom
        }
        move([0,0,-3 + -1]) cyl(l=20 + 6 + 2, d=69 + 1, center=false);
        move([-(69/2) - 6,-(21/2),-6]) cuboid([40,21,8], center=false); // Cover clearance
    }
}

module pivot()
{
    move([-35,0,-3]) rotate([90,0,0]) cyl(h=26, d=2);

    move([-35,12.5,-3]) rotate([90,0,0]) cyl(h=4, d=5);
    move([-35,-12.5,-3]) rotate([90,0,0]) cyl(h=4, d=5);
}

module remove_outer_ring()
{
    move([-50,14,-10]) cuboid([100,40,40], center=false);
    move([-50,-40 + -14,-10]) cuboid([100,40,40], center=false);
    move([10,-20,-10]) cuboid([40,40,40], center=false);
}

module render_clip()
{
    difference() {
        union() {
            back_clip();
            front_clip();
            top_connector();
            pivot();
        }
        remove_outer_ring();

        // Add a little extra clearance off the outer ring
        move([-32.5,-(30/2), 0]) cuboid([2,30,20], center=false); 
    }
}