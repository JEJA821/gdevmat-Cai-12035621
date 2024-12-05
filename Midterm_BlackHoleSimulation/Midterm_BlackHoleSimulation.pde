PVector blackHole;  // Black hole location
float blackHoleSize = 50;  // Black hole size
int resetFrames = 600;  // Reset every n frames
int frameCounter = 0;  // Frame counter

Walker[] matter;  // Object array
int matterCount = 100;  // Number of objects

void setup() {
size(800, 600);  // Set the canvas size
background(0);  // Black background
matter = new Walker[matterCount];  // Initializes the object array

// Initialize the black hole
spawnBlackHole();

// Initialize the object
for (int i = 0;  i < matter.length;  i++) {
matter[i] = new Walker();
}
}

void draw() {
background(0);  // Clear screen per frame

// Bonus: Black hole follows mouse
blackHole.set(mouseX, mouseY);  // Set the black hole position to the mouse position

// Draw black holes
fill(255);
noStroke();
ellipse(blackHole.x, blackHole.y, blackHoleSize, blackHoleSize);

// Draw and move objects
for (Walker w : matter) {
w.moveTowards(blackHole);  // The object moves towards the black hole
w.display();  // Show the object
}

// Reset the logic
frameCounter++;
if (frameCounter >= resetFrames) {
spawnBlackHole();  // Reset the black hole
for (int i = 0;  i < matter.length;  i++) {
matter[i] = new Walker();  // Reset the object
}
frameCounter = 0;  // Reset the frame count
}
}

void spawnBlackHole() {
blackHole = new PVector(random(width), random(height));  // Randomly generate black hole locations
}

// Walker class
class Walker {
PVector position;  // Location
float size;  // Size
int r, g, b;  // Color

Walker() {
// Use Gaussian distribution to generate position
float meanX = width / 2;
float meanY = height / 2;
float stdDevX = width / 4;
float stdDevY = height / 4;
position = new PVector(
constrain((float) randomGaussian() * stdDevX + meanX, 0, width),
constrain((float) randomGaussian() * stdDevY + meanY, 0, height)
);

// Random size and color
size = random(5, 20);
r = (int) random(255);
g = (int) random(255);
b = (int) random(255);
}

void moveTowards(PVector target) {
// Calculate the direction vector
PVector direction = PVector.sub(target, position);  // Static method, do not change the original location
direction.normalize();  // Normalized direction vector
direction.mult(2);  // Set the movement speed
position.add(direction);  // Update location
}

void display() {
fill(r, g, b);
noStroke();
ellipse(position.x, position.y, size, size);  // Draw objects
}
}
