PVector[] initDistCube(float cubeWidth, float cubeHeight, float cubeOff) {
  return new PVector[] {
    new PVector(random(cubeOff), 0), 
    new PVector(0, random(cubeOff)), 
    new PVector(0, cubeHeight - random(cubeOff)), 
    new PVector(random(cubeOff), cubeHeight), 
    new PVector(cubeWidth - random(cubeOff), cubeHeight), 
    new PVector(cubeWidth, cubeHeight - random(cubeOff)), 
    new PVector(cubeWidth, random(cubeOff)), 
    new PVector(cubeWidth - random(cubeOff), 0), 
  };
}
