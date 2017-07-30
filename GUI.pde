//Handle GUI
class GUI {

  //Init
  String Mode = "Exit";
  Button ExitB;
  Button TeleportB;
  Button ViewB;
  Button EntranceB;
  Button PipeExitB;
  
  
  //Setup
  GUI() {
  
    //Set up Buttons.
    ExitB = new Button(5, 5, 55, 30, "Exit", color(255, 0, 0));
    TeleportB = new Button(65, 5, 55, 30, "Teleport", color(255, 122, 0));
    ViewB = new Button(125, 5, 55, 30, "View", color(255, 255, 0));
    EntranceB = new Button(185, 5, 55, 30, "Entrance", color(0, 255, 0));
    PipeExitB = new Button(245, 5, 55, 30, "PipeExit", color(255, 0, 255));
    
        
  }
  
  
  //Loop
  void draw() {
  
    //Lines
    stroke(165);
    strokeWeight(2);
    line(305, 0, 305, 340);
    line(0, 40, 500, 40);
    stroke(0);
    strokeWeight(1);
    
    //Buttons
    ExitB.draw();
    TeleportB.draw();
    ViewB.draw();
    EntranceB.draw();
    PipeExitB.draw();
    
    //Draw CPU
    CPU.draw();
    
    textAlign(CENTER);
    
    //Parameters
    if (CPU.P1) {
      
      fill(10);
      rect(310, 75+0, 185, 20);
      textSize(20);
      text("Parameter 1:", 310+185/2, 66+0);
      textSize(12);
      fill(255);
      text(CPU.P1T, 310+185/2, 75+75*0+20-5);
    
    }
    
    if (CPU.P2) {
      
      fill(10);
      rect(310, 75+75, 185, 20);
      textSize(20);
      text("Parameter 2:", 310+185/2, 66+75);
      textSize(12);
      fill(255);
      text(CPU.P2T, 310+185/2, 75+75*1+20-5);
    
    }
    
    if (CPU.P3) {
      
      fill(10);
      rect(310, 75+75*2, 185, 20);
      textSize(20);
      text("Parameter 3:", 310+185/2, 66+75*2);
      textSize(12);
      fill(255);
      text(CPU.P3T, 310+185/2, 75+75*2+20-5);
    
    }
    
    if (CPU.P4) {
      
      fill(10);
      rect(310, 75+75*3, 185, 20);
      textSize(20);
      text("Parameter 4:", 310+185/2, 66+75*3);
      textSize(12);
      fill(255);
      text(CPU.P4T, 310+185/2, 75+75*3+20-5);
    
    }
    
    //GUIs
    if (this.Mode == "Entrance") {
      this.EntranceGUI();
      cp5.get(ScrollableList.class, "Mode").show();
      cp5.get(Numberbox.class, "ViewID").show();
      cp5.get(Numberbox.class, "AreaID").show();
    } else {
      cp5.get(ScrollableList.class, "Mode").hide();
      cp5.get(Numberbox.class, "ViewID").hide();
      cp5.get(Numberbox.class, "AreaID").hide();
    }
    
    
    if (this.Mode == "Exit") {
      this.ExitGUI();
      cp5.get(CheckBox.class, "NoDeathExit").show();
      cp5.get(Numberbox.class, "DeathExitID").show();
      cp5.get(CheckBox.class, "Orientation").show();
      cp5.get(CheckBox.class, "AlwaysOnTop").show();
      cp5.get(Numberbox.class, "Height").show();
      cp5.get(Numberbox.class, "Width").show();
    } else {
      cp5.get(CheckBox.class, "NoDeathExit").hide();
      cp5.get(Numberbox.class, "DeathExitID").hide();
      cp5.get(CheckBox.class, "Orientation").hide();
      cp5.get(CheckBox.class, "AlwaysOnTop").hide();
      cp5.get(Numberbox.class, "Height").hide();
      cp5.get(Numberbox.class, "Width").hide();
    }
    
    
    if (this.Mode == "View") {
      this.ViewGUI();
      cp5.get(ScrollableList.class, "View Mode").show();
    } else {
      cp5.get(ScrollableList.class, "View Mode").hide();
    }
    
    
    if (this.Mode == "Teleport") {
      this.TeleportGUI();
      cp5.get(Numberbox.class, "DestinationTeleID").show();
    } else {
      cp5.get(Numberbox.class, "DestinationTeleID").hide();
    }
    
    if (this.Mode == "PipeExit") {
      this.PipeExitGUI();
      cp5.get(CheckBox.class, "NoDeathExitPipe").show();
      cp5.get(Numberbox.class, "DeathExitPipeID").show();
    } else {
      cp5.get(CheckBox.class, "NoDeathExitPipe").hide();
      cp5.get(Numberbox.class, "DeathExitPipeID").hide();
    }
    
  }
  
  
  
