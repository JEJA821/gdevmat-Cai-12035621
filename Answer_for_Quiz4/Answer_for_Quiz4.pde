Walker walker;

void setup() {
size(800, 600);  // Canvas size
background(50);  // Background color
walker = new Walker();  // Create a Walker instance
}

void draw() {
walker.walk();     // Walker moves
walker.display();  // Walker render
}

class Walker {
float x, y;          // Walker's position
float tX, tY;        // Perlin time variable is used for location
float tSize;         // Perlin time variable is used for size
float tR, tG, tB;    // Perlin time variable is used for color

Walker() {
x = width / 2;     // Initial x coordinates
y = height / 2;    // Initial y coordinate
tX = random(100);  // Initialize the Perlin time variable randomly
tY = random(100);
tSize = random(100);
tR = random(100);
tG = random(100);
tB = random(100);
}

void walk() {
// Update location with Perlin noise
x = map(noise(tX), 0, 1, 0, width);
y = map(noise(tY), 0, 1, 0, height);
tX += 0.01; // Add the time variable
tY += 0.01;
}

void display() {
// Use Perlin noise to update the size
float size = map(noise(tSize), 0, 1, 5, 150);
tSize += 0.01;

// Use Perlin noise to update colors
float r = map(noise(tR), 0, 1, 0, 255);
float g = map(noise(tG), 0, 1, 0, 255);
float b = map(noise(tB), 0, 1, 0, 255);
tR += 0.01; // Add color time variable
tG += 0.01;
tB += 0.01;

// Draw Walker
noStroke();
fill(r, g, b, 200);  // alpha is set to 200
ellipse(x, y, size, size);
}
}
