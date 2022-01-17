/**
 * Square
 */
 
int dim = 6000   ;
int dimScreen = dim/10;

int num = 10000;           // Number of boxes 
int rows =100;
int columns=100;
int edgeMargin = 50;

int size = 50;
int offset = size +9;
int currentX = 0;
int currentY = 0;

float a;                 // Angle of rotation

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
  
  int boxCounter = 0;
  
  for(int i = 0; i   < rows; i++) {
    for (int j = 0; j < columns; j++)  {
    
      int index = boxCounter % 4;
      
      println(index);     
      fill(colors[(index)]);
      
      float positionNoiseX = pow(( i+ 1),2) * 0.0002 * randomGaussian();
      float positionNoiseY = pow(( i+ 1),2) * 0.0008 * randomGaussian();
      float rotationNoise = i * 0.001 * randomGaussian()*PI/2;  
      
      pushMatrix();
      translate(currentX+positionNoiseX,currentY+positionNoiseY);
      rotate(rotationNoise);
      //rect(currentX+positionNoiseX,currentY+positionNoiseY,size,size);
      
      rect(0,0,size,size); 
      popMatrix();
      
      boxCounter ++;
      
      currentX = currentX + offset;
    
      if (j ==( columns - 1)) {
        currentX = edgeMargin;
        currentY = currentY + offset;
        boxCounter++;
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