  //EntranceGUI
  void EntranceGUI() {
  
    
    //println(CPU.P4T);
    
    
    //Mode List
    WarpModeID = int(cp5.get(ScrollableList.class, "Mode").getValue());
    ViewID = int(cp5.get(Numberbox.class, "ViewID").getValue());
    AreaID = int(cp5.get(Numberbox.class, "AreaID").getValue());
    
    CPU.P4T = CPU.data2P4(WarpModeID, ViewID, AreaID);
    //println(CPU.P4T);
    
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Mode:", 152, 63);
    text("ViewID:", 152, 208);
    text("AreaID:", 152, 293);
    textSize(12);
    textAlign(LEFT);
    text("Tip: Blue line points to where\nthe character will face.", 310, 15);
    textAlign(CENTER);
    text("How the character will act when entering level.", 152, 103);
    text("The ViewID of the camera (First on list is 0).", 152, 253);
    textSize(10);
    text("The AreaID of where the character will spawn (Usually 0).", 152, 333);
    textSize(12);
  
  }
  
  
  //Exit GUI
  void ExitGUI() {
    
    //Text
    fill(0);
    textSize(12);
    textAlign(LEFT);
    text("Tip: Use Paintings with same\nsizes to help you place the exit.", 310, 15);
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Death Entrance ID:", 152, 63+205);
    text("Orientation:", 152, 63);
    text("Size:", 152, 158);
    text("Always On Top:", 500-195/2, 250);
    textSize(12);
    textAlign(CENTER);
    text("On death go to last entered level.", 175, 85+205);
    text("Off for like on wall, On for like on floor.", 160, 85);
    text("Width.", 65, 203);
    text("Height.", 305-95+25, 203);
    text("The size of the exit.", 153, 223);
    text("ID of entrance to go to on death.", 175, 85+25+205);
    text("(Usually an entrance that acts like a painting).", 153, 85+25+20+205);
    text("If on, this generator will\nappear over other windows.", 500-195/2, 265+35/2+35);
    textSize(11);
    text("Control whether this is a vertical or horizontal entrance.", 153, 105);
    textSize(9);
    textAlign(RIGHT);
    if (NoDeathExit.getState(0)){text("On", 17, 83+205);} else {text("Off", 17, 83+205);}
    if (Orientation.getState(0)){text("On", 17, 83);} else {text("Off", 17, 83);}
    if (AlwaysOnTop.getState(0)){text("Off", 500-195/2+27, 265+35/2+3);} else {text("On", 500-195/2+27, 265+35/2+3);}
    textSize(12);
    
    
    //AlwaysOnTop
    if (AlwaysOnTop.getState(0)){surface.setAlwaysOnTop(false);} else {surface.setAlwaysOnTop(true);}
    
    
    //P1
    String OrientationString = "0000";
    if (!Orientation.getState(0)) {OrientationString = "0000";} else {OrientationString = "C000";}
    CPU.P1T = OrientationString;
    
    
    //P2
    String EntranceID = "FF";
    
    //println(int(cp5.get(Numberbox.class, "DeathExitID").getValue()));
    
    if (!NoDeathExit.getState(0)) {EntranceID = hex(int(cp5.get(Numberbox.class, "DeathExitID").getValue()), 2);}
    
    //println(EntranceID);
    
    String Width = "0";
    String Height = "0";
    
    Width = hex(int(cp5.get(Numberbox.class, "Width").getValue()), 1);
    Height = hex(int(cp5.get(Numberbox.class, "Height").getValue()), 1);
    
    CPU.P2T = Width+Height+EntranceID;
    
  }
  
  
  //View GUI
  void ViewGUI() {
    
    //Text
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("View Mode:", 152, 63);
    textSize(12);
    textAlign(LEFT);
    text("Tip: Blue line points to where\nthe camera will face.", 310, 15);
    textAlign(CENTER);
    textSize(11);
    text("How the camera/view will act. Mostly used as 2, 7, or 0.", 152, 103);
    textSize(12);
    
    //Calculate View Parameter
    CPU.P1T = CPU.View2Hex(int(cp5.get(ScrollableList.class, "View Mode").getValue()));
    
  }
  
  
  //Teleport GUI
  void TeleportGUI() {
    
    //Text
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Teleport Destination ID:", 152, 63);
    textSize(12);
    textAlign(LEFT);
    text("Tip: Make sure the referenced\ndestination exists!", 310, 15);
    textAlign(CENTER);
    textSize(11);
    text("The ID of the teleport destination.\nFirst destination ID in the list is 0, then goes up.", 152, 103);
    textSize(12);
    
    //Calculate Teleport Parameter
    CPU.P2T = "00"+hex(int(cp5.get(Numberbox.class, "DestinationTeleID").getValue()), 1)+"0";
    
  }
  
  
  //PipeExit GUI
  void PipeExitGUI() {
    
    //Text
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Death Entrance ID:", 152, 63);
    text("Instructions:", 152, 200);
    textSize(12);
    textAlign(LEFT);
    text("Tip: Make sure to fix the Y and\nZ values!", 310, 15);
    textAlign(CENTER);
    text("On death go to last entered level.", 175, 85);
    text("1. Place an exit with the exact coordinates of Pipe.", 152, 225);
    text("2. Add 0.05 to the Y and Z values.", 152, 245);
    text("3. Add the parameters from this tool.", 152, 265);
    text("ID of entrance to go to on death.", 175, 85+25);
    text("(Usually an entrance that acts like a painting).", 153, 85+25+20);
    textSize(9);
    textAlign(RIGHT);
    if (NoDeathExitPipe.getState(0)){text("On", 17, 83);} else {text("Off", 17, 83);}
    textSize(12);
    
    //Set Values
    CPU.P1T = "C000";
    String EntrancePipeID = "FF";
    //println(int(cp5.get(Numberbox.class, "DeathExitPipeID").getValue()));
    if (!NoDeathExitPipe.getState(0)) {EntrancePipeID = hex(int(cp5.get(Numberbox.class, "DeathExitPipeID").getValue()), 2);}
    //println(EntrancePipeID);
    CPU.P2T = "11"+EntrancePipeID;
    
  }
  

}