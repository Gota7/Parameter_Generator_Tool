//Imports
import javax.swing.JFrame;
import controlP5.*;
import java.util.*;


//Init
GUI GUI = new GUI();
ControlP5 cp5;
CPU CPU;

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
  
  //Mode List
  List modeList = Arrays.asList("0 - Normal", "1 - Wingcap", "2 - Fall In", "3 - Fall In (Duplicate?)", "4 - Normal?", "5 - Spin In (Like Start of Level)", "6 - Like 4, but shorter distance travelled", "7 - ?", "8 - ?", "9 - ?", "10 - ?", "11 - Like coming out of level painting, lets you save", "12 - ?", "13 - Used for Tiny Huge Island pipes (Pipe entrance?)", "14 - Used for \"Castle - 1st floor\" front door entrances", "15 - ?");
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