Walker[] walkers;  // Walker array
int walkerCount = 10;  // Number of walkers
float G = 0.4f; // Gravitational constant

void setup() {
size(800, 600);  // Set the canvas size
walkers = new Walker[walkerCount];

// Initializes Walker
for (int i = 0;  i < walkerCount;  i++) {
float mass = random(1, 5);  // Random mass
float posX = random(width);  // Random horizontal position
float posY = random(height);  // Random vertical position
walkers[i] = new Walker(mass, posX, posY);
}
}

void draw() {
background(30);

// Calculate and apply gravity
for (int i = 0;  i < walkers.length;  i++) {
for (int j = 0;  j < walkers.length;  j++) {
if (i != j) {
PVector force = walkers[j].calculateAttraction(walkers[i]);
walkers[i].applyForce(force);
}
}
}

// Update and display each Walker
for (Walker w : walkers) {
w.update();
w.display();
w.checkEdges();
}
}

class Walker {
PVector position;  // Location
PVector velocity;  // Speed
PVector acceleration;  // Acceleration
float mass;  // Quality
float size;  // Size
int r, g, b;  // Color

Walker(float mass, float x, float y) {
this.mass = mass;
this.size = mass * 15;  // Scale by mass
this.position = new PVector(x, y);
this.velocity = new PVector(random(-1, 1), random(-1, 1));  // Random initial speed
this.acceleration = new PVector(0, 0);

// Random color
this.r = (int) random(255);
this.g = (int) random(255);
this.b = (int) random(255);
}

PVector calculateAttraction(Walker other) {
PVector force = PVector.sub(other.position, this.position);  // Calculate the direction vector
float distance = constrain(force.mag(), 5, 25);  // Limit the distance to avoid getting too close or too far
force.normalize();  // Normalized direction vector

// Calculate the gravity
float strength = (G * this.mass * other.mass) / (distance * distance);
force.mult(strength);  // Scale by gravity
return force;
}

void applyForce(PVector force) {
PVector f = PVector.div(force, mass);  // Calculate the acceleration
acceleration.add(f);
}

void update() {
velocity.add(acceleration);
position.add(velocity);
acceleration.mult(0);  // Reset acceleration per frame
}

void display() {
noStroke();
fill(r, g, b);
ellipse(position.x, position.y, size, size);
}

void checkEdges() {
// Boundary detection, which crosses the boundary and appears from the other side
if (position.x > width) position.x = 0;
if (position.x < 0) position.x = width;
if (position.y > height) position.y = 0;
if (position.y < 0) position.y = height;
}
}
