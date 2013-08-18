import processing.video.*;
import hypermedia.net.*;
import java.io.*;
import javax.imageio.*;

Capture cam;
UDP udp;

PGraphics workspace;
PImage localFrame;
PImage remoteFrame;

int w = 320;
int h = 240;

boolean gettingNewImage = false;

void setup()
{
	size( w * 2, h, P2D );
	background( 0 );
	colorMode(RGB, 255);

	udp = new UDP( this, 6000, "224.0.0.1" );
	udp.listen( true );

	println( "isMulticast? " + udp.isMulticast() );
	println( "isJoined? " + udp.isJoined() );

	localFrame = new PImage( w, h );
	remoteFrame = new PImage( w, h );
	workspace = createGraphics( w, h, P2D );
}

synchronized void keyPressed()
{
	if(key == 'q')
	{
		exit();
	}

	if(key == 'c')
	{
		cam = new Capture( this, w, h, 5 );
	}
}

void sendFrame()
{
	ByteArrayOutputStream baStream	= new ByteArrayOutputStream();
	BufferedOutputStream bos		= new BufferedOutputStream(baStream);
	
	// Load up the pixel array for the local frame
	localFrame.loadPixels();

	// Create BufferedImage so we can use the marvelous JPEG encoder inside ImageIO
	BufferedImage img = new BufferedImage( w, h, BufferedImage.TYPE_INT_RGB );

	// Transfer pixels from localFrame to the BufferedImage
	img.setRGB( 0, 0, w, h, localFrame.pixels, 0, w );
	try
	{
		// Encode the data inside the BufferedImage into JPEG data and store it in the bos (BufferedOutputStream)
		ImageIO.write(img, "jpg", bos);
	}
	catch (IOException ioe)
	{
		println("Write Exception: " + ioe.getMessage());
	}

	// Get the byte array from the output stream
	byte[] packet = baStream.toByteArray();

	// Send JPEG data as a datagram
	println("Sending datagram with " + packet.length + " bytes");
	udp.send( packet );
}

synchronized void captureEvent( Capture c )
{
	if(c.available())
	{
		// Read frame from camera
		c.read();

		// Store it in the localFrame objct
		workspace.set( 0, 0, c );
		localFrame = workspace.get();

		sendFrame();
	}
}

synchronized void draw()
{
	// If we have a localFrame, we should draw it
	if(localFrame != null)
		image( localFrame, 0, 0 );

	// If we are not currently getting a new frame, we wanna show what we have.
	if(!gettingNewImage && remoteFrame != null)
	{
		image( remoteFrame, w, 0 );
	}
}

synchronized void receive( byte[] data )
{
	println("Got datagram with " + data.length + " bytes of data" );

	// Read incoming data into a ByteArrayInputStream
	ByteArrayInputStream bais = new ByteArrayInputStream( data );
	InputStreamReader r = new InputStreamReader(bais);

	gettingNewImage = true;
	// Load up pixel array for remoteFrame
	remoteFrame.loadPixels();
	try
	{
		// Try to build a BufferedImage based on the incoming data (This takes care of makeing JPEG data -> pixel data)
		BufferedImage img = ImageIO.read(bais);
		
		// Move pixel data into the remoteFrame
	    img.getRGB(0, 0, w, h, remoteFrame.pixels, 0, w);
	}
	catch (IOException ioe)
	{
		println("Read Exception: " + ioe.getMessage());
	}
	// Update the remoteFrame with new info
	remoteFrame.updatePixels();
	gettingNewImage = false;
}