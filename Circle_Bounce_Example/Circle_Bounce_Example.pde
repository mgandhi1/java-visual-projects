PVector location;  // Location of shape
PVector bvel; 
PVector gravity;   // Gravity acts at the shape's acceleration

void setup() {
  size(640,360);
  location = new PVector(100,100);
  bvel = new PVector(1.5,2.1);
  gravity = new PVector(0,0.2); // vector of ball

}

void draw() {
  
background(255);
  location.add(bvel);
  bvel.add(gravity);
  
  if ((location.x > width) || (location.x < 0)) {
    bvel.x = bvel.x * -1;
  }
  if (location.y > height) {
    bvel.y = bvel.y * -0.5; 
    location.y = height;
  }
  while (location.y == 360 && location.x == 640){ // 
    bvel.y = 0; bvel.x = 0;
  }

  stroke(243);
  strokeWeight(2);
  fill(127);
  ellipse(location.x,location.y,48,48);
}
