import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;
AudioPlayer jingle;
//AudioOutput out;
BeatDetect  beat;









float cs = 3;
color b = color(255, 255, 255, 30);
float t;
Par[][] p = new Par[128][128];
void setup() {
  size(512, 512, P2D);
  background(0);
  fill(0, 0, 0, 20);
  stroke(0);

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

  for (int i = 0; i < p.length*p.length; i++) {
    p[i/p.length][i%p.length] = new Par(i/p.length*4, i%p.length*4);
  }
}
void draw() {
  stroke(0);
  rect(0, 0, width, height);
  stroke(b);

  beat.detect(jingle.mix);

  for (Par[] d : p)for (Par q : d)
    q.update();
  t += 0.01;
}
class Par {
  float x;
  float y;
  float xv;
  float yv;
  float w;
  float ww;
  float gu;
  float hu;
  Par(int x2, int y2) {
    x = random(width);
    y = random(height);
    w = random(1, 2.5);
    ww = random(-2, 2);
    gu = x2;
    hu = y2;
  }
  void update() {
    w = random(1, 2.5);
    ww = random(-2, 2);
    stroke(44*(w+1), 117*(ww+1), 255, 30);
    float m = 30;
    boolean Bass = beat.isRange(0, 2, 2);
    boolean r1 = beat.isRange(3, 5, 1);
    boolean r2 = beat.isRange(6, 8, 1);
    float songSizeX = 250;
    float songSizeY = 250;

    if (Bass) {
      songSizeX = 500;
      songSizeY = 300;
      //b = color(255, 255, 255);
    } else if (r1) {
      songSizeX = 400;
      songSizeY = 200;
    } else if (r2) {
      songSizeX = 272;
      songSizeY = 104;
    }

    float d = dist(x/m, y/m, songSizeX/m, 1.5*songSizeY/m);
    xv += 0.001*(songSizeX-x)*pow(d, ww)*w;
    yv += 0.001*(songSizeY-y)*pow(d, ww)*w;
    float drg = (noise(x/20+492, y/20+490, t*2.2)-0.5)/300 + 1.05;
    xv /= drg;
    yv /= drg;
    xv += noise(x/20, y/20, t)-0.5;
    yv += noise(x/20, y/20+424, t)-0.5;
    x += xv;
    y += yv;
    line(x, y, x-xv/3, y-yv/3);
  }
}

