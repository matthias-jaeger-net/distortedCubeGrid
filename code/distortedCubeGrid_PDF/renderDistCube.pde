void renderDistCube(PVector[] faces) {
  beginShape();
  for (PVector v : faces) vertex(v.x, v.y);
  endShape(CLOSE);
}
