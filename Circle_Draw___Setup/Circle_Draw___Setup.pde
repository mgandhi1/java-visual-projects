Circle c1 = new Circle(20,40,10,1,0, 255, 255, 255);
Circle c2 = new Circle(800,40,10,-1,0, 255, 255, 255);
final int NUM_PARTICLES = 100;
Circle[] lots0fcircles = new Circle[NUM_PARTICLES];
color[] lots0fcolors = new color[NUM_PARTICLES];
float radius = random(5, 50); 

void setup() // happens first, happens once...
{
  ellipseMode(RADIUS);
  frameRate(120);
   for (int i = 0; i<lots0fcircles.length; i++){
     int x = (int) random(100, 800);
     int y = (int) random(100, 800);
     int radius = (int) random(5,20);
     int dx = (int) random(-20,20);
     int dy = (int) random(-20,20);
    lots0fcolors[i]=color(random(255), random(255), random(255));
     lots0fcircles[i] = new Circle(x,y,radius, dx,dy, 255, 255, 255);
   }
     
  size(1440, 900);
  noStroke();

}
void draw() // happens after setup, happens over and over.....
{
    background(104);
    
    for (int m = 0; m<lots0fcircles.length; m++){
      //for(int i=0;i<lots0fcircles.length;i++){    // this is the execution of the overlap method 
      //  if(m!=i){
      //    lots0fcircles[m].overlap(lots0fcircles[i]);
      //  }
      //}
      
      fill(lots0fcolors[m]);
      lots0fcircles[m].display();
      lots0fcircles[m].move();
      lots0fcircles[m].bounce();
    } 
}
 
