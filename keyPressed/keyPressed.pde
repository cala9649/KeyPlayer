// Click on the image to give it focus,
// and then press any key.

int r, g, b; //colors 
int w = 0; //width
int h = 0; //height
int keyVal = 0; 
int numRows = 0;
int numCols = 0;
boolean[] pressed = new boolean[256]; //keeps track of keys currently pressed

void setup() {
  w = displayWidth;
  h = displayHeight - 300;
  size(w, h);
  if (frame != null) {
    frame.setResizable(true);
  }
  numRows = h/3; 
  numCols = w/8;
}

void keyPressed() {
   
   if(int(key) == 65535) { key = 255; }
   pressed[key] = true;
   
   if(int(key) >= 100 && int(key) <= 135) {
      keyVal = key + 120;
    }
    else if(int(key) < 100) {
      keyVal = key + 100;
    }
    else {
      keyVal = 255;
    }
    
    if(int(key) == 32) { keyVal = 200; }
   
    r = int(random(keyVal));
    g = int(random(keyVal));
    b = int(random(keyVal));
    print(int(key) + " ");   
    
    //do drawing and changes in here

    for(int x = 0; x <= w; x += numCols) {
      for (int y = 0; y <= h; y += numRows) {
        if(keyVal >= 200) { fill(random(255),g,b); }
        else if(keyVal > 100 && keyVal < 200) { fill(r, random(255), b); }
        else { fill(r,g,random(255)); }
        rect(x, y, numCols, numRows); 
      }   
    }

    fill(0);
    
    //row q - i
    if(pressed[113]) { rect(0, 0, numCols+10, numRows+10, 10); }
    if(pressed[119]) { rect(numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[101]) { rect(2*numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[114]) { rect(3*numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[116]) { rect(4*numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[121]) { rect(5*numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[117]) { rect(6*numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[105]) { rect(7*numCols-5, 0, numCols+10, numRows+10, 10); }
    
    //row a - k
    if(pressed[97]) { rect(0, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[115]) { rect(numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[100]) { rect(2*numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[102]) { rect(3*numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[103]) { rect(4*numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[104]) { rect(5*numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[106]) { rect(6*numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[107]) { rect(7*numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    
    //row z - , 
    if(pressed[122]) { rect(0, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[120]) { rect(numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[99]) { rect(2*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[118]) { rect(3*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[98]) { rect(4*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[110]) { rect(5*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[109]) { rect(6*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[44]) { rect(7*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
}

void keyReleased() {
  if(int(key) == 65535) { key = 255; }
  pressed[key] = false;
  
     for(int x = 0; x <= w; x += numCols) {
      for (int y = 0; y <= h; y += numRows) {
        if(keyVal >= 200) { fill(random(255),g,b); }
        else if(keyVal > 100 && keyVal < 200) { fill(r, random(255), b); }
        else { fill(r,g,random(255)); }
        rect(x, y, numCols, numRows); 
      }   
    }   
}

void draw() {
  //press space bar for rapid changing squares
  if(key == 32) {
    
    for(int x = 0; x <= w; x += numCols) {
      for (int y = 0; y <= h; y += numRows) {
        fill(random(r),random(150),random(b));
        rect(x, y, numCols, numRows);   
      }
    }
  }
}

