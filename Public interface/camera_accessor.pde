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
  
  

  
table = loadTable("Lasermaze.csv", "header");
if (table.getRowCount() > 0) { // Check if there is at least 1 row
  for (TableRow row : table.rows()) { // Loop through all rows
    println(row.getString(0)); // Get the value in the first column and print it
  }
}
  
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


}



