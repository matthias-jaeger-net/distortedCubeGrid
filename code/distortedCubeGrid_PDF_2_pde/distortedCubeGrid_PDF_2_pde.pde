/**
 * distortedCubeGrid
 * Author: Matthias Jäger
 * Date: 2020-21-08, MIT
 */


/** IMPORTS */
// ---------------------------------------------------------------------- //


import processing.pdf.*;


/** CONSTANTS */
// ---------------------------------------------------------------------- //


// Angle of rotation
final float ANGLE = PI/4; //random(0, TAU);

// Scale of the cube
final float CUBE = 380;

// A cube is drawn from -0.5 to 0.5 of it's width
final float HALF_CUBE = CUBE * 0.5;

// How many rows and columns
final float SEGMENTS = 4;

// Size of a single cell in the cube 
final float SIZE = CUBE / SEGMENTS;


/** FUNCTIONS */
// ---------------------------------------------------------------------- //


/** Returns the corners of a distorted square */
PVector[] corners(float w, float h, float off) {
  return new PVector[] {
    new PVector(random(off), 0), 
    new PVector(0, random(off)), 
    new PVector(0, h - random(off)), 
    new PVector(random(off), h), 
    new PVector(w - random(off), h), 
    new PVector(w, h - random(off)), 
    new PVector(w, random(off)), 
    new PVector(w - random(off), 0), 
  };
}


/** Renders the corners as polygon */
void renderCorners(PVector[] faces) {
  beginShape();
  for (PVector v : faces) vertex(v.x, v.y);
  endShape(CLOSE);
}


/** Uses the beveled polygons to create sides of a 3D cube */
void renderCube(float s, float u, float v, float w) {
  pushMatrix();
  translate(u, v, w);
  PVector[] cube = corners(s, s,  random(10, 80));
  renderCorners(cube);
  rotateX(HALF_PI);
  renderCorners(cube);
  rotateY(HALF_PI);
  renderCorners(cube);
  translate(0, s, 0);
  rotateX(HALF_PI);
  renderCorners(cube);
  popMatrix();
}


/** MAIN FUNCTION */
// ---------------------------------------------------------------------- //


/** Automatically called by the framework */
void setup() {
  
  // Set canvas size and 3D renderer
  size(800, 800, P3D);

  // Begin the PDF recording as "raw 3D"  
  beginRaw(PDF, "cube.pdf");

  // Clear the drawing area with white
  background(255);

  // Remove the default white fill
  noFill();

  // Set the line color to black
  stroke(0);

  // Move drawing origin in the center
  translate(width * 0.5, height * 0.5, 0);

  //Apply rotation  
  rotateY(ANGLE);

  // Create 3D cube in space in a nested loop
  for (float u = -HALF_CUBE; u < HALF_CUBE; u += SIZE) 
    for (float v = -HALF_CUBE; v < HALF_CUBE; v += SIZE) 
      for (float w = -HALF_CUBE; w < HALF_CUBE; w += SIZE)
        renderCube(SIZE, u, v, w);

  // Finish PDF writing
  endRaw();

  // Done, finish active process  
  exit();
}
