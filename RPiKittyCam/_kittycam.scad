include <_kittycam-lib.scad>

/* Example 01.
 * Standard RPi enclosure.
 *
 *          render_spacer = false; // if true, only renders spacer
 *          spacer_height = 38; // spacer height
 *          render_bottom_plate = true; // RPi mounts
 *          edgePadding = 12; // distance bw base edge and RPi edge
 *          standoffHeight = 4; // hright of RPi standoffs
 *          printRPi = false; // set to true to print the RPi footprint
 *          spcRPiH = 26; // spacer height from base to bottom speaker panel
 *          spcSpeakerH = 18; // spacer height bw top and bottom speaker panels
 *          spcGrillH = 6; // spacer height bw top speaker panel and grill
 *          printGrill = false; // set to true to print grill
 *          totalRings = 16; // total grill pattern rings
 *          maxGrillHoleRadius = 2.25;
 */
 kittycam(render_spacer=false,
            spacer_height=38,
            render_bottom_plate=false,
            render_middle_plate=true,
            render_top_plate=true);