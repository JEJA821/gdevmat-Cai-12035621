int frameCount = 0; // 帧计数器

void setup() {
  size(800, 600); // 设置窗口大小
  background(50); // 背景颜色设置为灰色
}

void draw() {
  // 生成一个油漆飞溅的圆
  paintSplatter();

  // 每300帧刷新屏幕
  frameCount++;
  if (frameCount >= 300) {
    background(50); // 清屏
    frameCount = 0; // 重置帧计数
  }
}

void paintSplatter() {
  // x 坐标：高斯分布
  float meanX = width / 2;          // 均值：屏幕中心
  float stdDevX = width / 8;        // 标准差
  float x = (float) (randomGaussian() * stdDevX + meanX);
  
  // y 坐标：随机
  float y = random(0, height); // 从屏幕顶部到底部随机生成

  // 随机大小（高斯分布）
  float meanSize = 20;       // 圆的平均大小
  float stdDevSize = 5;      // 圆大小的标准差
  float size = (float) (randomGaussian() * stdDevSize + meanSize);
  size = constrain(size, 5, 50); // 确保大小在合理范围内

  // 随机颜色
  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  float alpha = random(10, 100); // 透明度范围10到100

  // 绘制圆
  noStroke();
  fill(r, g, b, alpha);
  ellipse(x, y, size, size);
}
