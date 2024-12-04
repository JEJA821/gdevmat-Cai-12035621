float x, y;              // Current location of Walker
float tx, ty;            // Perlin time variable (for x and y)
float tThiccness;        // Perlin time variable (for thickness)
float tR, tG, tB;        // Perlin time variable (for RGB)

void setup() {
size(800, 600);        // Window size
background(50);        // Set a grey background
x = width / 2;         // Walker initial position (center of screen)
y = height / 2;
tx = random(1000);     // Initializes the Perlin time variable
ty = random(1000);
tThiccness = random(1000);
tR = random(1000);
tG = random(1000);
tB = random(1000);
}

void draw() {
// Update x and y coordinates with Perlin Noise
x += map(noise(tx), 0, 1, -5, 5);
y += map(noise(ty), 0, 1, -5, 5);

// Update the Perlin time variable
tx += 0.01;
ty += 0.01;

// thiccness
float thiccness = map(noise(tThiccness), 0, 1, 5, 150);
tThiccness += 0.01;

// Dynamically adjust RGB colors
float r = map(noise(tR), 0, 1, 0, 255);
float g = map(noise(tG), 0, 1, 0, 255);
float b = 255;  // Keep the blue channel as default
tR += 0.01;
tG += 0.01;

// Set the color and draw Walker
fill(r, g, b, 100);     // Translucent color
noStroke();
ellipse(x, y, thiccness, thiccness);  // Draw Walker
}
