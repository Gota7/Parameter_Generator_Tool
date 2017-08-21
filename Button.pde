//Class for Buttons on the Top Menu.
class Button {

  //Init
  float x;
  float y;
  float w;
  float h;
  float weight = 0;
  float textSize;
  String text;
  color colors;
  color afterColor = color(100, 100, 100);
  boolean stroke = true;
  
  //Setup
  Button(float x2, float y2, float w2, float h2, String text2, color color2) {
  
    x = x2;
    y = y2;
    w = w2;
    h = h2;
    text = text2;
    colors = color2;
  
  }
  
  
  //Loop
  void draw() {
    
    if (!stroke) {noStroke();} else {stroke(0);}
    fill(colors);
    if (text == GUI.Mode) {fill(afterColor);}
    strokeWeight(weight);
    rect(x, y, w, h);
    textAlign(CENTER);
    fill(0);
    text(text, x+w/2+1, y+h/2+5);
    
    //Test collisions
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed) {
      
      if (GUI.Mode != text) {CPU.resetParameters();}
      GUI.Mode = text;
      
    }
  
  }
  
  
  
  //PageLoop
  void draw4page(int number) {
    
    if (!stroke) {noStroke();} else {stroke(0);}
    fill(colors);
    textSize(12);
    strokeWeight(weight);
    rect(x, y, w, h);
    textAlign(CENTER);
    fill(0);
    text(text, x+w/2+1, y+h/2+5);
    
    //Test collisions
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed) {
      
      GUI.page = number;
      
    }
  
  }



}