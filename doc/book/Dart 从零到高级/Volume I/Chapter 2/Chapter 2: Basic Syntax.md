## **Chapter 2: Basic Syntax**

------

### **2.1 The main() Function and Entry Point**

Every Dart program starts with the `main()` function:

```dart
void main() {
  print('Program started');
}
```

- `main()` is the required entry point.
- `void` means the function doesn’t return a value.
- `print()` outputs content to the console.

------

### **2.2 Variables and Constants**

Dart is strongly typed but supports type inference.

1. **var**: mutable variable, type inferred at compile time

   ```dart
   var name = 'Dart';
   name = 'Flutter'; // valid
   ```

2. **final**: runtime constant, can only be set once

   ```dart
   final today = DateTime.now();
   // today = DateTime(2020); // error
   ```

3. **const**: compile-time constant, must be known at compile time

   ```dart
   const pi = 3.14159;
   ```

------

### **2.3 Data Types**

Common built-in types:

- `int`: integers
- `double`: floating-point numbers
- `String`: strings
- `bool`: true/false values

Example:

```
int age = 25;
double price = 19.9;
String message = 'Hello Dart';
bool isOpen = true;
```

------

### **2.4 Collection Types**

Dart provides rich collection types:

1. **List (ordered collection)**

   ```
   var numbers = [1, 2, 3];
   numbers.add(4);
   ```

2. **Set (unique items)**

   ```
   var fruits = {'apple', 'banana'};
   fruits.add('banana'); // ignored, Set disallows duplicates
   ```

3. **Map (key-value pairs)**

   ```
   var person = {
     'name': 'Anna',
     'age': 25,
   };
   print(person['name']);
   ```

------

### **2.5 Operators and Expressions**

- **Arithmetic**: `+ - * / %`

- **Comparison**: `== != > < >= <=`

- **Logical**: `&& || !`

- **Conditional expression**:

  ```
  var result = age > 18 ? 'Adult' : 'Minor';
  ```

- **Null-aware operators**:

  ```
  var name = null;
  print(name ?? 'Default'); // prints "Default"
  ```

------

✅ **Summary**
 In this chapter, we covered Dart’s entry point, variables and constants, basic data types, collections, and operators. These form the foundation of Dart’s syntax. Next, we’ll explore **control flow**.