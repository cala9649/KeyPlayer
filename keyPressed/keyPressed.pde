// Click on the image to give it focus,
// and then press any key.

int r = 0;
int g = 0;
int b = 0;
int w = 0;
int h = 0;
int keyVal = 0;
int numRows = 0;
int numCols = 0;
boolean[] pressed = new boolean[256];
boolean white = true;

void setup() {
  w = displayWidth;
  h = displayHeight - 300;
  size(w, h);
  if (frame != null) {
    frame.setResizable(true);
  }
  numRows = h/4;
  numCols = w/12;
}

void keyPressed() { 
   if(int(key) == 65535) { key = 255; }
   pressed[key] = true;
   
   if(int(key) >= 100 && int(key) <= 135) {
      keyVal = key + 120;
    }
    else if(int(key) < 100) {
      keyVal = key + 50;
    }
    else {
      keyVal = 255;
    }
   
    r = int(random(keyVal));
    g = int(random(keyVal));
    b = int(random(keyVal));
    print(int(key) + " ");    
    //do drawing and changes in here

    for(int x = 0; x <= w; x += numCols) {
      for (int y = 0; y <= h; y += numRows) {
        if(keyVal >= 200) { fill(random(r),g,b); }
        else if(keyVal > 100 && keyVal < 200) { fill(r, random(g), b); }
        else { fill(r,g,random(b)); }
        rect(x, y, numCols, numRows); 
      }   
    }
 
    if(white) {
      fill(255);
      white = false;
    }
    else if(!white) {
      fill(10);
      white = true;
    }
    
    if(pressed[49]) { rect(0,0, numCols+10, numRows+10, 10); }
    if(pressed[50]) { rect(numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[51]) { rect(2*numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[52]) { rect(3*numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[53]) { rect(4*numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[54]) { rect(5*numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[55]) { rect(6*numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[56]) { rect(7*numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[57]) { rect(8*numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[48]) { rect(9*numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[45]) { rect(10*numCols-5, 0, numCols+10, numRows+10, 10); }
    if(pressed[61]) { rect(11*numCols-5, 0, numCols+10, numRows+10, 10); }    
    if(pressed[113]) { rect(0, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[119]) { rect(numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[101]) { rect(2*numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[114]) { rect(3*numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[116]) { rect(4*numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[121]) { rect(5*numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[117]) { rect(6*numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[105]) { rect(7*numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[111]) { rect(8*numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[112]) { rect(9*numCols-5, numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[91]) { rect(10*numCols-5, numRows-5, numCols+10, numRows+10, 10); }    
    if(pressed[93]) { rect(11*numCols-5, numRows-5, numCols+10, numRows+10, 10); }    
    if(pressed[97]) { rect(0, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[115]) { rect(numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[100]) { rect(2*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[102]) { rect(3*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[103]) { rect(4*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[104]) { rect(5*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[106]) { rect(6*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[107]) { rect(7*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[108]) { rect(8*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[59]) { rect(9*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[39]) { rect(10*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }    
    if(pressed[10]) { rect(11*numCols-5, 2*numRows-5, numCols+10, numRows+10, 10); }   
    if(pressed[255]) { rect(0, 3*numRows-5, numCols+10, numRows+10, 10);
                                 rect(11*numCols-5, 3*numRows-5, numCols+10, numRows+10, 10); }    
    if(pressed[122]) { rect(numCols-5, 3*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[120]) { rect(2*numCols-5, 3*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[99]) { rect(3*numCols-5, 3*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[118]) { rect(4*numCols-5, 3*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[98]) { rect(5*numCols-5, 3*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[110]) { rect(6*numCols-5, 3*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[109]) { rect(7*numCols-5, 3*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[44]) { rect(8*numCols-5, 3*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[46]) { rect(9*numCols-5, 3*numRows-5, numCols+10, numRows+10, 10); }
    if(pressed[47]) { rect(10*numCols-5, 3*numRows-5, numCols+10, numRows+10, 10); }
}

void keyReleased() {
  if(int(key) == 65535) { key = 255; }
  pressed[key] = false;
     for(int x = 0; x <= w; x += numCols) {
      for (int y = 0; y <= h; y += numRows) {
        if(keyVal >= 200) { fill(random(r),g,b); }
        else if(keyVal > 100 && keyVal < 200) { fill(r, random(g), b); }
        else { fill(r,g,random(b)); }
        rect(x, y, numCols, numRows); 
      }   
    } 
}

void draw() {
  //press space bar for rapid changing squares
  if(key == 32) {
    for(int x = 0; x <= w; x += numCols) {
      for (int y = 0; y <= h; y += numRows) {
        fill(random(r),random(g),random(b));
        rect(x, y, numCols, numRows);   
      }
    }
  }
}

