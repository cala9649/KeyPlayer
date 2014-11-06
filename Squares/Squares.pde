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
  //jingle = minim.loadFile("FantomenK - Jump Up and Bounce Down.mp3", 1024);

  //-----Lighter Electronic-----
  //jingle = minim.loadFile("FantomenK - Slayer waves.mp3", 1024);

  //-----Blues-----
  //jingle = minim.loadFile("JJ Grey & Mofro - 99 Shades Of Crazy.mp3", 1024);

  //-----Rock-----
  jingle = minim.loadFile("Grand Magus - Valhalla Rising.mp3", 1024);

  jingle.loop();
  beat = new BeatDetect(jingle.bufferSize(), jingle.sampleRate());
}

void draw() {
  background(0);

  beat.detect(jingle.mix);
/*
  fill(255, 255, 255);
  rect(0, 400, 200, 200);
  fill(255, 255, 255);
  rect(210, 400, 190, 200);
  fill(255, 255, 255);
  rect(410, 400, 190, 200);
  fill(255, 255, 255);
  rect(0, 200, 200, 190);
  fill(255, 255, 255);
  rect(210, 200, 190, 190);
  fill(255, 255, 255);
  rect(410, 200, 200, 190);
  fill(255, 255, 255);
  rect(0, 0, 200, 190);
  fill(255, 255, 255);
  rect(210, 0, 190, 190);
  fill(255, 255, 255);
  rect(410, 0, 190, 190);*/

  if (beat.isRange(0, 2, 2)) {
    fill(250, 23, 24);
    rect(0, 400, 200, 200);
  } else if (beat.isRange(3, 5, 1)) {
    fill(12, 245, 45);
    rect(210, 400, 190, 200);
  } else if (beat.isRange(6, 8, 1)) {
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
    rect(210, 0, 190, 190);
  } else if (beat.isRange(25, 26, 1)) {
    fill(13, 109, 200);
    rect(410, 0, 190, 200);
  }
}

