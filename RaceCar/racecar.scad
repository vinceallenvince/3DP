include <racecar-lib.scad>

/* Example 01.
 * Standard racecar.
 * racecar(bodyType = 1 // Body type:
 *                        1 - Racer body
 *                        2 - Boat body
 *                        3 - Squared body
 *         bodyWidth = 38 // Car width.
 *         bodyLength = 68 // Car length.
 *         bodyHeight = 24 // Car height.
 *         tireRadius=13 // Tire Radius; Max should be ~35% of car length.
 *         tireWidth=10 // Tire width; Min = 10
 *         rimDepth=3 // The depth of the hub that holds the hub cap.
 *         rimInset=3 // The distance bw the edge of the tire and the hub.
 *         axleRadius=2 // Axle radius. Min = 2
 *         axleZOffset=6 // The distnace from the center of the car body on the z-axis.
 *         roofOffset=0.9 // The percentage offset from the center of the car body on the y-axis.
 *         headLightRadius=3 // The head light radius; tail lights are half this value.
 *         singleItem="wheel"
 */
racecar();

/* Example 02.
 * Boat body.
 */
 //racecar(bodyType=2);
 
/* Example 03.
 * Squared body with fat tires.
 */
//racecar(bodyType=3, bodyWidth=42, tireWidth=16);