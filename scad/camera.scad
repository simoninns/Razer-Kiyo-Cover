/************************************************************************

    camera.scad
    
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

// Render a model of the camera body
// Note: This is just for visualization, not printing
module render_camera()
{
    color([0.9,0.9,0.9]) {
        // Depth Measurements
        light_depth = 3;
        ring_depth = 13;
        bezel_depth = 4;
        back_depth = 6;

        // Light ring
        difference() {
            cyl(l=light_depth, d=68, center=false);
            move([0,0,-1]) cyl(l=light_depth+2, d=40, center=false);
        }

        move([0,0,light_depth]) cyl(l=ring_depth, d=69, center=false); // Main ring
        move([0,0,light_depth+ring_depth]) cyl(l=bezel_depth, d1=69, d2=52, center=false); // Ring back Bezel

        move([0,0,light_depth+ring_depth+bezel_depth]) cyl(l=back_depth, d=22, center=false); // Centre of back
        move([0,-(22/2),light_depth+ring_depth+bezel_depth]) cuboid([28,22,back_depth], center=false); // Stem of back
    }
}