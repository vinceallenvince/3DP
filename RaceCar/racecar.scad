include <racecar-lib.scad>

/* Example 01.
 * racecar(bodyWidth = 38 // Car width.
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
 */
racecar(tireWidth=10);