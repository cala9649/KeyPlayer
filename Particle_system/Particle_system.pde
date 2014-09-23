// Example 23-4: Super fancy ArrayList and rectangle particle system
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

  translate(width/2, height/2);
  rotate(millis() * 0.00001 * TWO_PI);
  //translate(width/2, height/2);
  //translate(width/16, height/16);

  //Incriments the color each time draw is called
  col1 = col1 + x1;
  col2 = col2 + x2;
  col3 = col3 + x3;

  //Reverses the change of color if r, g, or b gets to 255 or 0
  if (col1 < 10 || col1 > 255)
    x1 *= -1;
  if (col2 < 50 || col2 > 255)
    x2 *= -1;
  if (col3 < 50 || col3 > 255)
    x3 *= -1;


  //Makes the spawn point move
  xp += step;
  //rotate(0.2);


  // Add a new particle at mouse location
  particles.add(new Particle(xp, yp));


  // Loop through all Particles
  for (int i = particles.size () - 1; i >= 0; i-- ) {
    Particle p = (Particle) particles.get(i);
    p.run();
    //p.gravity();
    translate(0, 5);
    rotate(0.5);
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

