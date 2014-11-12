// Need G4P library
import g4p_controls.*;

public void setup(){
  size(800, 800, JAVA2D);
  createGUI();
  customGUI();
  // Place your setup code here
  
}

public void draw(){
  //adding GUI graphics
  background(100);
  noStroke();
  //draw gradient for display
  for (int i = 0; i < 10; i++)
  {
    int fivei = i * 5 + 50;
    fill(fivei);
    rect(0, 600 + i, width, 1);
  }
  
  
  int notes_width = 164;
  for (int i = 0; i * notes_width < width; i++) 
  {
    int x = notes_width * i;
    fill(0);
     if ( (x + 45) < width ) { //check if the whole note fits on the page
      //first note
      ellipse(20 + x, 785, 10, 10);
      ellipse(40 + x, 785, 10, 10);
      rect(22 + x, 755, 3, 30);
      rect(22 + x, 755, 20, 3);
      rect(42 + x, 755, 3, 30);
    }
    if ( (x + 71) < width ) { //check if the whole note fits on the page
      //slanted note
      //triangle: (x1, y1, x2, y2, x3, y3)
      ellipse(62 + x, 790, 10, 10);
      triangle(60 + x, 760, 64 + x, 790, 63 + x, 760);
      triangle(64 + x, 790, 67 + x, 790, 63 + x, 760);
      triangle(62 + x, 760, 67 + x, 790, 62 + x, 760);
      triangle(62 + x, 760, 71 + x, 760, 62 + x, 764);
    }
    if ( (x + 116) < width) { //check if the whole note fits on the page
      //slanted double note
      ellipse(84 + x, 778, 10, 10);
      ellipse(107 + x, 782, 10, 10);
      triangle(87 + x, 778, 89 + x, 749, 92 + x, 750);
      triangle(87 + x, 778, 89 + x, 780, 92 + x, 750);
      triangle(89 + x, 749, 114 + x, 753, 113 + x, 756);
      triangle(89 + x, 752, 89 + x, 749, 113 + x, 756);
      triangle(113 + x, 753, 109 + x, 783, 112 + x, 784);
      triangle(113 + x, 753, 116 + x, 754, 112 + x, 784);
    }
    if ( (x + 174) < width ) { //check if the whole not fits on the page
      //triplet
      ellipse(125 + x, 790, 10, 10);
      ellipse(147 + x, 785, 10, 10);
      ellipse(169 + x, 780, 10, 10);
      rect(127 + x, 760, 3, 30);
      rect(149 + x, 755, 3, 30);
      rect(171 + x, 750, 3, 30);
      triangle(127 + x, 757, 127 + x, 760, 174 + x, 750);
      triangle(174 + x, 747, 174 + x, 750, 127 + x, 757);
    }
  }
  
}

void keyPressed(){
  int keyIndex = -1;
  if( key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  switch(keyIndex) {
    case 0: a_click1((a), GEvent.CLICKED); break;
    case 1: b_click1((b), GEvent.CLICKED); break;
    case 2: c_click1((c), GEvent.CLICKED); break;
    case 3: d_click1((d), GEvent.CLICKED); break;
    case 4: e_click1((e), GEvent.CLICKED); break;
    case 5: f_click1((f), GEvent.CLICKED); break;
    case 6: g_click1((g), GEvent.CLICKED); break;
    case 7: h_click1((h), GEvent.CLICKED); break;
    case 8: i_click1((i), GEvent.CLICKED); break;
    case 9: j_click1((j), GEvent.CLICKED); break;
    case 10: k_click1((k), GEvent.CLICKED); break;
    case 11: l_click1((l), GEvent.CLICKED); break;
    case 12: m_click1((m), GEvent.CLICKED); break;
    case 13: n_click1((n), GEvent.CLICKED); break;
    case 14: o_click1((o), GEvent.CLICKED); break; 
    case 15: p_click1((p), GEvent.CLICKED); break;
    case 16: q_click1((q), GEvent.CLICKED); break;
    case 17: r_click1((r), GEvent.CLICKED); break;
    case 18: s_click1((s), GEvent.CLICKED); break;
    case 19: t_click1((t), GEvent.CLICKED); break;
    case 20: u_click1((u), GEvent.CLICKED); break;
    case 21: v_click1((v), GEvent.CLICKED); break;
    case 22: w_click1((w), GEvent.CLICKED); break;
    case 23: x_click1((x), GEvent.CLICKED); break;
    case 24: y_click1((y), GEvent.CLICKED); break;
    case 25: z_click1((z), GEvent.CLICKED); break;
  }
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}
