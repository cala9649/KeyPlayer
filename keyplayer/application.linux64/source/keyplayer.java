import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import g4p_controls.*; 
import ddf.minim.*; 
import ddf.minim.signals.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class keyplayer extends PApplet {

// Need G4P library



AudioPlayer player;

Minim minim;
AudioOutput out;
TriangleWave triangle;


int red, gre, blu; //colors 
int wid = 0; //width
int hei = 0; //height
int keyVal = 0; 
int numRows = 0;
int newNumRows = 0;
int numCols = 0;
String songFile = "heyheyhey.wav";
boolean[] pressed = new boolean[256]; //keeps track of keys currently pressed

public void setup(){
  /**
    setup() builds the initial frame for the program by opening in fullscreen mode and initiating the GUI.
  */
  
  // Place your setup code here
  size(displayWidth, displayHeight);
  if (frame != null) {
    frame.setResizable(true);
  }
  wid = displayWidth;
  hei = displayHeight - 250;
  numRows = hei/3; 
  numCols = wid/8;
  newNumRows = numRows;
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  player = minim.loadFile(songFile);
  createGUI();
  customGUI();
}

public void draw(){
  /**
    draw() adds visual elements to the GUI.
  */
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
  
  if(!keyPressed) out.clearSignals();
  
  if(key == 32) {

    for(int x = 0; x <= wid; x += numCols) {
     for (int y = 23; y <= hei; y += newNumRows) {
      if(keyVal >= 200) { fill(random(255),gre,blu); }
        delay(3);
        fill(random(red),random(150),random(blu));
        rect(x, y, numCols, numRows);   
      }
    }
  }
}

public void keyPressed(){  
  /**
    keyPressed() is the main function of the program. 
    It parses keyboard input and displays the visual effects for each key and 
    plays the correct note.
  */
  int keyIndex = -1;
  if( key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  } else if (key == 44) {
    keyIndex = 26;
  } else if (keyCode == 32) {
    keyIndex = 27;
  }
  
  if(PApplet.parseInt(key) == 49) {
    player.pause(); 
    songFile = "heyheyhey.wav";
  }
  if(PApplet.parseInt(key) == 50) {
    player.pause();
    songFile = "SKRILLEX - Scary Monsters And Nice Sprites.mp3";
  }
  if(PApplet.parseInt(key) == 51) {
    player.pause();
    songFile = "8 Bit Weapon - Chip On Your Shoulder.mp3";
  }
  if(PApplet.parseInt(key) == 52) {
    player.pause();
    songFile =  "8 Bit Weapon - Closer (Bitpop Mix).mp3";
  }

  
   if(PApplet.parseInt(key) == 65535) { key = 255; }
   pressed[key] = true;
   
   if(PApplet.parseInt(key) >= 100 && PApplet.parseInt(key) <= 135) {
      keyVal = key + 120;
    }
    else if(PApplet.parseInt(key) < 100) {
      keyVal = key + 50;
    }
    else {
      keyVal = 255;
    }
  
  red = PApplet.parseInt(random(keyVal));
  gre = PApplet.parseInt(random(keyVal));
  blu = PApplet.parseInt(random(keyVal));
  print(PApplet.parseInt(key) + " ");  
  
  for(int x = 0; x <= wid; x += numCols) {
    for (int y = 23; y <= hei; y += newNumRows) {
      if(keyVal >= 200) { fill(random(255),gre,blu); }
      else if(keyVal > 100 && keyVal < 200) { fill(red, random(255), blu); }
      else { fill(red,gre,random(255)); }
      rect(x, y, numCols, newNumRows); 
    }   
  }
  
  fill(0);
  if(pressed[113]) { rect(0 - 5, 23, numCols + 10, newNumRows + 5, 10); }  //q
  if(pressed[119]) { rect(0 + numCols - 5, 23, numCols + 10, newNumRows + 5, 10); }  //w
  if(pressed[101]) { rect(0 + 2 * numCols - 5, 23, numCols + 10, newNumRows + 5, 10); }  //e
  if(pressed[114]) { rect(0 + 3 * numCols - 5, 23, numCols + 10, newNumRows + 5, 10); }  //r
  if(pressed[116]) { rect(0 + 4 * numCols - 5, 23, numCols + 10, newNumRows + 5, 10); }  //t
  if(pressed[121]) { rect(0 + 5 * numCols - 5, 23, numCols + 10, newNumRows + 5, 10); }  //y
  if(pressed[117]) { rect(0 + 6 * numCols - 5, 23, numCols + 10, newNumRows + 5, 10); }  //u
  if(pressed[105]) { rect(0 + 7 * numCols - 5, 23, numCols + 10, newNumRows + 5, 10); }  //i
  
  if(pressed[97]) { rect(0 - 5, 23 + newNumRows - 5, numCols + 10, newNumRows + 10, 10); }  //a
  if(pressed[115]) { rect(0 + numCols - 5, 23 + newNumRows - 5, numCols + 10, newNumRows + 10, 10); }  //s
  if(pressed[100]) { rect(0 + 2 * numCols - 5, 23 + newNumRows - 5, numCols + 10, newNumRows + 10, 10); }  //d
  if(pressed[102]) { rect(0 + 3 * numCols - 5, 23 + newNumRows - 5, numCols + 10, newNumRows + 10, 10); }  //f
  if(pressed[103]) { rect(0 + 4 * numCols - 5, 23 + newNumRows - 5, numCols + 10, newNumRows + 10, 10); }  //g
  if(pressed[104]) { rect(0 + 5 * numCols - 5, 23 + newNumRows - 5, numCols + 10, newNumRows + 10, 10); }  //h
  if(pressed[106]) { rect(0 + 6 * numCols - 5, 23 + newNumRows - 5, numCols + 10, newNumRows + 10, 10); }  //j
  if(pressed[107]) { rect(0 + 7 * numCols - 5, 23 + newNumRows - 5, numCols + 10, newNumRows + 10, 10); }  //k
  
  int doubleNewNumRows = 2 * newNumRows;
  if(pressed[122]) { rect(0 - 5, 23 + doubleNewNumRows - 5, numCols + 10, newNumRows + 5, 10); }  //z
  if(pressed[120]) { rect(0 + numCols - 5, 23 + doubleNewNumRows - 5, numCols + 10, newNumRows + 5, 10); }  //x
  if(pressed[99]) { rect(0 + 2 * numCols - 5, 23 + doubleNewNumRows - 5, numCols + 10, newNumRows + 5, 10); }  //c
  if(pressed[118]) { rect(0 + 3 * numCols - 5, 23 + doubleNewNumRows - 5, numCols + 10, newNumRows + 5, 10); }  //v
  if(pressed[98]) { rect(0 + 4 * numCols - 5, 23 + doubleNewNumRows - 5, numCols + 10, newNumRows + 5, 10); }  //b
  if(pressed[110]) { rect(0 + 5 * numCols - 5, 23 + doubleNewNumRows - 5, numCols + 10, newNumRows + 5, 10); }  //n
  if(pressed[109]) { rect(0 + 6 * numCols - 5, 23 + doubleNewNumRows - 5, numCols + 10, newNumRows + 5, 10); }  //m
  if(pressed[44]) { rect(0 + 7 * numCols - 5, 23 + doubleNewNumRows - 5, numCols + 10, newNumRows + 5, 10); }  //<
  
  
  switch(keyIndex) {
    case 0: a_click1((a), GEvent.CLICKED); 
      triangle = new TriangleWave(523.25f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 1: b_click1((b), GEvent.CLICKED); 
      triangle = new TriangleWave(1567.98f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 2: c_click1((c), GEvent.CLICKED); 
      triangle = new TriangleWave(1318.51f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 3: d_click1((d), GEvent.CLICKED); 
      triangle = new TriangleWave(659.25f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 4: e_click1((e), GEvent.CLICKED); 
      triangle = new TriangleWave(329.63f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 5: f_click1((f), GEvent.CLICKED); 
      triangle = new TriangleWave(698.46f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 6: g_click1((g), GEvent.CLICKED); 
      triangle = new TriangleWave(783.99f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 7: h_click1((h), GEvent.CLICKED); 
      triangle = new TriangleWave(880, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 8: i_click1((i), GEvent.CLICKED); 
      triangle = new TriangleWave(523.25f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 9: j_click1((j), GEvent.CLICKED); 
      triangle = new TriangleWave(987.77f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 10: k_click1((k), GEvent.CLICKED); 
      triangle = new TriangleWave(1046.5f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 12: m_click1((m), GEvent.CLICKED); 
      triangle = new TriangleWave(1975.53f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 13: n_click1((n), GEvent.CLICKED); 
      triangle = new TriangleWave(1760, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 16: q_click1((q), GEvent.CLICKED); 
      triangle = new TriangleWave(261.63f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 17: r_click1((r), GEvent.CLICKED); 
      triangle = new TriangleWave(349.23f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 18: s_click1((s), GEvent.CLICKED); 
      triangle = new TriangleWave(587.33f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 19: t_click1((t), GEvent.CLICKED); 
      triangle = new TriangleWave(392, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 20: u_click1((u), GEvent.CLICKED); 
      triangle = new TriangleWave(493.88f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 21: v_click1((v), GEvent.CLICKED); 
      triangle = new TriangleWave(1396.91f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 22: w_click1((w), GEvent.CLICKED); 
      triangle = new TriangleWave(293.66f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 23: x_click1((x), GEvent.CLICKED); 
      triangle = new TriangleWave(1174.66f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 24: y_click1((y), GEvent.CLICKED); 
      triangle = new TriangleWave(440, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 25: z_click1((z), GEvent.CLICKED); 
      triangle = new TriangleWave(1046.5f, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 26: comma_click1((comma), GEvent.CLICKED); 
      triangle = new TriangleWave(2093, 0.05f, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 27: player = minim.loadFile(songFile);
      player.play();
      break;
      
  }
}

public void keyReleased() {
  if(PApplet.parseInt(key) == 65535) { key = 255; }
  pressed[key] = false;
  for(int x = 0; x <= wid; x += numCols) {
    for (int y = 23; y <= hei; y += newNumRows) {
      if(keyVal >= 200) { fill(random(255),gre,blu); }
      else if(keyVal > 100 && keyVal < 200) { fill(red, random(255), blu); }
      else { fill(red,gre,random(255)); }
      rect(x, y, numCols, newNumRows); 
    }   
  }
    
}

public void stop(){
  out.close();
  minim.stop();
  super.stop();
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}
/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void q_click1(GButton source, GEvent event) { //_CODE_:q:402054:
  println("q - GButton >> GEvent.   " + event + "   " + source + " @ " + millis());
  q.setLocalColorScheme(GCScheme.GOLD_SCHEME);
} //_CODE_:q:402054:

public void w_click1(GButton source, GEvent event) { //_CODE_:w:615646:
  println("w - GButton >> GEvent." + event + " @ " + millis());
  w.setLocalColorScheme(GCScheme.GOLD_SCHEME);
} //_CODE_:w:615646:

public void e_click1(GButton source, GEvent event) { //_CODE_:e:723605:
  println("e - GButton >> GEvent." + event + " @ " + millis());
  e.setLocalColorScheme(GCScheme.GOLD_SCHEME);
} //_CODE_:e:723605:

public void r_click1(GButton source, GEvent event) { //_CODE_:r:394194:
  println("r - GButton >> GEvent." + event + " @ " + millis());
  r.setLocalColorScheme(GCScheme.GOLD_SCHEME);
} //_CODE_:r:394194:

public void slider1_change1(GSlider source, GEvent event) { //_CODE_:slider1:922208:
  println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider1:922208:

public void t_click1(GButton source, GEvent event) { //_CODE_:t:637451:
  println("t - GButton >> GEvent." + event + " @ " + millis());
  t.setLocalColorScheme(GCScheme.GOLD_SCHEME);
} //_CODE_:t:637451:

public void y_click1(GButton source, GEvent event) { //_CODE_:y:808417:
  println("y - GButton >> GEvent." + event + " @ " + millis());
  y.setLocalColorScheme(GCScheme.GOLD_SCHEME);
} //_CODE_:y:808417:

public void u_click1(GButton source, GEvent event) { //_CODE_:u:662089:
  println("u - GButton >> GEvent." + event + " @ " + millis());
  u.setLocalColorScheme(GCScheme.GOLD_SCHEME);
} //_CODE_:u:662089:

public void i_click1(GButton source, GEvent event) { //_CODE_:i:434379:
  println("i - GButton >> GEvent." + event + " @ " + millis());
  i.setLocalColorScheme(GCScheme.GOLD_SCHEME);
} //_CODE_:i:434379:

public void a_click1(GButton source, GEvent event) { //_CODE_:a:818442:
  println("a - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:a:818442:

public void s_click1(GButton source, GEvent event) { //_CODE_:s:228152:
  println("s - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:s:228152:

public void d_click1(GButton source, GEvent event) { //_CODE_:d:654157:
  println("d - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:d:654157:

public void f_click1(GButton source, GEvent event) { //_CODE_:f:684705:
  println("f - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:f:684705:

public void g_click1(GButton source, GEvent event) { //_CODE_:g:267136:
  println("g - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:g:267136:

public void h_click1(GButton source, GEvent event) { //_CODE_:h:414185:
  println("h - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:h:414185:

public void j_click1(GButton source, GEvent event) { //_CODE_:j:419135:
  println("j - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:j:419135:

public void k_click1(GButton source, GEvent event) { //_CODE_:k:856786:
  println("k - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:k:856786:

public void z_click1(GButton source, GEvent event) { //_CODE_:z:599300:
  println("z - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:z:599300:

public void x_click1(GButton source, GEvent event) { //_CODE_:x:921987:
  println("x - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:x:921987:

public void c_click1(GButton source, GEvent event) { //_CODE_:c:270331:
  println("c - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:c:270331:

public void v_click1(GButton source, GEvent event) { //_CODE_:v:607170:
  println("v - GButton >> GEvent." + source + event + " @ " + millis());
} //_CODE_:v:607170:

public void b_click1(GButton source, GEvent event) { //_CODE_:b:837540:
  println("b - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:b:837540:

public void n_click1(GButton source, GEvent event) { //_CODE_:n:719145:
  println("n - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:n:719145:

public void m_click1(GButton source, GEvent event) { //_CODE_:m:831098:
  println("m - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:m:831098:

public void dropList1_click1(GDropList source, GEvent event) { //_CODE_:dropList1:952302:
  println("dropList1 - GDropList >> GEvent." + event + " @ " + millis());
} //_CODE_:dropList1:952302:

public void comma_click1(GButton source, GEvent event) { //_CODE_:comma:386131:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:comma:386131:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.GOLD_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("Sketch Window");
  q = new GButton(this, 50, height - 190, 30, 30);
  q.setText("Q");
  q.setTextBold();
  q.addEventHandler(this, "q_click1");
  w = new GButton(this, 85, height - 190, 30, 30);
  w.setText("W");
  w.setTextBold();
  w.addEventHandler(this, "w_click1");
  e = new GButton(this, 120, height - 190, 30, 30);
  e.setText("E");
  e.setTextBold();
  e.addEventHandler(this, "e_click1");
  r = new GButton(this, 155, height - 190, 30, 30);
  r.setText("R");
  r.setTextBold();
  r.addEventHandler(this, "r_click1");
  slider1 = new GSlider(this, width - 100, height - 200, 100, 20, 10.0f);
  slider1.setRotation(PI/2, GControlMode.CORNER);
  slider1.setLimits(0.5f, 0.0f, 1.0f);
  slider1.setNumberFormat(G4P.DECIMAL, 2);
  slider1.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  slider1.setOpaque(false);
  slider1.addEventHandler(this, "slider1_change1");
  VolumeLabel = new GLabel(this, width - 135, height - 100, 50, 20);
  VolumeLabel.setText("Volume");
  VolumeLabel.setTextBold();
  VolumeLabel.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  VolumeLabel.setOpaque(false);
  t = new GButton(this, 190, height - 190, 30, 30);
  t.setText("T");
  t.setTextBold();
  t.addEventHandler(this, "t_click1");
  y = new GButton(this, 225, height - 190, 30, 30);
  y.setText("Y");
  y.setTextBold();
  y.addEventHandler(this, "y_click1");
  u = new GButton(this, 260, height - 190, 30, 30);
  u.setText("U");
  u.setTextBold();
  u.addEventHandler(this, "u_click1");
  i = new GButton(this, 295, height - 190, 30, 30);
  i.setText("I");
  i.setTextBold();
  i.addEventHandler(this, "i_click1");
  a = new GButton(this, 60, height - 155, 30, 30);
  a.setText("A");
  a.setTextBold();
  a.addEventHandler(this, "a_click1");
  s = new GButton(this, 95, height - 155, 30, 30);
  s.setText("S");
  s.setTextBold();
  s.addEventHandler(this, "s_click1");
  d = new GButton(this, 130, height - 155, 30, 30);
  d.setText("D");
  d.setTextBold();
  d.addEventHandler(this, "d_click1");
  f = new GButton(this, 165, height - 155, 30, 30);
  f.setText("F");
  f.setTextBold();
  f.addEventHandler(this, "f_click1");
  g = new GButton(this, 200, height - 155, 30, 30);
  g.setText("G");
  g.setTextBold();
  g.addEventHandler(this, "g_click1");
  h = new GButton(this, 235, height - 155, 30, 30);
  h.setText("H");
  h.setTextBold();
  h.addEventHandler(this, "h_click1");
  j = new GButton(this, 270, height - 155, 30, 30);
  j.setText("J");
  j.setTextBold();
  j.addEventHandler(this, "j_click1");
  k = new GButton(this, 305, height - 155, 30, 30);
  k.setText("K");
  k.setTextBold();
  k.addEventHandler(this, "k_click1");
  z = new GButton(this, 75, height - 120, 30, 30);
  z.setText("Z");
  z.setTextBold();
  z.addEventHandler(this, "z_click1");
  x = new GButton(this, 110, height - 120, 30, 30);
  x.setText("X");
  x.setTextBold();
  x.addEventHandler(this, "x_click1");
  c = new GButton(this, 145, height - 120, 30, 30);
  c.setText("C");
  c.setTextBold();
  c.addEventHandler(this, "c_click1");
  v = new GButton(this, 180, height - 120, 30, 30);
  v.setText("V");
  v.setTextBold();
  v.addEventHandler(this, "v_click1");
  b = new GButton(this, 215, height - 120, 30, 30);
  b.setText("B");
  b.setTextBold();
  b.addEventHandler(this, "b_click1");
  n = new GButton(this, 250, height - 120, 30, 30);
  n.setText("N");
  n.setTextBold();
  n.addEventHandler(this, "n_click1");
  m = new GButton(this, 285, height - 120, 30, 30);
  m.setText("M");
  m.setTextBold();
  m.addEventHandler(this, "m_click1");
  togGroup1 = new GToggleGroup();
  dropList1 = new GDropList(this, 0, 0, 150, 80, 3);
  dropList1.setItems(loadStrings("list_952302"), 0);
  dropList1.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  dropList1.addEventHandler(this, "dropList1_click1");
  label1 = new GLabel(this, width/2, height - 190, 80, 20);
  label1.setText("Record");
  label1.setTextBold();
  label1.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  label1.setOpaque(false);
  comma = new GButton(this, 320, height - 120, 30, 30);
  comma.setText("<");
  comma.setTextBold();
  comma.addEventHandler(this, "comma_click1");
}

// Variable declarations 
// autogenerated do not edit
GButton q; 
GButton w; 
GButton e; 
GButton r; 
GSlider slider1; 
GLabel VolumeLabel; 
GButton t; 
GButton y; 
GButton u; 
GButton i; 
GButton a; 
GButton s; 
GButton d; 
GButton f; 
GButton g; 
GButton h; 
GButton j; 
GButton k; 
GButton z; 
GButton x; 
GButton c; 
GButton v; 
GButton b; 
GButton n; 
GButton m; 
GToggleGroup togGroup1; 
GDropList dropList1; 
GLabel label1; 
GButton comma; 

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "keyplayer" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
