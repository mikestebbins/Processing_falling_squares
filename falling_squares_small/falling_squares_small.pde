/**
 * Square
 */

int num = 100;           // Number of boxes 
int rows = 10;
int columns= 10;
int edgeMargin = 70;

int size = 50;
int offset = size +4;
int currentX = 0;
int currentY = 0;

float a;                 // Angle of rotation

int index;
int colorset;

//color[] colors = { 
//  0xD7313975,
//  0xD7652770, 
//  0xD799A637, 
//  0xD7AA8B39, 
//};

color[] colors = { 
  0xD72F8B2F ,
  0xD7236868 ,
  0xD7AE6F3B ,
  0xD7AE3B3B ,
};

void setup() { 
  size(680, 680, P3D);
  noStroke();  
  rectMode(CENTER);
  colorset = colors[int(random(colors.length))];
} 
 
void draw() {
  noLoop();
  
  background(255,255,255);
  currentX = edgeMargin;
  currentY = edgeMargin;
  
  for(int i = 0; i   < rows; i++) {
    for (int j = 0; j < columns; j++)  {
      index = int(random(colors.length));
      fill(colors[(int)random(colors.length)]);
      
      float positionNoiseX = pow(( i+ 1),2) * 0.05 * random(-2,2);
      float positionNoiseY = pow(( i+ 1),2) * 0.1 * random(-2,2);
      float rotationNoise = i * 0.035 * random(-PI/2,PI/2);   
      
      pushMatrix();
      translate(currentX+positionNoiseX,currentY+positionNoiseY);
      rotate(rotationNoise);
      //rect(currentX+positionNoiseX,currentY+positionNoiseY,size,size);
      
      rect(0,0,size,size);
      popMatrix();
      
      currentX = currentX + offset;
      if (j ==( columns - 1)) {
        currentX = edgeMargin;
        currentY = currentY + offset;
      }
    }
  }   
} 
