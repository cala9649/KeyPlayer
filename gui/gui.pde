/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void slider2d1_change1(GSlider2D source, GEvent event) { //_CODE_:slider2d1:744910:
  println("slider2d1 - GSlider2D >> GEvent." + event + " @ " + millis());
} //_CODE_:slider2d1:744910:

public void q_click1(GButton source, GEvent event) { //_CODE_:q:402054:
  println("q - GButton >> GEvent.   " + event + "   " + source + " @ " + millis());
} //_CODE_:q:402054:

public void w_click1(GButton source, GEvent event) { //_CODE_:w:615646:
  println("w - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:w:615646:

public void e_click1(GButton source, GEvent event) { //_CODE_:e:723605:
  println("e - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:e:723605:

public void r_click1(GButton source, GEvent event) { //_CODE_:r:394194:
  println("r - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:r:394194:

public void slider1_change1(GSlider source, GEvent event) { //_CODE_:slider1:922208:
  println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider1:922208:

public void t_click1(GButton source, GEvent event) { //_CODE_:t:637451:
  println("t - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:t:637451:

public void y_click1(GButton source, GEvent event) { //_CODE_:y:808417:
  println("y - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:y:808417:

public void u_click1(GButton source, GEvent event) { //_CODE_:u:662089:
  println("u - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:u:662089:

public void i_click1(GButton source, GEvent event) { //_CODE_:i:434379:
  println("i - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:i:434379:

public void o_click1(GButton source, GEvent event) { //_CODE_:o:570110:
  println("o - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:o:570110:

public void p_click1(GButton source, GEvent event) { //_CODE_:p:636058:
  println("p - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:p:636058:

public void a_click1(GButton source, GEvent event) { //_CODE_:a:818442:
  println("a - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:a:818442:

public void s_click1(GButton source, GEvent event) { //_CODE_:s:228152:
  println("s - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:s:228152:

public void d_click1(GButton source, GEvent event) { //_CODE_:d:654157:
  println("d - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:d:654157:

public void f_click1(GButton source, GEvent event) { //_CODE_:f:684705:
  println("f - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:f:684705:

public void g_click1(GButton source, GEvent event) { //_CODE_:g:267136:
  println("g - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:g:267136:

public void h_click1(GButton source, GEvent event) { //_CODE_:h:414185:
  println("h - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:h:414185:

public void j_click1(GButton source, GEvent event) { //_CODE_:j:419135:
  println("j - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:j:419135:

public void k_click1(GButton source, GEvent event) { //_CODE_:k:856786:
  println("k - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:k:856786:

public void l_click1(GButton source, GEvent event) { //_CODE_:l:785834:
  println("l - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:l:785834:

public void z_click1(GButton source, GEvent event) { //_CODE_:z:599300:
  println("z - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:z:599300:

public void x_click1(GButton source, GEvent event) { //_CODE_:x:921987:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:x:921987:

public void c_click1(GButton source, GEvent event) { //_CODE_:c:270331:
  println("c - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:c:270331:

public void v_click1(GButton source, GEvent event) { //_CODE_:v:607170:
  println("v - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:v:607170:

public void b_click1(GButton source, GEvent event) { //_CODE_:b:837540:
  println("b - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:b:837540:

public void n_click1(GButton source, GEvent event) { //_CODE_:n:719145:
  println("n - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:n:719145:

public void m_click1(GButton source, GEvent event) { //_CODE_:m:831098:
  println("m - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:m:831098:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("Sketch Window");
  slider2d1 = new GSlider2D(this, 0, 20, 800, 600);
  slider2d1.setLimitsX(0.5, 0.0, 1.0);
  slider2d1.setLimitsY(0.5, 0.0, 1.0);
  slider2d1.setNumberFormat(G4P.DECIMAL, 2);
  slider2d1.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  slider2d1.setOpaque(true);
  slider2d1.addEventHandler(this, "slider2d1_change1");
  q = new GButton(this, 50, 630, 30, 30);
  q.setText("Q");
  q.setTextBold();
  q.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  q.addEventHandler(this, "q_click1");
  w = new GButton(this, 85, 630, 30, 30);
  w.setText("W");
  w.setTextBold();
  w.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  w.addEventHandler(this, "w_click1");
  e = new GButton(this, 120, 630, 30, 30);
  e.setText("E");
  e.setTextBold();
  e.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  e.addEventHandler(this, "e_click1");
  r = new GButton(this, 155, 630, 30, 30);
  r.setText("R");
  r.setTextBold();
  r.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  r.addEventHandler(this, "r_click1");
  slider1 = new GSlider(this, 785, 625, 100, 20, 10.0);
  slider1.setRotation(PI/2, GControlMode.CORNER);
  slider1.setLimits(0.5, 0.0, 1.0);
  slider1.setNumberFormat(G4P.DECIMAL, 2);
  slider1.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  slider1.setOpaque(false);
  slider1.addEventHandler(this, "slider1_change1");
  VolumeLabel = new GLabel(this, 749, 725, 50, 20);
  VolumeLabel.setText("Volume");
  VolumeLabel.setTextBold();
  VolumeLabel.setOpaque(false);
  t = new GButton(this, 190, 630, 30, 30);
  t.setText("T");
  t.setTextBold();
  t.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  t.addEventHandler(this, "t_click1");
  y = new GButton(this, 225, 630, 30, 30);
  y.setText("Y");
  y.setTextBold();
  y.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  y.addEventHandler(this, "y_click1");
  u = new GButton(this, 260, 630, 30, 30);
  u.setText("U");
  u.setTextBold();
  u.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  u.addEventHandler(this, "u_click1");
  i = new GButton(this, 295, 630, 30, 30);
  i.setText("I");
  i.setTextBold();
  i.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  i.addEventHandler(this, "i_click1");
  o = new GButton(this, 330, 630, 30, 30);
  o.setText("O");
  o.setTextBold();
  o.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  o.addEventHandler(this, "o_click1");
  p = new GButton(this, 365, 630, 30, 30);
  p.setText("P");
  p.setTextBold();
  p.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  p.addEventHandler(this, "p_click1");
  a = new GButton(this, 60, 665, 30, 30);
  a.setText("A");
  a.setTextBold();
  a.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  a.addEventHandler(this, "a_click1");
  s = new GButton(this, 95, 665, 30, 30);
  s.setText("S");
  s.setTextBold();
  s.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  s.addEventHandler(this, "s_click1");
  d = new GButton(this, 130, 665, 30, 30);
  d.setText("D");
  d.setTextBold();
  d.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  d.addEventHandler(this, "d_click1");
  f = new GButton(this, 165, 665, 30, 30);
  f.setText("F");
  f.setTextBold();
  f.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  f.addEventHandler(this, "f_click1");
  g = new GButton(this, 200, 665, 30, 30);
  g.setText("G");
  g.setTextBold();
  g.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  g.addEventHandler(this, "g_click1");
  h = new GButton(this, 235, 665, 30, 30);
  h.setText("H");
  h.setTextBold();
  h.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  h.addEventHandler(this, "h_click1");
  j = new GButton(this, 270, 665, 30, 30);
  j.setText("J");
  j.setTextBold();
  j.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  j.addEventHandler(this, "j_click1");
  k = new GButton(this, 305, 665, 30, 30);
  k.setText("K");
  k.setTextBold();
  k.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  k.addEventHandler(this, "k_click1");
  l = new GButton(this, 340, 665, 30, 30);
  l.setText("L");
  l.setTextBold();
  l.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  l.addEventHandler(this, "l_click1");
  z = new GButton(this, 75, 700, 30, 30);
  z.setText("Z");
  z.setTextBold();
  z.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  z.addEventHandler(this, "z_click1");
  x = new GButton(this, 110, 700, 30, 30);
  x.setText("X");
  x.setTextBold();
  x.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  x.addEventHandler(this, "x_click1");
  c = new GButton(this, 145, 700, 30, 30);
  c.setText("C");
  c.setTextBold();
  c.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  c.addEventHandler(this, "c_click1");
  v = new GButton(this, 180, 700, 30, 30);
  v.setText("V");
  v.setTextBold();
  v.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  v.addEventHandler(this, "v_click1");
  b = new GButton(this, 215, 700, 30, 30);
  b.setText("B");
  b.setTextBold();
  b.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  b.addEventHandler(this, "b_click1");
  n = new GButton(this, 250, 700, 30, 30);
  n.setText("N");
  n.setTextBold();
  n.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  n.addEventHandler(this, "n_click1");
  m = new GButton(this, 285, 700, 30, 30);
  m.setText("M");
  m.setTextBold();
  m.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  m.addEventHandler(this, "m_click1");
}

// Variable declarations 
// autogenerated do not edit
GSlider2D slider2d1; 
GButton q; 
GButton w; 
GButton e; 
GButton r; 
GSlider slider1; 
GLabel VolumeLabel; 
GButton t; 
GButton y; 
GButton u; 
GButton i; 
GButton o; 
GButton p; 
GButton a; 
GButton s; 
GButton d; 
GButton f; 
GButton g; 
GButton h; 
GButton j; 
GButton k; 
GButton l; 
GButton z; 
GButton x; 
GButton c; 
GButton v; 
GButton b; 
GButton n; 
GButton m; 

