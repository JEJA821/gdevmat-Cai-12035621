Walker walker; // 定义 Walker 实例

void setup() {
  size(1280, 720); // 设置窗口大小
  background(50);  // 设置背景色
  walker = new Walker(); // 创建 Walker 实例
}

void draw() {
  background(50, 50, 50, 10); // 添加透明背景以保留路径轨迹
  walker.moveAndBounce();     // Walker 移动并弹跳
  walker.display();           // 渲染 Walker
}

class Walker {
  PVector position;  // 位置向量
  PVector velocity;  // 速度向量
  float radius = 10; // Walker 的半径

  Walker() {
    position = new PVector(width / 2, height / 2); // 初始位置在屏幕中心
    velocity = new PVector(random(-5, 5), random(-5, 5)); // 随机速度
  }

  void moveAndBounce() {
    // 更新位置
    position.add(velocity);

    // 检测边界并反弹
    if (position.x - radius < 0 || position.x + radius > width) {
      velocity.x *= -1; // 水平方向反弹
    }
    if (position.y - radius < 0 || position.y + radius > height) {
      velocity.y *= -1; // 垂直方向反弹
    }
  }

  void display() {
    // 绘制 Walker
    noStroke();
    fill(random(255), random(255), random(255), 200); // 随机颜色，透明度为 200
    ellipse(position.x, position.y, radius * 2, radius * 2);
  }
}
