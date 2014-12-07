// Need G4P library
import g4p_controls.*;

int red, gre, blu; //colors 
int wid = 0; //width
int hei = 0; //height
int keyVal = 0; 
int numRows = 0;
int numCols = 0;
boolean[] pressed = new boolean[256]; //keeps track of keys currently pressed

public void setup(){
  // Place your setup code here
  wid = displayWidth;
  hei = displayHeight;
  size(wid, hei);
  if (frame != null) {
    frame.setResizable(true);
  }
  numRows = hei/3; 
  numCols = wid/8;
  
  createGUI();
  customGUI();
}

public void draw(){
  //adding GUI graphics
  noStroke();
  //draw gradient for display
  for (int i = 0; i < 10; i++)
  {
    int teni = i * 10 + 50;
    fill(teni);
    rect(0, (height - 200) + i, width, 1);
  }
  
  //Draw line on top
  fill(0);
  rect(0, 20, width, 3);
  
  //Play button
  fill(150, 0, 0);
  int halfwid = width/2;
  ellipse(halfwid, height - 160, 30, 30);
  fill(0, 150, 0);
  triangle(halfwid - 5, height - 170, halfwid + 10, height - 160, halfwid - 5, height - 150);
  
  
  int notes_width = 164;
  for (int i = 0; i * notes_width < width; i++) 
  {
    int x = notes_width * i;
    fill(0);
     if ( (x + 45) < width ) { //check if the whole note fits on the page
      //first note
      ellipse(20 + x, height - 15, 10, 10);
      ellipse(40 + x, height - 15, 10, 10);
      rect(22 + x, height - 45, 3, 30);
      rect(22 + x, height - 45, 20, 3);
      rect(42 + x, height - 45, 3, 30);
    }
    if ( (x + 71) < width ) { //check if the whole note fits on the page
      //slanted note
      //triangle: (x1, y1, x2, y2, x3, y3)
      ellipse(62 + x, height - 10, 10, 10);
      triangle(60 + x, height - 40, 64 + x, height - 10, 63 + x, height - 40);
      triangle(64 + x, height - 10, 67 + x, height - 10, 63 + x, height - 40);
      triangle(62 + x, height - 40, 67 + x, height - 10, 62 + x, height - 40);
      triangle(62 + x, height - 40, 71 + x, height - 40, 62 + x, height - 36);
    }
    if ( (x + 116) < width) { //check if the whole note fits on the page
      //slanted double note
      ellipse(84 + x, height - 22, 10, 10);
      ellipse(107 + x, height - 18, 10, 10);
      triangle(87 + x, height - 22, 89 + x, height - 51, 92 + x, height - 50);
      triangle(87 + x, height - 22, 89 + x, height - 20, 92 + x, height - 50);
      triangle(89 + x, height - 51, 114 + x, height - 47, 113 + x, height - 44);
      triangle(89 + x, height - 48, 89 + x, height - 51, 113 + x, height - 44);
      triangle(113 + x, height - 47, 109 + x, height - 17, 112 + x, height - 16);
      triangle(113 + x, height - 47, 116 + x, height - 46, 112 + x, height - 16);
    }
    if ( (x + 174) < width ) { //check if the whole not fits on the page
      //triplet
      ellipse(125 + x, height - 10, 10, 10);
      ellipse(147 + x, height - 15, 10, 10);
      ellipse(169 + x, height - 20, 10, 10);
      rect(127 + x, height - 40, 3, 30);
      rect(149 + x, height - 45, 3, 30);
      rect(171 + x, height - 50, 3, 30);
      triangle(127 + x, height - 43, 127 + x, height - 40, 174 + x, height - 50);
      triangle(174 + x, height - 53, 174 + x, height - 50, 127 + x, height - 43);
    }
  }
}

void keyPressed(){  
  int keyIndex = -1;
  if( key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  } else if (key == 44) {
    keyIndex = 26;
  }
  
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
  
  red = int(random(keyVal));
  gre = int(random(keyVal));
  blu = int(random(keyVal));
  print(int(key) + " ");  
  
  for(int x = 0; x <= wid; x += numCols) {
    for (int y = 0; y <= hei; y += numRows) {
      if(keyVal >= 200) { fill(random(red),gre,blu); }
      else if(keyVal > 100 && keyVal < 200) { fill(red, random(gre), blu); }
      else { fill(red,gre,random(blu)); }
      rect(x, y, numCols, numRows - 100); 
    }   
  }
  
  switch(keyIndex) {
    case 0: a_click1((a), GEvent.CLICKED); break;
    case 1: b_click1((b), GEvent.CLICKED); break;
    case 2: c_click1((c), GEvent.CLICKED); break;
    case 3: d_click1((d), GEvent.CLICKED); break;
    case 4: e_click1((e), GEvent.CLICKED); break;
    case 5: f_click1((f), GEvent.CLICKED); break;
    case 6: g_click1((g), GEvent.CLICKED); break;
    case 7: h_click1((h), GEvent.CLICKED); break;
    case 8: i_click1((i), GEvent.CLICKED); break;
    case 9: j_click1((j), GEvent.CLICKED); break;
    case 10: k_click1((k), GEvent.CLICKED); break;
    case 12: m_click1((m), GEvent.CLICKED); break;
    case 13: n_click1((n), GEvent.CLICKED); break;
    case 16: q_click1((q), GEvent.CLICKED); break;
    case 17: r_click1((r), GEvent.CLICKED); break;
    case 18: s_click1((s), GEvent.CLICKED); break;
    case 19: t_click1((t), GEvent.CLICKED); break;
    case 20: u_click1((u), GEvent.CLICKED); break;
    case 21: v_click1((v), GEvent.CLICKED); break;
    case 22: w_click1((w), GEvent.CLICKED); break;
    case 23: x_click1((x), GEvent.CLICKED); break;
    case 24: y_click1((y), GEvent.CLICKED); break;
    case 25: z_click1((z), GEvent.CLICKED); break;
    case 26: comma_click1((comma), GEvent.CLICKED); break;
  }
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}
