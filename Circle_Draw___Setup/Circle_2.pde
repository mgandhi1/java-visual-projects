public class Circle {
  
  // attributes
  private float xCenter;
  private float yCenter;
  private float radius;
  private float dx;
  private float dy;
  boolean[] notInteract;
  public static final double PI = 3.14159;
  
  //constructor
  public Circle(float x, float y, float r, float xvel, float yvel, float red, float green, float blue) 
  {
    xCenter = x;
    yCenter  = y;
    radius = r;
    dx = xvel;
    dy = yvel;
  }
  
  public void display()
  {
    // draw a circle with (xCenter and yCenter) with size (radius*2)
    ellipse(xCenter, yCenter, radius*2, radius*2);
  }
  
  public void move() {
      xCenter = xCenter + 0.2*(dx);
      yCenter = yCenter + 0.2*(dy);
      
      
      // unique functions 
      if (keyPressed) {
       if (key=='f'){
          dx = dx *-1;
          dy = dy *-1;
       }
     }
     if (keyPressed) {
       if (key=='y'){
          dx = dx *-1;
       }
     } 
     if (keyPressed) {
       if (key=='x'){
          dy = dy *-1;
       }
     }  
     if (keyPressed) {
       if (key=='r'){
         setup();
       }
     } 
  }
    
  // bounce method 
  public void bounce() { 
    
        if (xCenter > width-radius || xCenter < radius) {
          dx *= -1;
        }
        if (yCenter > height-radius || yCenter < radius) {
          dy *= -1;
        }
        
      xCenter = xCenter + 0.2*(dx);
      yCenter = yCenter + 0.2*(dy);
    
  }
  
  //return the area of this circle
  public double area()
  {
    return PI * Math.pow(radius, 2);
  }
  
  //return the circumference of this circle
  public double circumference()
  {
    return PI * 2 * radius;
    //double circumference;
    //circumference = 2 * PI * radius;
    //return circumference;
  }
  
  //returns true if this Circle overlaps Circle other and false otherwise
  public void overlap(Circle other)
  {
    
    float xDiff = xCenter-other.xCenter;
    float yDiff = yCenter-other.yCenter;
    double distance = Math.sqrt(xDiff * xDiff + yDiff * yDiff);
    //if(radius + other.radius > distance-10 )
    //{
    //  int k=1;
    //  dx *= -k;
    //  dy *=-k;
    //}
  }
  
  //increase the radius by n units
  public void grow(float n)
  {
    radius = radius + n;
  }
  
  public float getX()
  {
    return xCenter;
  }
  
  public float getY()
  {
    return yCenter;
  }
  
  public float getRadius()
  {
    return radius;
  }
  
  public float DX()
  {
    return dx;
  }
  
  public float DY()
  {
    return dy;
  }
}


/* Math.sqrt((xCenter-other.xCenter)*(xCenter-other.xCenter) + (yCenter-other.yCenter)*(yCenter-other.yCenter)) */
