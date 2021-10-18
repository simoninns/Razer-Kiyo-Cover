/************************************************************************

    main.scad
    
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

// Local includes
include <camera.scad>
include <clip.scad>
include <cover.scad>

// Rendering resolution
$fn=50;

// Select rendering parameters
display = "Assembled"; // [Assembled, Printing]

// Render the required items
module main()
{
    rotate([0,-90,0]) {
        move([37.5,0,0]) {
            //render_camera();
            render_clip();
            render_cover();
        }
    }
}

main();