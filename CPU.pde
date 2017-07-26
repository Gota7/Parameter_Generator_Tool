//Perform Calculations and hold parameter data.
class CPU {

  
  //Init
  boolean P1;
  boolean P2;
  boolean P3;
  boolean P4;
  
  String P1T = "0000";
  String P2T = "0000";
  String P3T = "0000";
  String P4T = "0000";
  
  
  //Setup
  CPU() {}
  
  
  //Loop
  void draw() {
    
    //Test Mode
    this.testMode();
    
  }
  
  
  //Test For Mode.
  void testMode() {
  
    if (GUI.Mode.equals("Exit")) {P1 = true; P2 = true; P3 = false; P4 = false;}
    if (GUI.Mode.equals("PipeExit")) {P1 = true; P2 = true; P3 = false; P4 = false;}
    if (GUI.Mode.equals("View")) {P1 = true; P2 = true; P3 = true; P4 = false;}
    if (GUI.Mode.equals("Teleport")) {P1 = true; P2 = true; P3 = false; P4 = false;}
    if (GUI.Mode.equals("Entrance")) {P1 = true; P2 = true; P3 = true; P4 = true;}
  
  }
  
  //Reset Parameters
  void resetParameters() {
  
    P1T = "0000";
    P2T = "0000";
    P3T = "0000";
    P4T = "0000";
  
  }
  
  
  //Generate P4 Warps
  String data2P4(int mode, int view, int area) {
    
    String modeBinary = binary(mode, 9);
    String viewBinary = binary(view, 4);
    String areaBinary = binary(area, 3);
    
    String finalBinary = modeBinary + viewBinary + areaBinary;
    
    //println(areaBinary, " A");
   // println(finalBinary, " F");
    
    String finalHex = hex(unbinary(finalBinary));
    
    //println(unbinary(finalBinary), " U");
    //println(finalHex, " H");
    
    
    //Trim Final output
    String tempList[] = split(finalHex, "0000");
    finalHex = tempList[1];
    
    //println(finalHex);
    
    if (finalHex.equals("")) {return "0000";} else {return finalHex;}
  
  }
  
  //View Mode to Hex
  String View2Hex(int i) {
  
    return "FF0"+hex(i, 1);
  
  }


}