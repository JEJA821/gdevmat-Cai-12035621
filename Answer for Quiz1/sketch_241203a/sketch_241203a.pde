float amplitude = 50;   // Amplitude
float frequency = 0.1; // Frequency
float offset = 0;       // Offset

void setup() {
size(800, 600);  // Window size
background(50);  // Background color
}

void draw() {
background(50);  // Clear screen per frame
drawAxes();      // Draw the coordinate system
drawQuadratic(); // Draw a quadratic function
drawLinear();    // Draw a linear function
drawSineWave();  // Draw the sine wave
updateSineWave();  // Dynamic update sine wave
}

void drawAxes() {
stroke(255);
line(width / 2, 0, width / 2, height);  // Y-axis
line(0, height / 2, width, height / 2);  // x axis
}

void drawQuadratic() {
stroke(255, 255, 0);
noFill();
beginShape();
for (float x = -width / 2;  x < width / 2;  x += 1) {
float y = x * x - 15 * x - 3;
vertex(width / 2 + x, height / 2 - y);
}
endShape();
}

void drawLinear() {
stroke(128, 0, 128);
noFill();
beginShape();
for (float x = -width / 2;  x < width / 2;  x += 1) {
float y = -5 * x + 30;
vertex(width / 2 + x, height / 2 - y);
}
endShape();
}

void drawSineWave() {
stroke(0, 0, 255);
noFill();
beginShape();
for (float x = -width / 2;  x < width / 2;  x += 1) {
float y = amplitude * sin(frequency * x + offset);
vertex(width / 2 + x, height / 2 - y);
}
endShape();
}

void updateSineWave() {
offset += 0.1; // Dynamic movement
}

void keyPressed() {
if (key == 'w') amplitude += 10;
if (key == 's') amplitude -= 10;
if (key == 'd') frequency += 0.01;
if (key == 'a') frequency -= 0.01;
}
