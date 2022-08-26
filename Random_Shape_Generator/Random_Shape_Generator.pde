// https://discourse.processing.org/t/irregular-polygon-generator/742


import java.util.Comparator;
import java.util.Collections;

ArrayList <Shape> shapes = new ArrayList(); 
float mar1, mar2;

void setup() {
  size(800, 800);
  mar1 = 120;
  mar2 = 120;
  background(20);
  shapes.add(new Shape());
}

void draw() {
  background(20);
  //line(0, height/2, width, height/2);
  shapes.get(shapes.size()-1).display();
}

void mouseClicked() {
  shapes.clear();
  shapes.add(new Shape());
}

void addNew() {
  shapes.add(new Shape());
}


static int numVecs = 10;
int num; 
PVector loc;

public class Shape {
  ArrayList <Vec> vecs = new ArrayList();  
  public Shape() {
    for (int i = 0; i< numVecs; i++) {
      vecs.add(new Vec(random(-( mar1 -10), ( mar1 -10)), random(-( mar2 -10), ( mar2 -10) )));
    }
    vecs.set(0, new Vec(-200, 0));
    vecs.set(numVecs/2, new Vec(200, 0));
    Collections.sort(vecs);
    loc = new PVector(width/2, height/2);
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);

    stroke(255, 0, 0);
    //ellipse(0, 0, 5, 5);
    //line(0, -height, 0, height);

    stroke(255);
    fill(0, 255, 0, 20);
    beginShape();
    for (int i = 0; i< vecs.size(); i++) {
      vertex(vecs.get(i).x, vecs.get(i).y);
    }
    endShape(CLOSE);

    stroke(255, 100);
    for (int i = 0; i< vecs.size(); i++) {
      line(0, 0, vecs.get(i).x, vecs.get(i).y);
    }
    stroke(255, 0, 0);
    //ellipse(0, 0, 5, 5);
    update();
    popMatrix();
  }

  void update() {

    if (keyPressed == true) {
      if (keyCode == 39) {
        loc.x += 3;
      } else if (keyCode == 37) {
        loc.x -= 3;
      } else if (keyCode == 38) {
        loc.y -=3 ;
      } else if (keyCode == 40) {
        loc.y +=3;
      } else if (key == 'r') {
        loc.y = height/2;
        loc.x = width/2;
      }
    }
    
  }
  
}

public class Vec implements Comparable<Vec> {

  float x, y;
  float head;
  float mag;

  public Vec( float x, float y) {
    this.x = x;
    this.y = y;
    PVector p = new PVector(x, y);
    head = p.heading();
    //mag = p.length();
  }

  @Override
    public int compareTo(Vec other) {
    if ( this.head > other.head) return 1;
    else if ( this.head == other.head) return 0;
    else if ( this.head < other.head) return -1;
    return 0;
  }
}
