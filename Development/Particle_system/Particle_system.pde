// Example 23-4: Super fancy ArrayList and rectangle particle system
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer jingle;
BeatDetect  beat;
//FFT         fft;


int xp = 0;
int yp = 0;
int step = 1;
float x1 = 0.19;
float x2 = 0.26;
float x3 = 0.284;


// Declaring a global variable of type ArrayList
ArrayList particles;

// A "Rectangle" will suck up particles
//import java.awt.Rectangle;
//Rectangle blackhole;

void setup() {
  size(600, 600);
  minim = new Minim(this);

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
  //blackhole = new Rectangle(50, 150, 100, 25);
  particles = new ArrayList();
  smooth();
}

void draw() {
  background(0);

  // Displaying the Rectangle
  //stroke(0);
  //fill(175);
  //rect(blackhole.x, blackhole.y, blackhole.width, blackhole.height);

  beat.detect(jingle.mix);

  translate(width/2, height/2);
  //rotate(millis() * 0.00001 * TWO_PI);
  //translate(width/2, height/2);
  //translate(width/16, height/16);

  //Incriments the color each time draw is called
  /*col1 = col1 + x1;
   col2 = col2 + x2;
   col3 = col3 + x3;*/

  /*if (beat.isKick()) {
   rotate(millis() * 0.00002 * TWO_PI);
   col1 = 150;
   col2 = 45;
   col3 = 209;
   } else if (beat.isSnare()) {
   rotate(millis() * 0.00003 * TWO_PI);
   col1 = 250;
   col2 = 209;
   col3 = 13;
   } else if (beat.isHat()) {
   rotate(millis() * 0.00004 * TWO_PI);
   col1 = 10;
   col2 = 90;
   col3 = 78;
   } else {
   //rotate(millis() * 0.00001 * TWO_PI);
   col1 = 50;
   col2 = 100;
   col3 = 145;
   }*/

  if (beat.isRange(0, 2, 2)) {
    //Red
    //Bass/Drum kick
    rotate(millis() * 0.0001 * TWO_PI);
    //col1 = 235;
    //col2 = 5;
    //col3 = 9;
    col1 = 217;
    col2 = 15;
    col3 = 25;
  } else if (beat.isRange(3, 7, 1)) {
    //Orange
    rotate(second() * 0.00001 * TWO_PI);
    //col1 = 240;
    //col2 = 157;
    //col3 = 2;
    col1 = 141;
    col2 = 237;
    col3 = 81;
  }/* else if (beat.isRange(8, 11, 1)) {
   //Yellow
   rotate(second() * 0.00003 * TWO_PI);
   col1 = 240;
   col2 = 249;
   col3 = 2;
   } else if (beat.isRange(12, 15, 1)) {
   //Green
   rotate(second() * 0.00004 * TWO_PI);
   col1 = 30;
   col2 = 186;
   col3 = 66;
   } else if (beat.isRange(16, 19, 1)) {
   //Blue
   rotate(second() * 0.00005 * TWO_PI);
   col1 = 63;
   col2 = 56;
   col3 = 245;
   }*/
  else if (beat.isRange(22, 26, 1)) {
    //Indigo
    rotate(second() * 0.00006 * TWO_PI);
    col1 = 153;
    col2 = 0;
    col3 = 255;
  } else {
    //Violet
    rotate(millis() * 0.00001 * TWO_PI);
    //col1 = 177;
    //col2 = 31;
    //col3 = 215;
    col1 = 17;
    col2 = 118;
    col3 = 250;
  }

  //Reverses the change of color if r, g, or b gets to 255 or 0
  if (col1 < 10 || col1 > 255)
    x1 *= -1;
  if (col2 < 50 || col2 > 255)
    x2 *= -1;
  if (col3 < 50 || col3 > 255)
    x3 *= -1;


  //Makes the spawn point move
  //xp += step;
  //rotate(0.2);


  // Add a new particle at mouse location
  particles.add(new Particle(xp, yp));


  // Loop through all Particles
  for (int i = particles.size () - 1; i >= 0; i-- ) {
    Particle p = (Particle) particles.get(i);
    p.run();
    if (beat.isRange(0, 2, 2)) {
      Particle g = (Particle) particles.get(i);
      g.run();
    } else if (beat.isRange(22, 26, 2)) {
      Particle d = (Particle) particles.get(i);
      d.run();
    }
    //p.gravity();
    //translate(0, 5);
    rotate(0.2);

    //Confirmed cool shapes
    //Spiral inwards, comment out 'xp += step;' above for this to work
    ////rotate(0.2);
    //Flower-ish
    ////rotate(1.5);
    //Circle-ish
    ////rotate(1.7);
    //Atom-ish
    ////rotate(1.8);
    //Moving triangle
    ////rotate(2.0);
    p.display();

    if (xp > width/2 - 10)
    {
      xp = width/2 - 10;
      step = -1;
    }

    if (xp < 0)
    {
      xp = 0;
      step = 1;
    }


    // If the Rectangle contains the location of the Particle, stop the Particle from moving.
    //if (blackhole.contains(p.x, p.y)) { 
    //  p.stop();
    //}



    // If the particle is no longer needed, it is deleted from the list
    if (p.finished()) {
      particles.remove(i);
    }
  }
}

