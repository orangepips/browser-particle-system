color bgColor = color(5,5,50);

int quantity = 100;

RainDrop[] rainDrops = new RainDrop[quantity];
 
void setup(){
  size(400,400);
  noStroke();
  smooth();
  background(bgColor);
  frameRate(60);
  noCursor();
  for(int i = 0; i < rainDrops.length; i++){
    rainDrops[i] = new RainDrop();
  }
}
 
void draw(){
  background(bgColor);
  for (RainDrop rainDrop: rainDrops) {
    if (!rainDrop.isReusable){
      rainDrop.draw();
    } else if((int)random(3)==0) {
        rainDrop.create((int)random(0,width));
    }
  }
}
 
class RainDrop{
  float x,y,g;
  float waveRadius=50;
  float waveSpeed=0.8;
  Boolean isDropped;
  public Boolean isReusable;
 
  RainDrop(){
    init();
    y=x=g=-100;
  }
   
  public void create(int x){
    init();
    this.x=x;
    y=random(-500, -50);
    g=random(height/2,height);
  }
   
  public void draw(){
    update();
    if(!isDropped){
      fill(255);
      ellipse(x,y,2,2);
      fill(255);
    } else if(!isReusable) {
      splash();
    }
  }
  
  public void update(){
    y+=3.5;
    isDropped = (g < y);
    isReusable = (isDropped && (y-g)*waveSpeed>waveRadius);
  }
  
  void init() {
    isDropped=false;
    isReusable=false;
  }
  
  void splash() {
    noFill();
    strokeWeight(1);
    stroke(map((y-g)*waveSpeed,0,waveRadius,230,20));
    ellipse(x,g,(y-g)*waveSpeed,(y-g)*waveSpeed/2);
    noStroke();
    fill(255);
  }
}