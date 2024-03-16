import processing.video.*;

Capture video;
PImage bgm;
String[] cameras = Capture.list();
Table table;
float[] columnData;

void setup(){
  //size(600,500);
  bgm = loadImage("TV.png");
  fullScreen();
  video = new Capture(this,1086,533,30);
  
  //camera selection: 
  //video = new Capture(this, cameras[1]);
  
  video.start();
  printArray(Capture.list());
  
  

  

  
}

void captureEvent(Capture video){
  video.read();
}

void draw(){
  if(video.available()){
  captureEvent(video);
  }
background(0);

 image(bgm,0,0);
 image(video,48,500);
 getTableTime();
 getTableName();
 println(mouseX);
 println(mouseY);


}
void keyPressed(){
if(key =='j'){
getTableTime();
  }
}
void getTableTime(){
  table = loadTable("Lasermaze.csv", "header");
  if (table.getRowCount() > 0) { // Check if there is at least 1 row
    for (int i = 0; i < 8; i++) { // Loop through the first 8 rows
      TableRow row = table.getRow(i);
      String value = row.getString(2); // Get the value in the third column
      textSize(50); // Set the text size
      textAlign(LEFT, TOP); // Set the text alignment
      fill(0); // Set the text color to black
      text(value, 1650, 565 + 60 * i); // Display the value on the screen
    }
  }
}
void getTableName(){
  table = loadTable("Lasermaze.csv", "header");
  if (table.getRowCount() > 0) { // Check if there is at least 1 row
    for (int i = 0; i < 8; i++) { // Loop through the first 8 rows
      TableRow row = table.getRow(i);
      String value = row.getString(1); // Get the value in the third column
      textSize(50); // Set the text size
      textAlign(LEFT, TOP); // Set the text alignment
      fill(0); // Set the text color to black
      text(value, 1360, 565 + 60 * i); // Display the value on the screen
    }
  }
}
