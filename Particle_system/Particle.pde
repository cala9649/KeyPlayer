// Example 23-4: Super fancy ArrayList and rectangle particle system
float col1 = 10.0;
float col2 = 50.0;
float col3 = 50.0;
float c = cos(0.005);

// A simple Particle Class
class Particle {
  //Having these three lines here gives each new particle a different color 
  /*float col1 = 0.0; //random(limitLow, limitHigh);
   float col2 = 0.0; //random(limitLow, limitHigh);
   float col3 = 0.0; //random(limitLow, limitHigh);
   */

  //col1 = col1 + 10.0;
  //col2 = col2 + 10.0;
  //col3 = col3 + 10.0;

  float x;
  float y;
  float xspeed;
  float yspeed;
  float theta = 1;
  float life;

  // Make the Particle
  Particle(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    //xspeed = random(-0.2, 0.2);
    //yspeed = random(-0.2, 0.2);
    xspeed = 0.01;
    yspeed = 0.01;
    life = 255;
  }

  // Move
  void run() {
    x = x + xspeed;
    y = y + yspeed;
    //translate(width, height);
    //Maybe here instead of seconds, do something if beat is intense enough
    //if (second() % 5 ==0)
    //  rotate(c);

    //theta += 0.05;
    yspeed += 0.021;
    xspeed -= 0.05;
  }

  // Fall down
  void gravity() {
    yspeed += 0.1;
  }

  // Stop moving
  void stop() {
    xspeed = 0;
    yspeed = 0;
  }

  // Ready for deletion
  boolean finished() {
    // The Particle has a "life" variable which decreases.
    // When it reaches 0 the Particle can be removed from the ArrayList.
    life -= 2.0; 
    if (life < 0) return true;
    else return false;
  }

  // Show
  void display() {
    // Life is used to fade out the particle as well

    //Adding in the next three lines gives you epilepsy mode
    /*
    float col1 = random(255);
     float col2 = random(255);
     float col3 = random(255);
     */
    stroke(0, life);
    //fill(175,life);
    fill(col1, col2, col3);
    rect(x, y, 10, 10);
  }
}

