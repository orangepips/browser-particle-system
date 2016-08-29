/**
Dianna Xu <br>
Bryn Mawr College, Department of Computer Science <br>
2D boids. Click to add a boid. Space bar to scatter. <br>
Must click in screen first before keys will function.
*/

ArrayList bs;

void setup() { 
  size(400, 400); 
  smooth(); 
  frameRate(25); 
  bs = new ArrayList(); 
  for ( int i=0; i < 50; i ++ ) {
    PVector p = new PVector(random(width), random(height));
    PVector v = new PVector(random(-10, 10), random(-10, 10));
    bs.add(new Boid(p, v, bs));
  } 
  background(0);
} // end setup()

void draw() {
  // create fade effect with transparent black layer 
  noStroke(); 
  fill(0, 20);
  rectMode(CORNER);
  rect(0, 0, width, height); 

  for ( int i=0; i < bs.size(); i ++ ) {
    Boid b = (Boid) bs.get(i); 
    b.update(); 
    b.draw();
  }
} // end draw()

void mousePressed() {
  PVector p = new PVector(mouseX, mouseY);
  PVector v = new PVector(random(-10, 10), random(-10, 10));
  bs.add(new Boid(p, v, bs));
} // end mousePressed()

void keyPressed() {
  for ( int i=0; i < bs.size(); i ++ ) { 
    Boid b = (Boid) bs.get(i);
    b.scatter();
  }
} // end keyPressed()

class Boid {
  PVector pos;
  PVector v;
  float w, h;
  float sep;  // seperation distance
  float ali;  // alignment distance 
  float coh;  // cohesion distance
  ArrayList others;

  Boid(PVector pos, PVector v, ArrayList others) {
    this.pos = pos;
    this.v = v;
    w = random(4, 8);
    h = random(20, 40);
    this.others = others;
    coh = max(w, h)*5;
    ali = coh/2;
    sep = ali/2;
  } // end Boid()

  void scatter() {
    v.x = random(-25, 25);
    v.y = random(-25, 25);
  } // end boo()

  void update() {
    separate();
    align();
    cohere();

    if (v.mag() > 4 ) {
      v.mult(0.9);
    }
    pos.add(v);

    if (pos.x > width-h ) { 
      v.x -= 2;
    }
    else if (pos.x < h ) { 
      v.x += 2;
    }
    if (pos.y > height-h ) {
      v.y -= 2;
    }
    else if (pos.y < h) { 
      v.y += 2;
    }
  } // end update()

  void separate() {
    int count = 0;
    PVector steer = new PVector(0, 0);

    for (int i=0; i <others.size(); i++) {
      Boid other = (Boid) others.get(i);
      float d = PVector.dist(pos, other.pos);
      if (d < sep && this != other) {
        steer.add(other.pos);
        count++;
      }
    }

    if (count  > 0) {
      steer.div(count);
      steer = PVector.sub(pos, steer);
      steer.normalize();
      steer.mult(1.2);
      v.add(steer);
    }
  } // end separate()

  void align() {
    int count = 0;
    PVector steer = new PVector(0, 0);

    for (int i=0; i < others.size(); i++) {
      Boid other = (Boid) others.get(i);    
      float d = PVector.dist(pos, other.pos);
      if (d < ali && this != other) {
        count++;
        steer.add(other.v);
      }
    }

    if (count  > 0) {
      steer.div(count);  
      steer.normalize();
      v.add(steer);
    }
  } // end align()

  void cohere() {
    int count = 0;
    PVector steer = new PVector(0, 0);

    for (int i=0; i < others.size(); i++) {
      Boid other = (Boid) others.get(i);  
      float d = PVector.dist(pos, other.pos);
      if (d < coh  && d > sep && this != other) {
        count++;
        steer.add(other.pos);
      }
    }

    if (count  > 0) {
      steer.div(count);
      steer = PVector.sub(steer, pos);
      steer.normalize();
      v.add(steer);
    }
  } // end cohere()


  void draw() {
    noFill();
    stroke(225);

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(atan(v.y/v.x) + (v.x < 0  ? PI : 0)); 
    //ellipse(0, 0, w, w);
    rectMode(CENTER);
    rect(0, 0, h, w);
    popMatrix();
  } // end draw()
} // end class Boid