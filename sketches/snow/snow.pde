int quantity = 300;

SnowFlake[] snowFlakes = new SnowFlake[quantity];

void setup() {
  size(400, 400);
  frameRate(30);
  noStroke();
  smooth();
  
  for(int i = 0; i < quantity; i++) {
    snowFlakes[i] = new SnowFlake();
  }
}

void draw() {
  background(0);
  for(SnowFlake snowFlake: snowFlakes) {
    snowFlake.draw();    
  }
}

class SnowFlake {
  int minFlakeSize = 1;
  int maxFlakeSize = 5;
  
  float xPosition;
  float yPosition;
  int flakeSize;
  int direction;
  
  SnowFlake() {
    this.flakeSize = round(random(minFlakeSize, maxFlakeSize));
    this.xPosition = random(0, width);  
    this.yPosition = random(0, height);
    this.direction = round(random(0, 1));
  }
  
  void draw() {
    ellipse(xPosition, yPosition, flakeSize, flakeSize);
    
    xPosition += (direction == 0 ? 1 : -1) * map(flakeSize, minFlakeSize, maxFlakeSize, .1, .5); 
    
    yPosition += flakeSize + direction; 
    
    if(isOffScreen()) {
      xPosition = random(0, width);
      yPosition = -flakeSize;
    }
  }
  
  boolean isOffScreen() {
    return xPosition > width + flakeSize || xPosition < -flakeSize || yPosition > height + flakeSize; 
  }
}