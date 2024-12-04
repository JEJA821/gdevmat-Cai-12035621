PVector start;  // Starting point of the lightsaber
PVector end;    // The end of the lightsaber
float handleLength = 100;  // Length of handle
float saberLength = 200;   // Length of each side of the lightsaber

void setup() {
size(800, 600);  // Set the canvas size
start = new PVector(width / 2, height / 2);  // The starting point of the lightsaber is in the center of the canvas
end = new PVector(start.x + saberLength, start.y);  // End on the right side of the lightsaber
noCursor();  // Hide the mouse
}

void draw() {
background(30);  // Background color

// Dynamically update the end position
PVector mousePos = new PVector(mouseX, mouseY);
PVector dir = PVector.sub(mousePos, start);  // Direction vector from the starting point to the mouse
dir.normalize();  // Normalize the direction vector
dir.mult(saberLength);  // Set the length of the lightsaber
end = PVector.add(start, dir);  // Update the lightsaber finish position

// Draw the lightsaber
drawLightsaber(start, end);

// Print the length of one side of the lightsaber
println("LightSaber Magnitude: " + saberLength);
}

void drawLightsaber(PVector start, PVector end) {
// 1. Draw the red outer halo
stroke(255, 0, 0, 100);  // Red, transparency 100
strokeWeight(20);        // Set the line width to 20
line(start.x, start.y, end.x, end.y);  // Draw right side of lightsaber
line(start.x, start.y, 2 * start.x - end.x, 2 * start.y - end.y);  // Left symmetrical lightsaber

// 2. Draw the white inner beam
stroke(255, 255, 255, 200);  // White, transparency 200
strokeWeight(10);            // Set the line width to 10
line(start.x, start.y, end.x, end.y);  // Draw right side of lightsaber
line(start.x, start.y, 2 * start.x - end.x, 2 * start.y - end.y);  // Left symmetrical lightsaber

// 3. Draw the black handle
stroke(0);         // Black
strokeWeight(15);  // Set the line width to 15
line(start.x - handleLength / 2, start.y, start.x + handleLength / 2, start.y);  // Draw the handle
}
