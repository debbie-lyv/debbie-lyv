/*
  Debbie Lim
  10/27/22
  Project 1
  Pixel Inspector which loads an image file from the user and inspects
  the colour components of the pixel at the mouse location
*/

import javax.swing.*;

boolean hasFile = false;
PImage myImage;
String fileName;
PFont font;

void setup() {
  size(800, 800);
  
  // displaying dialog box to load file
  final JFileChooser fc = new JFileChooser();
  int returnVal = fc.showOpenDialog(null);
  if (returnVal == JFileChooser.APPROVE_OPTION) {
    File file = fc.getSelectedFile();
    fileName = file.getName();
    if (file.getName().endsWith("jpg") ||
      file.getName().endsWith("gif") ||
      file.getName().endsWith("png") ||
      file.getName().endsWith("JPG") ||
      file.getName().endsWith("GIF") ||
      file.getName().endsWith("PNG")
      ) {
      // load the image using the given file path
      myImage = loadImage(file.getPath());
      }
    hasFile = true;
  } else {
    System.exit(0);
    println("Open command cancelled by user.");
  }
  
  font = createFont("Arial",50);
}

void draw() {
  clear();
  background(225);
  
  // drawing background box and bar chart
  fill(0);  
  rect(420, 420, 350,350,10);  
  stroke(255);
  strokeWeight(5);
  line(480, 450, 480, 720); 
  line(480,720,720,720);
  fill(255);
  text(" red    green   blue", 490,750);
  textSize(30);
    
  // drawing information box
  rect(20,420,380,350,10);
  fill(0);  
  image(myImage, width/2-width/5, 50, 350, 350);
  text("Image filename: \n" + fileName, 50, 480);
  text("Mouse position: (" + mouseX + "," + mouseY +")", 50, 600);
  
  color c = get(mouseX, mouseY);
  float red = red(c);
  float blue = blue(c);
  float green = green(c);
  
  text("RGB value: \n(" + (int) red + "," + (int) green + "," + (int) blue + ")",
    50, 680);
  
  // RGB values in bar chart
  fill(255,0,0);
  rect (500,700, 30, 0-red,2);
  fill(0,255,0);
  rect (575,700, 30, 0-blue,2);
  fill(0,0,255);
  rect (650,700, 30, 0-green,2);  
  }
   
