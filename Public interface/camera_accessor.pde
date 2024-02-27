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
  //video = new Capture(this,1086,533,30);
  
  //camera selection: 
  video = new Capture(this, cameras[1]);
  
  video.start();
  printArray(Capture.list());
  
  

  /*
    table = loadTable("Lasermaze.csv", "header");
  if (table.getRowCount() > 2) { // Check if there are at least 3 rows
    TableRow row = table.getRow(2); // Get the third row (index starts from 0)
    columnData = new float[row.getColumnCount() - 9];
    for (int i = 9; i < row.getColumnCount(); i++) {
      columnData[i - 9] = row.getFloat(i); // get the value in each column starting from 9
    }
    printArray(columnData);
    */
 // }
  
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

void keyPressed() {
  if (key == 'j') {
    printArray(columnData);
  }
}

int findRowIndex(String id) {
  for (int i = 0; i < table.getRowCount(); i++) {
    if (table.getString(i, 0).equals(id)) {
      return i;
    }
  }
  return -1; // return -1 if the id is not found
}
