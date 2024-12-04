Walker walker1; // 第一个Walker实例
Walker walker2; // 第二个Walker实例

void setup() {
  size(800, 600); // 设置窗口大小
  background(50); // 背景色
  walker1 = new Walker(width / 2, height / 2, false); // 调用randomWalk()
  walker2 = new Walker(width / 4, height / 4, true);  // 调用randomWalkBiased()
}

void draw() {
  walker1.walk(); // 执行随机行走
  walker2.walk(); // 执行有偏随机行走
  
  walker1.display(); // 渲染Walker1
  walker2.display(); // 渲染Walker2
}

class Walker {
  float x, y;      // Walker的位置
  boolean biased;  // 是否使用biased walk

  Walker(float startX, float startY, boolean isBiased) {
    x = startX;
    y = startY;
    biased = isBiased;
  }

  void walk() {
    if (biased) {
      randomWalkBiased(); // 调用biased方法
    } else {
      randomWalk(); // 调用普通随机行走
    }
  }

  void randomWalk() {
    // 在8个方向中随机选择一个
    int direction = int(random(8)); // 0到7
    if (direction == 0) x++;        // 右
    else if (direction == 1) x--;   // 左
    else if (direction == 2) y++;   // 下
    else if (direction == 3) y--;   // 上
    else if (direction == 4) { x++; y++; } // 右下
    else if (direction == 5) { x--; y++; } // 左下
    else if (direction == 6) { x++; y--; } // 右上
    else if (direction == 7) { x--; y--; } // 左上
  }

  void randomWalkBiased() {
    // 使用加权概率选择方向
    float rand = random(1); // 生成0到1之间的随机数
    if (rand < 0.4) x++;    // 40%向右
    else if (rand < 0.6) x--; // 20%向左
    else if (rand < 0.8) y++; // 20%向下
    else y--;                // 20%向上
  }

  void display() {
    // 随机颜色，带透明度
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(50, 100); // 透明度从50到100
    fill(r, g, b, a); 
    noStroke();
    ellipse(x, y, 8, 8); // 绘制Walker
  }
}
