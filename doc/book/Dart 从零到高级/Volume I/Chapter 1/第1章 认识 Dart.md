## **第1章 认识 Dart**

------

### **1.1 Dart 的历史与发展**

Dart 由 Google 于 2011 年首次发布，最初的目标是成为一种现代化、可替代 JavaScript 的语言，主要面向 Web 应用开发。
 然而，随着生态和需求的变化，Dart 的发展路线也发生了调整：它逐渐定位为一种 **跨平台、现代化的通用编程语言**。

**关键转折点：2017 年 Flutter 的出现**。
 随着 Flutter 的兴起，Dart 成为其核心语言，迅速在全球开发者中普及。如今 Dart 已广泛用于移动端、Web、桌面、服务端甚至 IoT 等领域。

------

### **1.2 Dart 与 Flutter 的关系**

Flutter 是 Google 推出的 UI 框架，其目标是通过一套代码实现多平台应用，而 Dart 则是驱动 Flutter 的编程语言。

Dart 被选中的原因：

- **热重载（Hot Reload）**：极大提升开发效率
- **强大的异步模型**：基于 Future 和 Stream，适合事件驱动 UI
- **AOT 编译**：带来接近原生的性能
- **JIT 编译**：支持快速迭代开发

因此，Dart 是 Flutter 能够「高性能 + 高效率」的关键所在。

------

### **1.3 Dart 的应用场景**

除了 Flutter，Dart 还可以应用在多个领域：

- **移动应用开发**（iOS/Android）
- **Web 应用开发**（通过 dart2js 转译或 WebAssembly）
- **服务端开发**（如 `shelf` 框架实现 REST API / WebSocket）
- **桌面应用**（Windows/macOS/Linux）
- **命令行工具**（CLI 工具开发）
- **FFI 跨语言调用**（C/C++/Rust 集成）

Dart 正逐渐成为一种 **全栈跨平台语言**。

------

### **1.4 开发环境的搭建**

学习 Dart 有多种方式：

1. **安装 Dart SDK**
   - 支持 Windows/macOS/Linux
   - 通过 `dart --version` 查看版本
2. **DartPad 在线环境**
   - 无需安装即可运行代码
   - 地址：https://dartpad.dev
3. **IDE 支持**
   - VS Code + Dart/Flutter 插件
   - IntelliJ IDEA / Android Studio
4. **通过 Flutter SDK**
   - Flutter SDK 内置 Dart SDK，可直接使用

------

### **1.5 第一个程序：Hello World**

示例：

```
void main() {
  print('Hello, World!');
}
```

**说明**：

- `main()` 是 Dart 程序的入口函数。
- `print()` 用于向控制台输出字符串。

运行：

```
dart run hello.dart
```

输出：

```
Hello, World!
```

------

✅ **小结**
 本章介绍了 Dart 的背景、Flutter 的关系、应用场景，以及环境搭建和第一个程序。接下来将进入 **基本语法** 的学习。