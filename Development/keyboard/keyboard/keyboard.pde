//this is the keyboard using frequencies

import ddf.minim.*;
import ddf.minim.signals.*;
<<<<<<< HEAD
=======
AudioPlayer player;
>>>>>>> GUI

Minim        minim;
AudioOutput  out;
TriangleWave triangle;

void setup(){
  size(400, 400);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  //triangle = new TriangleWave(440, 1, out.sampleRate());
}

void draw(){
  background(0);
  //out.addSignal(triangle);
  if(!keyPressed) out.clearSignals();
}

void keyPressed(){
<<<<<<< HEAD
=======
  if (keyCode == 32){
    player = minim.loadFile("heyheyhey.wav");
    player.play();
  }
      
>>>>>>> GUI
  switch (key){
   case '1':
      triangle = new TriangleWave(130.81, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    
    case '2':
      triangle = new TriangleWave(146.83, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    
    case '3':
      triangle = new TriangleWave(164.81, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    
    case '4':
      triangle = new TriangleWave(174.61, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    
    case '5':
      triangle = new TriangleWave(196, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    
    case '6':
      triangle = new TriangleWave(220, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    
    case '7':
      triangle = new TriangleWave(246.94, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case '8':
      triangle = new TriangleWave(261.63, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'q':
      triangle = new TriangleWave(261.63, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'w':
      triangle = new TriangleWave(293.66, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'e':
      triangle = new TriangleWave(329.63, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
  
    case 'r':
      triangle = new TriangleWave(349.23, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 't':
      triangle = new TriangleWave(392, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'y':
      triangle = new TriangleWave(440, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'u':
      triangle = new TriangleWave(493.88, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'i':
      triangle = new TriangleWave(523.25, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'a':
      triangle = new TriangleWave(523.25, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 's':
      triangle = new TriangleWave(587.33, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'd':
      triangle = new TriangleWave(659.25, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
     
    case 'f':
      triangle = new TriangleWave(698.46, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;   
      
    case 'g':
      triangle = new TriangleWave(783.99, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'h':
      triangle = new TriangleWave(880, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'j':
      triangle = new TriangleWave(987.77, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'k':
      triangle = new TriangleWave(1046.5, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
    
    case 'z':
      triangle = new TriangleWave(1046.5, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'x':
      triangle = new TriangleWave(1174.66, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'c':
      triangle = new TriangleWave(1318.51, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'v':
      triangle = new TriangleWave(1396.91, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'b':
      triangle = new TriangleWave(1567.98, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'n':
      triangle = new TriangleWave(1760, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case 'm':
      triangle = new TriangleWave(1975.53, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
      
    case ',':
      triangle = new TriangleWave(2093, 0.05, out.sampleRate());
      out.addSignal(triangle);
      triangle.portamento(30);
      break;
  }
}

void stop(){
  out.close();
  minim.stop();
  super.stop();
}
