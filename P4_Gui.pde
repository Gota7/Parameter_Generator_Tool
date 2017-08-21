//Imports
import javax.swing.JFrame;
import controlP5.*;
import java.util.*;


//Init
GUI GUI = new GUI();
ControlP5 cp5;
CPU CPU;
CheckBox AlwaysOnTop;

//Entrances
int WarpModeID = 0;
int ViewID = 0;
int AreaID = 0;

//Exits

//Views
int ViewModeID = 0;

//PipeExit
CheckBox NoDeathExitPipe;
CheckBox NoDeathExit;
CheckBox Orientation;


//Setup
void setup() {

  size(500, 340);
  surface.setTitle("Parameter Generator Tool");
  cp5 = new ControlP5(this);
  CPU = new CPU();
  surface.setAlwaysOnTop(true);
  
  //Mode List
  List modeList = Arrays.asList("0 - Spawns on ground standing.", "1 - Wingcap Mario for ? Switch only, else falls and takes damage.", "2 - Mario has Wingcap, other characters Spin in with Star wipe.", "3 - Spin in with Circle wipe.", "4 - Fall in, Star Wipe.", "5 - Fall in, Star Wipe. (Duplicate?)", "6 - Fall in, No Wipe.", "7 - Fall in, No Wipe. (Duplicate?)", "8 - Like jumping out of a pit/pipe, but lets you save.", "9 - Like jumping out of a pit/pipe, but lets you save. (Duplicate?)", "10 - Spin in, No Wipe.", "11 - Acts like painting, makes sound, lets you save.", "12 - Acts like painting, makes sound, lets you save. (Duplicate?)", "13 - Jumps with fist in air, like coming out of a pipe.", "14 - Spawns on ground standing (Castle Door Entrance).", "15 - Fall in with Mario Wipe.");
  cp5.addScrollableList("Mode")
     .setPosition(2, 70)
     .setSize(300, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(modeList)
     .setColorBackground(#07b73c)
     .setType(ScrollableList.DROPDOWN)
     .setOpen(false)                      //false for closed
     .hide()
     ;
     
  //ViewID Box
  Numberbox ViewID = cp5.addNumberbox("ViewID")
                   .setSize(50, 20)
                   .setPosition(125, 215)
                   .setValue(0)
                   .setCaptionLabel("")
                   .setMax(15)
                   .setMin(0)
                   .setColorBackground(#ccb712)
                   .hide()
                   ;                  
  makeEditable( ViewID );    
  
  //AreaID Box
  Numberbox AreaID = cp5.addNumberbox("AreaID")
                   .setSize(50, 20)
                   .setPosition(125, 300)
                   .setValue(0)
                   .setCaptionLabel("")
                   .setMax(7)
                   .setMin(0)
                   .setColorBackground(#b51212)
                   .hide()
                   ;                  
  makeEditable( AreaID ); 
  
  //View Mode List
  List ViewModeList = Arrays.asList("0 - ?", "1 - ?", "2 - Standard Camera", "3 - ?", "4 - Rotation Only", "5 - ?", "6 - Translation Only", "7 - Pause Camera (Zooms out when game is paused)", "8 - ?", "9 - ?", "10 - ?", "11 - ?", "12 - ?", "13 - ?", "14 - ?", "15 - ?");
  cp5.addScrollableList("View Mode")
     .setPosition(2, 70)
     .setSize(300, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(ViewModeList)
     .setColorBackground(#d5d813)
     .setType(ScrollableList.DROPDOWN)
     .setOpen(false)                      //false for closed
     .hide()
     ;
     
     
  //TeleportDestID Box
  Numberbox DestinationTeleID = cp5.addNumberbox("DestinationTeleID")
                   .setSize(50, 20)
                   .setPosition(125, 70)
                   .setValue(0)
                   .setCaptionLabel("")
                   .setMax(15)
                   .setMin(0)
                   .setColorBackground(#a0209a)
                   .hide()
                   ;                  
  makeEditable( DestinationTeleID );
  
  
  //CheckBox for PipeExit
  NoDeathExitPipe = cp5.addCheckBox("NoDeathExitPipe")
                .setPosition(20, 70)
                .setSize(20, 20)
                .addItem("0", 0)
                .setCaptionLabel("")
                .hideLabels()
                .setColorBackground(#ff0000)
                .setColorActive(#00ff00)
                .hide()
                ;
                
  //Death Entrance PipeExit
  Numberbox DeathExitPipeID = cp5.addNumberbox("DeathExitPipeID")
                   .setSize(50, 20)
                   .setPosition(5, 95)
                   .setValue(0)
                   .setCaptionLabel("")
                   .setMax(254)
                   .setMin(0)
                   .setColorBackground(#2ba01e)
                   .hide()
                   ;                  
  makeEditable( DeathExitPipeID );
  
  //CheckBox for Exit
  NoDeathExit = cp5.addCheckBox("NoDeathExit")
                .setPosition(20, 70+205)
                .setSize(20, 20)
                .addItem("1", 0)
                .setCaptionLabel("")
                .hideLabels()
                .setColorBackground(#ff0000)
                .setColorActive(#00ff00)
                .hide()
                ;
                
  //Death Entrance Exit
  Numberbox DeathExitID = cp5.addNumberbox("DeathExitID")
                   .setSize(50, 20)
                   .setPosition(5, 95+205)
                   .setValue(0)
                   .setCaptionLabel("")
                   .setMax(254)
                   .setMin(0)
                   .setColorBackground(#2ba01e)
                   .hide()
                   ;                  
  makeEditable( DeathExitID );
  
  //CheckBox for OrientationExit
  Orientation = cp5.addCheckBox("Orientation")
                .setPosition(20, 70)
                .setSize(20, 20)
                .addItem("2", 0)
                .setCaptionLabel("")
                .hideLabels()
                .setColorBackground(#ff0000)
                .setColorActive(#00ff00)
                .hide()
                ;
                
  //Width
  Numberbox Width = cp5.addNumberbox("Width")
                   .setSize(50, 20)
                   .setPosition(40, 168)
                   .setValue(0)
                   .setCaptionLabel("")
                   .setMax(15)
                   .setMin(0)
                   .setColorBackground(#a58109)
                   .hide()
                   ;                  
  makeEditable( Width );
  
  //Height
  Numberbox Height = cp5.addNumberbox("Height")
                   .setSize(50, 20)
                   .setPosition(305-95, 168)
                   .setValue(0)
                   .setCaptionLabel("")
                   .setMax(15)
                   .setMin(0)
                   .setColorBackground(#0a8f93)
                   .hide()
                   ;                  
  makeEditable( Height );
  
  //CheckBox for AlwaysOnTop
  AlwaysOnTop = cp5.addCheckBox("AlwaysOnTop")
                .setPosition(500-195/2-30, 265)
                .setSize(35, 35)
                .addItem("3", 0)
                .setCaptionLabel("")
                .hideLabels()
                .setColorBackground(#00ff00)
                .setColorActive(#ff0000)
                .setValue(100)
                .hide()
                ;
                
                
  String[] CModeList = {"0 - Zoom in when the player thrusts the star in the air.", "1 - Rotate to face FF07 view and zoom out.", "2 - Stand Still.", "3 - Spin around.", "4 - Stand Still. Used for castle and 100 coin stars.", "5 - Zooms in, then spins around crazily.", "6 - Freeze Game.", "7 - Freeze Game.", "8 - Freeze Game.", "9 - Player collects star, but wipe freezes game.", "10 - 0, but without zooming.", "11 - Freezes Game.", "12 - Cuts to FF07 camera???", "13 - Same as 10. (DUPLICATE?)", "14 - Same as 10. (DUPLICATE?)", "15 - Same as 10. (DUPLICATE?)"};
                
  //Camera Mode List
  List C7 = Arrays.asList(CModeList);
  cp5.addScrollableList("Star 7 Camera")
     .setPosition(2, 70+25*7)
     .setSize(300, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(CModeList)
     .setColorBackground(#07b73c)
     .setType(ScrollableList.DROPDOWN)
     .setOpen(false)                      //false for closed
     .hide()
     ;
     
  //Camera Mode List
  List C6 = Arrays.asList(CModeList);
  cp5.addScrollableList("Star 6 Camera")
     .setPosition(2, 70+25*6)
     .setSize(300, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(CModeList)
     .setColorBackground(#07b73c)
     .setType(ScrollableList.DROPDOWN)
     .setOpen(false)                      //false for closed
     .hide()
     ;
     
     
     
  //Camera Mode List
  List C5 = Arrays.asList(CModeList);
  cp5.addScrollableList("Star 5 Camera")
     .setPosition(2, 70+25*5)
     .setSize(300, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(CModeList)
     .setColorBackground(#07b73c)
     .setType(ScrollableList.DROPDOWN)
     .setOpen(false)                      //false for closed
     .hide()
     ;
     
     
     
     
  //Camera Mode List
  List C4 = Arrays.asList(CModeList);
  cp5.addScrollableList("Star 4 Camera")
     .setPosition(2, 70+25*4)
     .setSize(300, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(CModeList)
     .setColorBackground(#07b73c)
     .setType(ScrollableList.DROPDOWN)
     .setOpen(false)                      //false for closed
     .hide()
     ;
     
     
     
  //Camera Mode List
  List C3 = Arrays.asList(CModeList);
  cp5.addScrollableList("Star 3 Camera")
     .setPosition(2, 70+25*3)
     .setSize(300, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(CModeList)
     .setColorBackground(#07b73c)
     .setType(ScrollableList.DROPDOWN)
     .setOpen(false)                      //false for closed
     .hide()
     ;
     
     
     
  //Camera Mode List
  List C2 = Arrays.asList(CModeList);
  cp5.addScrollableList("Star 2 Camera")
     .setPosition(2, 70+25*2)
     .setSize(300, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(CModeList)
     .setColorBackground(#07b73c)
     .setType(ScrollableList.DROPDOWN)
     .setOpen(false)                      //false for closed
     .hide()
     ;
     
     
     
  //Camera Mode List
  List C1 = Arrays.asList(CModeList);
  cp5.addScrollableList("Star 1 Camera")
     .setPosition(2, 70+25*1)
     .setSize(300, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(CModeList)
     .setColorBackground(#07b73c)
     .setType(ScrollableList.DROPDOWN)
     .setOpen(false)                      //false for closed
     .hide()
     ;
     
     
     
     
  //Camera Mode List
  List C0 = Arrays.asList(CModeList);
  cp5.addScrollableList("Star 0 Camera")
     .setPosition(2, 70+25*0)
     .setSize(300, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(CModeList)
     .setColorBackground(#07b73c)
     .setType(ScrollableList.DROPDOWN)
     .setOpen(false)                      //false for closed
     .hide()
     ;

}


//Loop
void draw() {

  background(155);
  GUI.draw();
  //println(GUI.Mode);

}



//Make Text Box Editable
void makeEditable( Numberbox n ) {
  // allows the user to click a numberbox and type in a number which is confirmed with RETURN
  
   
  final NumberboxInput nin = new NumberboxInput( n ); // custom input handler for the numberbox
  
  // control the active-status of the input handler when releasing the mouse button inside 
  // the numberbox. deactivate input handler when mouse leaves.
  n.onClick(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      nin.setActive( true ); 
    }
  }
  ).onLeave(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      nin.setActive( false ); nin.submit();
    }
  });
}


// input handler for a Numberbox that allows the user to 
// key in numbers with the keyboard to change the value of the numberbox

public class NumberboxInput {

  String text = "";

  Numberbox n;

  boolean active;

  
  NumberboxInput(Numberbox theNumberbox) {
    n = theNumberbox;
    registerMethod("keyEvent", this );
  }

  public void keyEvent(KeyEvent k) {
    // only process key event if input is active 
    if (k.getAction()==KeyEvent.PRESS && active) {
      if (k.getKey()=='\n') { // confirm input with enter
        submit();
        return;
      } else if(k.getKeyCode()==BACKSPACE) { 
        text = text.isEmpty() ? "":text.substring(0, text.length()-1);
        //text = ""; // clear all text with backspace
      }
      else if(k.getKey()<255) {
        // check if the input is a valid (decimal) number
        final String regex = "\\d+([.]\\d{0,2})?";
        String s = text + k.getKey();
        if ( java.util.regex.Pattern.matches(regex, s ) ) {
          text += k.getKey();
        }
      }
      n.getValueLabel().setText(this.text);
    }
  }

  public void setActive(boolean b) {
    active = b;
    if(active) {
      n.getValueLabel().setText("");
      text = ""; 
    }
  }
  
  public void submit() {
    if (!text.isEmpty()) {
      n.setValue( float( text ) );
      text = "";
    } 
    else {
      n.getValueLabel().setText(""+n.getValue());
    }
  }
}