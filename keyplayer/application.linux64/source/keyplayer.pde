/*!
  KeyPlayer
  @author Michael Bostwick, Carlos Lawrence, Josh Rinaldi, and Jake Traut
  @version 12/07/2014
  @modified 12/07/2014
  */


// Need G4P library
import g4p_controls.*;
import ddf.minim.*;
import ddf.minim.signals.*;
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

void keyPressed(){  
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
  
  if(int(key) == 49) { //!press 1 to load heyheyhey.wav
    player.pause(); 
    songFile = "heyheyhey.wav";
  }
  if(int(key) == 50) { //!press 2 to load Scary Monsters and Nice Sprites.mp3
    player.pause();
    songFile = "SKRILLEX - Scary Monsters And Nice Sprites.mp3";
  }
  if(int(key) == 51) { //!press 3 to load Chip on Your Shoulder.mp3
    player.pause();
    songFile = "8 Bit Weapon - Chip On Your Shoulder.mp3";
  }
  if(int(key) == 52) { //!press 4 to load Closer.mp3
    player.pause();
    songFile =  "8 Bit Weapon - Closer (Bitpop Mix).mp3";
  } //! then press spacebar to play the song\!

  
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
      triangle = new TriangleWave(523.25, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 1: b_click1((b), GEvent.CLICKED); 
      triangle = new TriangleWave(1567.98, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 2: c_click1((c), GEvent.CLICKED); 
      triangle = new TriangleWave(1318.51, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 3: d_click1((d), GEvent.CLICKED); 
      triangle = new TriangleWave(659.25, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 4: e_click1((e), GEvent.CLICKED); 
      triangle = new TriangleWave(329.63, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 5: f_click1((f), GEvent.CLICKED); 
      triangle = new TriangleWave(698.46, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 6: g_click1((g), GEvent.CLICKED); 
      triangle = new TriangleWave(783.99, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 7: h_click1((h), GEvent.CLICKED); 
      triangle = new TriangleWave(880, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 8: i_click1((i), GEvent.CLICKED); 
      triangle = new TriangleWave(523.25, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 9: j_click1((j), GEvent.CLICKED); 
      triangle = new TriangleWave(987.77, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 10: k_click1((k), GEvent.CLICKED); 
      triangle = new TriangleWave(1046.5, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 12: m_click1((m), GEvent.CLICKED); 
      triangle = new TriangleWave(1975.53, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 13: n_click1((n), GEvent.CLICKED); 
      triangle = new TriangleWave(1760, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 16: q_click1((q), GEvent.CLICKED); 
      triangle = new TriangleWave(261.63, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 17: r_click1((r), GEvent.CLICKED); 
      triangle = new TriangleWave(349.23, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 18: s_click1((s), GEvent.CLICKED); 
      triangle = new TriangleWave(587.33, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 19: t_click1((t), GEvent.CLICKED); 
      triangle = new TriangleWave(392, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 20: u_click1((u), GEvent.CLICKED); 
      triangle = new TriangleWave(493.88, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 21: v_click1((v), GEvent.CLICKED); 
      triangle = new TriangleWave(1396.91, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 22: w_click1((w), GEvent.CLICKED); 
      triangle = new TriangleWave(293.66, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 23: x_click1((x), GEvent.CLICKED); 
      triangle = new TriangleWave(1174.66, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 24: y_click1((y), GEvent.CLICKED); 
      triangle = new TriangleWave(440, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 25: z_click1((z), GEvent.CLICKED); 
      triangle = new TriangleWave(1046.5, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 26: comma_click1((comma), GEvent.CLICKED); 
      triangle = new TriangleWave(2093, 0.75, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    case 27: player = minim.loadFile(songFile);
      player.play();
      break;
      
  }
}

void keyReleased() {
  /**
    keyReleased() updates the visualizer on key release.
  */
  if(int(key) == 65535) { key = 255; }
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

void stop(){
  /**
    stop() stops key sounds on key release.
  */
  out.close();
  minim.stop();
  super.stop();
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}
