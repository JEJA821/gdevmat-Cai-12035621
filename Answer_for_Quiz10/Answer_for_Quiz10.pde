Walker[] walkers;  // Walker array
int walkerCount = 10;  // Number of walkers
Liquid liquid;  // Liquid object

void setup() {
size(800, 600);  // Set the canvas size
walkers = new Walker[walkerCount];
liquid = new Liquid(0, height / 2, width, height / 2, 0.1f); // Liquid initialization

// Initializes Walker
for (int i = 0;  i < walkerCount;  i++) {
float mass = random(1, 5);  // Random mass
float posX = (width/walkerCount) * (i + 0.5f); // Equidistant distribution
float posY = random(-20, 20);  // The initial position is near the top of the screen
walkers[i] = new Walker(mass, posX, posY);
}
}

void draw() {
background(30);

// Draw the liquid
liquid.display();

// Update each Walker
for (Walker w : walkers) {
// Applied wind power
PVector wind = new PVector(0.1f, 0);
w.applyForce(wind);

// Applied gravity (scaled by mass)
PVector gravity = new PVector(0, -0.15f * w.mass);
w.applyForce(gravity);

// Check and apply drag force
if (liquid.contains(w)) {
PVector drag = liquid.calculateDrag(w);
w.applyForce(drag);
}

w.update();
w.display();
w.checkEdges();
}
}

void mousePressed() {
// Reset all Walker and liquids
for (int i = 0;  i < walkerCount;  i++) {
float mass = random(1, 5);  // Random mass
float posX = (width/walkerCount) * (i + 0.5f); // Equidistant distribution
float posY = random(-20, 20);  // The initial position is near the top of the screen
walkers[i] = new Walker(mass, posX, posY);
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
this.velocity = new PVector(random(1, 3), random(1, 3));  // Initial speed
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
if (position.y > height) {
position.y = height;  // Prevent going beyond the bottom
velocity.y *= -0.5; // Elastic rebound effect
}
}
}

class Liquid {
float x, y, w, h;  // Rectangular area of liquid
float c;  // Drag coefficient

Liquid(float x, float y, float w, float h, float c) {
this.x = x;
this.y = y;
this.w = w;
this.h = h;
this.c = c;
}

void display() {
noStroke();
fill(0, 0, 255, 100);  // Translucent blue
rect(x, y, w, h);
}

boolean contains(Walker walker) {
// Check to see if Walker is entering liquid
return walker.position.x > x && walker.position.x < x + w &&
walker.position.y > y && walker.position.y < y + h;
}

PVector calculateDrag(Walker walker) {
// Calculate the drag force
float speed = walker.velocity.mag();  // Speed size
float dragMagnitude = c * speed * speed;  // Size of drag force
PVector drag = walker.velocity.copy();  // Direction is opposite to speed
drag.mult(-1);
drag.normalize();
drag.mult(dragMagnitude);
return drag;
}
}
