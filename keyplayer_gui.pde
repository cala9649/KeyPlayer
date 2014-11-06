// Need G4P library
import g4p_controls.*;

public void setup(){
  size(800, 800, JAVA2D);
  createGUI();
  customGUI();
  // Place your setup code here
  
}

public void draw(){
  background(100);
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
