import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;
AudioPlayer jingle;
//AudioOutput out;
BeatDetect  beat;


void setup() {
  size(600, 600, P3D);
  minim = new Minim(this);
  //out = minim.getLineOut();

  //Music library, comment in the song you want
  //-----Heavier Electronic-----
  jingle = minim.loadFile("FantomenK - Jump Up and Bounce Down.mp3", 1024);
  
  //-----Lighter Electronic-----
  //jingle = minim.loadFile("FantomenK - Slayer waves.mp3", 1024);

  //-----Blues-----
  //jingle = minim.loadFile("JJ Grey & Mofro - 99 Shades Of Crazy.mp3", 1024);

  //-----Rock-----
  //jingle = minim.loadFile("Grand Magus - Valhalla Rising.mp3", 1024);

  jingle.loop();
  beat = new BeatDetect(jingle.bufferSize(), jingle.sampleRate());
}

int x = 300;
int y = 300;

void draw() {
  background(0);

  beat.detect(jingle.mix);

  if (beat.isRange(0, 2, 2)) {
    //Make circle in middle, adjust line starts to edge of circle
    strokeWeight(5);
    stroke(250, 23, 24);
    line(x, y, 400, 450);
    line(x, y, 209, 210);
    line(x, y, 180, 318);
  } else if (beat.isRange(3, 5, 1)) {
    strokeWeight(3);
    stroke(12, 245, 45);
    line(x, y, 480, 218);
  }/* else if (beat.isRange(6, 8, 1)) {
    fill(7, 24, 240);
    rect(410, 400, 190, 200);
  } else if (beat.isRange(9, 11, 1)) {
    fill(37, 120, 35);
    rect(0, 200, 200, 190);
  } else if (beat.isRange(12, 14, 1)) {
    fill(123, 45, 67);
    rect(210, 200, 190, 190);
  } else if (beat.isRange(15, 18, 1)) {
    fill(168, 250, 9);
    rect(410, 200, 200, 190);
  } else if (beat.isRange(19, 21, 1)) {
    fill(93, 23, 100);
    rect(0, 0, 200, 190);
  } else if (beat.isRange(22, 24, 1)) {
    fill(234, 105, 106);
    rect(210, 0, 200, 190);
  } else if (beat.isRange(25, 26, 1)) {
    fill(13, 109, 200);
    rect(410, 0, 200, 200);
  }*/ else
    fill(0, 0, 0);
}

