Walker[] walkers;  // Walker array
int walkerCount = 8;  // Number of walkers

PVector acceleration = new PVector(0.2f, 0); // Acceleration
float frictionCoefficientStart = 0.01f; // Initial friction coefficient
float frictionCoefficientMiddle = 0.4f; // Friction coefficient after midpoint

void setup() {
size(800, 600);  // Set the window size
walkers = new Walker[walkerCount];

// Initializes Walker
for (int i = 0;  i < walkerCount;  i++) {
float mass = i + 1;  // The quality increases
float posY = (height/walkerCount) * (i + 0.5f); // Calculate the vertical position, evenly distributed
walkers[i] = new Walker(mass, posY);
}
}

void draw() {
background(30);  // Background color

// Update and draw each Walker
for (Walker w : walkers) {
// Application acceleration (bonus: adjusted by mass)
PVector adjustedAcceleration = PVector.mult(acceleration, w.mass);
w.applyForce(adjustedAcceleration);

// Apply friction
float frictionCoefficient = (w.position.x > width / 2) ?  frictionCoefficientMiddle : frictionCoefficientStart;
w.applyFriction(frictionCoefficient);

w.update();
w.display();
w.checkEdges();
}
}

void mousePressed() {
// Reset all walkers
for (int i = 0;  i < walkerCount;  i++) {
float mass = i + 1;
float posY = (height/walkerCount) * (i + 0.5f);
walkers[i] = new Walker(mass, posY);
}
}

class Walker {
PVector position;  // Location
PVector velocity;  // Speed
PVector acceleration;  // Acceleration
float mass;  // Quality
float size;  // Size
int r, g, b;  // Color

Walker(float mass, float posY) {
this.mass = mass;
this.size = mass * 10;  // Adjust the size ratio
this.position = new PVector(-size, posY);  // The initial position is on the left side of the screen
this.velocity = new PVector(0, 0);
this.acceleration = new PVector(0, 0);

// Random color
this.r = (int) random(255);
this.g = (int) random(255);
this.b = (int) random(255);
}

void applyForce(PVector force) {
PVector f = PVector.div(force, mass);  // Acceleration is calculated based on mass
acceleration.add(f);
}

void applyFriction(float coefficient) {
if (velocity.mag() > 0) {// Apply friction only when moving
PVector friction = velocity.copy();
friction.normalize();
friction.mult(-1 * coefficient);
applyForce(friction);
}
}

void update() {
velocity.add(acceleration);  // Update speed
position.add(velocity);      // Update location
acceleration.mult(0);        // Reset acceleration per frame
}

void display() {
noStroke();
fill(r, g, b);
ellipse(position.x, position.y, size, size);
}

void checkEdges() {
if (position.x > width) position.x = -size;  // Pass through the right side of the screen and reappear from the left
}
}
