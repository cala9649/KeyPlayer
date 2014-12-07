/**
 * This sketch demonstrates how to use an FFT to analyze
 * the audio being generated by an AudioPlayer.
 * <p>
 * FFT stands for Fast Fourier Transform, which is a 
 * method of analyzing audio that allows you to visualize 
 * the frequency content of a signal. You've seen 
 * visualizations like this before in music players 
 * and car stereos.
 * <p>
 * For more information about Minim and additional features, 
 * visit http://code.compartmental.net/minim/
 */

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer jingle;
BeatDetect  beat;
FFT         fft;

void setup()
{
  size(924, 400, P3D);

  minim = new Minim(this);

  // specify that we want the audio buffers of the AudioPlayer
  // to be 1024 samples long because our FFT needs to have 
  // a power-of-two buffer size and this is a good size.
  //jingle = minim.loadFile("FantomenK - Jump Up and Bounce Down.mp3", 2048);
  jingle = minim.loadFile("FantomenK - Slayer waves.mp3", 2048);

  // loop the file indefinitely
  jingle.loop();

  // create an FFT object that has a time-domain buffer 
  // the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be half as large.
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );
  beat = new BeatDetect(jingle.bufferSize(), jingle.sampleRate());
}

float col1 = random(0, 100);
float col2 = random(0, 100);
float col3 = random(0, 100);

void draw()
{
  background(0);
  //stroke(255*(random(1)*fft.getBand(i)));

  // perform a forward FFT on the samples in jingle's mix buffer,
  // which contains the mix of both the left and right channels of the file
  beat.detect(jingle.mix);
  fft.forward( jingle.mix );
  for (int i = 0; i < fft.specSize (); i++)
  {
    //col1 = col1 + 0.29;
    //col2 = col2 + 0.14;
    //col3 = col3 + 0.33;
    // draw the line for frequency band i, scaling it up a bit so we can see it
    //fill(20, 150, 105);
    strokeWeight(5);
    /*
    if (beat.isRange(0, 10, 1)) {
     stroke(240, 48, 83);
     } else if (beat.isRange(11, 20, 1)) {
     stroke(48, 240, 182);
     } else if (beat.isRange(21, 26, 1)) {
     stroke(82, 21, 214);
     } else {
     stroke(245, 237, 24);
     }
     */


    if (beat.isKick()) {
      stroke(102, 57, i);
    } else if (beat.isSnare()) {
      stroke(48, 203, i);
    } else if (beat.isHat()) {
      stroke(82, 21, i);
    } else {
      stroke(random(25, i), random(30, i), i);
    }

    line( i, height, i, height - fft.getBand(i)*15);

    /*
    if (i<26) {
     if (beat.isOnset(i))
     stroke(240, 48, 83);
     else
     stroke(6, 209, 47);
     } //else
     //stroke(45, 36, 107);
     */
  }
}
