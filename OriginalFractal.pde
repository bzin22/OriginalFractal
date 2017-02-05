// AP Computer Science Spring 2017
// Bryan Zin 
// Julia Set derived from shell code of the Mandelbrot Set
// Credit for the original Mandelbrot Shell goes to Daniel Shiffman on Github

public void setup()
{  
  size(700, 700);
  background(0);
}

public void draw()
{
    // It all starts with the width, try higher or lower values
    float changeConstantA = map(mouseX, 0, width, -1,1);
    float changeConstantB = map(mouseY, 0, height, -1, 1);

    float w = 4;
    float h = (w * height) / width;

    // Start at negative half the width and height
    float xmin = -w/2;
    float ymin = -h/2;

    // Make sure we can write to the pixels[] array.
    // Only need to do this once since we don't do any other drawing.
    loadPixels();

    // Maximum number of iterations for each point on the complex plane
    int maxiterations = 100;

    // x goes from xmin to xmax
    float xmax = xmin + w;
    // y goes from ymin to ymax
    float ymax = ymin + h;

    // Calculate amount we increment x,y for each pixel
    float dx = (xmax - xmin) / (width);
    float dy = (ymax - ymin) / (height);

    // Start y
    float y = ymin;
    for (int j = 0; j < height; j++) {
      // Start x
      float x = xmin;
      for (int i = 0; i < width; i++) {

        // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
        float a = x;
        float b = y;
        int n = 0;
        while (n < maxiterations) {
          float aa = a * a; // a^2
          float bb = b * b; // b^2
          // Infinty in our finite world is simple, let's just consider it 16
          if (dist(aa, bb, 0, 0) > 4.0) {
            break;  // Bail
          }
          float twoab = 2.0 * a * b; // 2ab
          a = aa - bb + changeConstantA; // a^2 - b^2 +c
          b = twoab + changeConstantB; // 2ab + c
          n++;
        }

        // We color each pixel based on how long it takes to get to infinity
        // If we never got there, let's pick the color black
        if (n == maxiterations) {
          pixels[i+j*width] = color(0);
        } else {
          // Gosh, we could make fancy colors here if we wanted
          float norm = map(n, 0, maxiterations, 0, 1);
          pixels[i+j*width] = color(map(sqrt(norm), 0, 1, 0, 255));
        }
        x += dx;
      }
      y += dy;
    }

    updatePixels();
    println(frameRate);
}
