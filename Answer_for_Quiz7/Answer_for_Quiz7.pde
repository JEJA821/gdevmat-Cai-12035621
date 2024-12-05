Walker[] walkers;  // Walker array
int walkerCount = 100;  // Number of walkers

void setup() {
size(800, 600);  // Set the canvas size
walkers = new Walker[walkerCount];  // Initializes the Walker array

// Initializes each Walker
for (int i = 0;  i < walkers.length;  i++) {
walkers[i] = new Walker();
}
}

void draw() {
background(30);  // Background color

// Update and display each Walker
for (Walker w : walkers) {
w.accelerateTowards(mouseX, mouseY);  // Speed up to point the mouse
w.update();  // Update location and speed
w.display();  // Walker is displayed
}
}

class Walker {
PVector position;     // Walker position
PVector velocity;     // Walker Speed
PVector acceleration;  // Walker acceleration
float size;           // Walker size

Walker() {
// Randomly initialize the position, speed, and size
position = new PVector(random(width), random(height));
velocity = new PVector(random(-2, 2), random(-2, 2));
acceleration = new PVector(0, 0);  // The initial acceleration is 0
size = random(5, 15);  // Random size
}

void accelerateTowards(float targetX, float targetY) {
// Calculate the direction vector to the target
PVector target = new PVector(targetX, targetY);
PVector direction = PVector.sub(target, position);  // Direction = Target position - current position
direction.normalize();  // Normalized direction vector
direction.mult(0.2); // Scale to acceleration size
acceleration = direction;  // Update the acceleration
}

void update() {
velocity.add(acceleration);  // Cumulative acceleration to velocity
position.add(velocity);      // Add speed to position

// Limit the speed size to avoid excessive speed
velocity.limit(5);

// Boundary detection: If the canvas boundary is exceeded, it appears from the other side
if (position.x < 0) position.x = width;
if (position.x > width) position.x = 0;
if (position.y < 0) position.y = height;
if (position.y > height) position.y = 0;
}

void display() {
noStroke();
fill(255, 150);  // Translucent white
ellipse(position.x, position.y, size, size);  // Draw Walker
}
}
