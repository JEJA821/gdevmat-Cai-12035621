Walker walker1;  // First Walker instance
Walker walker2;  // Second Walker instance

void setup() {
size(800, 600);  // Set the window size
background(50);  // Background color
walker1 = new Walker(width / 2, height / 2, false);  // Call randomWalk()
walker2 = new Walker(width / 4, height / 4, true);   // Call randomWalkBiased()
}

void draw() {
walker1.walk();  // Perform a random walk
walker2.walk();  // Perform biased random walk

walker1.display();  // Render Walker1
walker2.display();  // Render Walker2
}

class Walker {
float x, y;       // Walker's position
boolean biased;   // Whether to use biased walk

Walker(float startX, float startY, boolean isBiased) {
x = startX;
y = startY;
biased = isBiased;
}

void walk() {
if (biased) {
randomWalkBiased();  // Call the biased method
} else {
randomWalk();  // Call a normal random walk
}
}

void randomWalk() {
// Choose one of the 8 directions at random
int direction = int(random(8));  // 0 to 7
if (direction == 0) x++;         // Right
else if (direction == 1) x--;    // Left
else if (direction == 2) y++;    // down
else if (direction == 3) y--;    // up
else if (direction == 4) { x++;  y++;  } // Lower right
else if (direction == 5) { x--;  y++;  } // Lower left
else if (direction == 6) { x++;  y--;  } // Top right
else if (direction == 7) { x--;  y--;  } // Top left
}

void randomWalkBiased() {
// Use weighted probability to select the direction
float rand = random(1);  // Generate a random number between 0 and 1
if (rand < 0.4) x++; // 40% to the right
else if (rand < 0.6) x--; // 20% left
else if (rand < 0.8) y++; // 20% down
else y--;                 // 20% up
}

void display() {
// Random color with transparency
float r = random(255);
float g = random(255);
float b = random(255);
float a = random(50, 100);  // Transparency from 50 to 100
fill(r, g, b, a);
noStroke();
ellipse(x, y, 8, 8);  // Draw Walker
}
}
