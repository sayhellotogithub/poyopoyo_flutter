## **Chapter 1: Getting to Know Dart**

------

### **1.1 History and Evolution of Dart**

Dart was first released by Google in 2011. Its initial ambition was to serve as a modern alternative to JavaScript, primarily targeting web applications.
 Over time, Dart evolved into a **modern, general-purpose, cross-platform language** rather than just a browser language.

**Turning point: The rise of Flutter in 2017.**
 With Flutter’s popularity, Dart became its core language and quickly gained worldwide adoption. Today, Dart is widely used in mobile, web, desktop, server-side, and even IoT development.

------

### **1.2 Relationship between Dart and Flutter**

Flutter is Google’s UI framework designed for cross-platform development, and Dart is the language that powers it.

Why Dart was chosen for Flutter:

- **Hot Reload**: dramatically improves developer productivity
- **Strong asynchronous model**: Futures and Streams are well-suited for UI programming
- **Ahead-of-Time (AOT) compilation**: delivers near-native performance
- **Just-in-Time (JIT) compilation**: enables fast iteration during development

In short, Dart is the engine that makes Flutter both high-performance and developer-friendly.

------

### **1.3 Use Cases of Dart**

Beyond Flutter, Dart is versatile enough for many domains:

- **Mobile app development** (iOS/Android)
- **Web applications** (via dart2js or WebAssembly)
- **Server-side development** (REST APIs / WebSockets with `shelf`)
- **Desktop applications** (Windows, macOS, Linux)
- **Command-line tools** (CLI utilities)
- **FFI integrations** (interfacing with C/C++/Rust)

Dart is positioning itself as a **full-stack, cross-platform language**.

------

### **1.4 Setting Up the Environment**

There are several ways to start with Dart:

1. **Install the Dart SDK**
   - Available for Windows, macOS, Linux
   - Check version with `dart --version`
2. **Use DartPad**
   - A browser-based environment, no installation required
   - https://dartpad.dev
3. **IDE Support**
   - Visual Studio Code + Dart/Flutter plugins
   - IntelliJ IDEA / Android Studio
4. **Install via Flutter SDK**
   - Flutter SDK includes the Dart SDK out of the box

------

### **1.5 First Program: Hello World**

```
void main() {
  print('Hello, World!');
}
```

**Explanation**:

- `main()` is the entry point of every Dart program.
- `print()` outputs a string to the console.

Run it from the terminal:

```
dart run hello.dart
```

Output:

```
Hello, World!
```

------

✅ **Summary**
 This chapter introduced the history of Dart, its relationship with Flutter, use cases, environment setup, and the first "Hello World" program. In the next chapter, we’ll dive into **basic syntax**.