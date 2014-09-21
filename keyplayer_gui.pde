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
  if(keyIndex == 0){
    a_click1((a), GEvent.CLICKED);
  } else if (keyIndex == 1){
    b_click1((b), GEvent.CLICKED);
  }
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}
