int speed = 3, n = 50;
float w;
int curn = 0, curi = 1, direction = 1;
 
void setup() {
  size(750, 750); //Change this to any square size
  w = width - 5;
}
 
void draw() {
  for (int step = 0; step < speed; step++) { curi+=direction; background(255); if (curi >= (n)) {
      curn++;
      curi = curn+1;
    } else if (curi <= curn) { curi = n-1; curn--; } if (curn >= n) {
      curn = n-1;
      curi = n-1;
      direction = -1;
    } else if (curn == -1) {
      curn = 0;
      curi = 1;
      direction = 1;
    }
    float radius = w / 2, cx = width/2, cy=height/2;
    for (int i = 0; i <= curn; i++) {
      for (int j = i; j < (i == (curn) ? (curi) : n); j++) {
        float majorAngle = 2*PI*i/n, minorAngle = 2*PI*j/n;
        float x1 = cx + radius * cos(majorAngle), y1 = cy + radius * sin(majorAngle);
        float x2 = cx + radius * cos(minorAngle), y2 = cy + radius * sin(minorAngle);
        colorMode(HSB);
        stroke(map(i, 0, n, 150, 230), 255, 255);
        line(x1, y1, x2, y2);
      }
    }
  }
}
