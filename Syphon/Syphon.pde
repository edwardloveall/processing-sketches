import javax.media.opengl.*;
import processing.opengl.*;
// Syphon
import jsyphon.*;
JSyphonServer mySyphon;
		
void setup() {
  size(800, 600, OPENGL);
  fill(0, 153);
  noStroke();
  
  mySyphon = new JSyphonServer();
  mySyphon.test();
  mySyphon.initWithName("Syphon - Processing");
}
		
void draw() {
  background(frameCount % 255);
  
  PGraphicsOpenGL pgl = (PGraphicsOpenGL) g;
  GL gl = pgl.beginGL();
  
  int[] texID = new int[1];
  gl.glEnable(gl.GL_TEXTURE_RECTANGLE_EXT);
  gl.glGenTextures(1, texID, 0);
  gl.glBindTexture(gl.GL_TEXTURE_RECTANGLE_EXT, texID[0]);
  gl.glTexImage2D(gl.GL_TEXTURE_RECTANGLE_EXT, 0, gl.GL_RGBA8, width, height, 0, gl.GL_RGBA, gl.GL_UNSIGNED_BYTE, null);  
  gl.glCopyTexSubImage2D(gl.GL_TEXTURE_RECTANGLE_EXT, 0,0, 0, 0, 0, width, height); 
  mySyphon.publishFrameTexture(texID[0], gl.GL_TEXTURE_RECTANGLE_EXT, 0, 0, width, height, width, height, false);
  gl.glDeleteTextures(1, texID, 0);
  gl.glDeleteTextures(1, texID, 0);
  pgl.endGL();
}