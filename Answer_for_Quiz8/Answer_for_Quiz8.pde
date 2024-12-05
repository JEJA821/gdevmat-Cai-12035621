Walker[] walkers;
int walkerCount = 10;

PVector gravity = new PVector(0, 0.4); // Downward gravity
PVector wind = new PVector(0.15, 0); // Wind to the right

void setup() {
size(800, 600);
walkers = new Walker[walkerCount];

for (int i = 0;  i < walkers.length;  i++) {
float mass = i + 1;
walkers[i] = new Walker(mass);
}
}

void draw() {
background(30);

for (Walker w : walkers) {
w.applyForce(gravity);
w.applyForce(wind);
w.update();
w.display();
w.checkEdges();
}
}

class Walker {
PVector position;
PVector velocity;
PVector acceleration;
float mass;
float size;
int r, g, b;

Walker(float mass) {
this.mass = mass;
this.size = mass * 15;
position = new PVector(random(width), random(height));  // Initialize within the canvas scope
velocity = new PVector(0, 0);
acceleration = new PVector(0, 0);

r = (int) random(255);
g = (int) random(255);
b = (int) random(255);
}

void applyForce(PVector force) {
PVector f = PVector.div(force, mass);
acceleration.add(f);
}

void update() {
velocity.add(acceleration);
position.add(velocity);
acceleration.mult(0);
}

void display() {
noStroke();
fill(r, g, b, 200);
ellipse(position.x, position.y, size, size);
}

void checkEdges() {
if (position.x > width || position.x < 0) velocity.x *= -1;
if (position.y > height || position.y < 0) velocity.y *= -1;
}
}
