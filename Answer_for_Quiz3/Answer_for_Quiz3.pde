int frameCount = 0;  // Frame counter

void setup() {
size(800, 600);  // Set the window size
background(50);  // Set the background color to gray
}

void draw() {
// Create a paint splatter circle
paintSplatter();

// Refresh the screen every 300 frames
frameCount++;
if (frameCount >= 300) {
background(50);  // Clear the screen
frameCount = 0;  // Reset the frame count
}
}

void paintSplatter() {
// x coordinate: Gaussian distribution
float meanX = width / 2;           // Mean: center of the screen
float stdDevX = width / 8;         // Standard deviation
float x = (float) (randomGaussian() * stdDevX + meanX);

// y coordinates: random
float y = random(0, height);  // Generated randomly from the top to the bottom of the screen

// Random size (Gaussian distribution)
float meanSize = 20;        // Average size of the circle
float stdDevSize = 5;       // Standard deviation of circle size
float size = (float) (randomGaussian() * stdDevSize + meanSize);
size = constrain(size, 5, 50);  // Make sure the size is within a reasonable range

// Random color
float r = random(0, 255);
float g = random(0, 255);
float b = random(0, 255);
float alpha = random(10, 100);  // Transparency range 10 to 100

// Draw a circle
noStroke();
fill(r, g, b, alpha);
ellipse(x, y, size, size);
}
