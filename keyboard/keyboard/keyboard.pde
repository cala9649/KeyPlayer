//this is the keyboard using frequencies

import ddf.minim.*;
import ddf.minim.signals.*;

Minim        minim;
AudioOutput  out;
SineWave     sine;

void setup(){
  size(400, 400);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  //sine = new SineWave(440, 1, out.sampleRate());
}

void draw(){
  background(0);
  //out.addSignal(sine);
  if(!keyPressed) out.clearSignals();
}

void keyPressed(){
  switch (key){
    case '1':
      sine = new SineWave(130.81, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
    
    case '2':
      sine = new SineWave(146.83, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
    
    case '3':
      sine = new SineWave(164.81, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
    
    case '4':
      sine = new SineWave(174.61, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
    
    case '5':
      sine = new SineWave(196, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
    
    case '6':
      sine = new SineWave(220, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
    
    case '7':
      sine = new SineWave(246.94, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'q':
      sine = new SineWave(261.63, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'w':
      sine = new SineWave(293.66, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'e':
      sine = new SineWave(329.63, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
  
    case 'r':
      sine = new SineWave(349.23, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 't':
      sine = new SineWave(392, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'y':
      sine = new SineWave(440, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'u':
      sine = new SineWave(493.88, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'a':
      sine = new SineWave(523.25, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 's':
      sine = new SineWave(587.33, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'd':
      sine = new SineWave(659.25, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'f':
      sine = new SineWave(698.46, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;  
    
    case 'g':
      sine = new SineWave(783.99, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'h':
      sine = new SineWave(880, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'j':
      sine = new SineWave(987.77, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'z':
      sine = new SineWave(1046.5, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'x':
      sine = new SineWave(1174.66, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'c':
      sine = new SineWave(1318.51, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'v':
      sine = new SineWave(1396.91, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'b':
      sine = new SineWave(1567.98, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'n':
      sine = new SineWave(1760, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case 'm':
      sine = new SineWave(1975.53, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
      
    case ',':
      sine = new SineWave(2093, 0.05, out.sampleRate());
      out.addSignal(sine);
      sine.portamento(30);
      break;
  }
}

void stop(){
  out.close();
  minim.stop();
  super.stop();
}
