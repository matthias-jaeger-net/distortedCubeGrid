import processing.pdf.*;

void setup() {

  size(800, 800, P3D);
  
  background(255);
  noFill();
  stroke(0);
  
  final float ANGLE = -PI; //random(0, TAU);
  final float CUBE = 380;
  final float HALF_CUBE = CUBE * 0.5;
  final float SEGMENTS = 4;
  final float SIZE = CUBE / SEGMENTS;
  final float DISTORTION = random(10, 80);

  beginRaw(PDF, "out/"+SEGMENTS+"x/dcubegrid-"+ANGLE+"-"+random(1)+".pdf");
  
  translate(width * 0.5, height * 0.5, 0);
  rotateY(ANGLE);
  translate(-HALF_CUBE, -HALF_CUBE, -HALF_CUBE);
  for (float u = -HALF_CUBE; u < HALF_CUBE; u += SIZE) {
    for (float v = -HALF_CUBE; v < HALF_CUBE; v += SIZE) {
      for (float w = -HALF_CUBE; w < HALF_CUBE; w += SIZE) {
        pushMatrix();
        translate(u + HALF_CUBE, v + HALF_CUBE, w + HALF_CUBE);
        PVector[] distortedCube = initDistCube(SIZE, SIZE, DISTORTION);
        renderDistCube(distortedCube);
        rotateX(HALF_PI);
        renderDistCube(distortedCube);
        rotateY(HALF_PI);
        renderDistCube(distortedCube);
        popMatrix();
      }
    }
  }
  
  endRaw();
  exit();
}
