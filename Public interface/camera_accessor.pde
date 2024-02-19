import processing.video.*;

Capture video;

void setup(){
  size(600,500);
  video = new Capture(this,640,480,30);
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
  
 image(video,0,0);

}
