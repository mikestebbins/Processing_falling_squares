/**
 * Square
 */
 
int dim = 3000   ;
int dimScreen = dim/10;

int num = 2500;           // Number of boxes 
int rows =50;
int columns=50;
int edgeMargin = 70;

int size = 50;
int offset = size +7;
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

void settings()  {
    size(dimScreen,dimScreen,P3D); 
}

void setup() { 
  //size(640, 640, P3D);
  rectMode(CENTER);
  colorset = colors[int(random(colors.length))];
} 
 
void draw() {
  //noLoop();
    noStroke();  
  thingIwantToDo();
} 

void thingIwantToDo()  {
  background(255,255,255);
  currentX = edgeMargin;
  currentY = edgeMargin;
  
  for(int i = 0; i   < rows; i++) {
    for (int j = 0; j < columns; j++)  {
      index = int(random(colors.length));
      fill(colors[(int)random(colors.length)]);
      
      float positionNoiseX = pow(( i+ 1),2) * 0.01 * random(-2,2);
      float positionNoiseY = pow(( i+ 1),2) * 0.01 * random(-2,2);
      float rotationNoise = i * 0.01 * random(-PI/2,PI/2);   
      
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

void keyPressed() {
  if (key ==' ') {
    g = createGraphics(dim,dim,JAVA2D);
    this.height = dim;
    this.width = dim;
    g.beginDraw();
    noStroke();
    thingIwantToDo();
    g.endDraw();
    save("result.png");
    println("screenshot saved");
    this.height = dimScreen;
    this.width = dimScreen;
  }
}
