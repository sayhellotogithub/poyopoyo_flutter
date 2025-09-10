Chapter 4: Functions and Scope

## **Chapter 4: Functions and Scope**

### **4.1 Defining and Calling Functions**

```
void sayHello(String name) {
  print('Hello, $name');
}

void main() {
  sayHello('Anna');
}
```

⚠️ Notes:

- Functions must be declared at the top level or inside a class.
- Return type can be omitted but should be explicit for clarity.

------

### **4.2 Parameter Types (Required, Optional, Named, Default)**

#### **Positional Required Parameters**

```
void greet(String name) {
  print('Hello, $name');
}

greet('Anna'); // ✅
```

⚠️ Notes:

- Parameters without `[]` or `{}` are required.
- Dart does not support method overloading.

------

#### **Positional Optional Parameters**

```
void greet(String name, [int? age]) {
  print('Hello $name, age: $age');
}

greet('Anna');    // age=null
greet('Bob', 25); // age=25
```

⚠️ Notes:

- Declared inside `[]`.
- Use `?` for nullable values.
- Too many optional positionals can reduce readability.

------

#### **Named Parameters**

```
void greet({String? name, int? age}) {
  print('Hello $name, age: $age');
}

greet(name: 'Anna', age: 20);
```

⚠️ Notes:

- Declared inside `{}` and called with `name:`.
- Named parameters are optional by default.

------

#### **required Modifier**

```
void greet({required String name, int age = 18}) {
  print('Hello $name, age $age');
}

greet(name: 'Anna'); // ✅
```

⚠️ Notes:

- `required` makes the parameter mandatory.
- Old Flutter code used `@required`, but `required` is now preferred.

------

#### **Default Values**

```
void greet(String name, {int age = 18}) {
  print('Hello $name, age $age');
}
```

⚠️ Notes:

- Default values must be compile-time constants.
- Collections can be used with `const`.

------

#### **Mixing Parameters**

```
void greet(String title, {required String name, int age = 18}) {
  print('$title $name, age $age');
}
```

⚠️ Notes:

- Order: required → positional optional → named.
- Limit arguments for readability; consider using data classes.

------

### **4.3 Anonymous and Arrow Functions**

```
var numbers = [1, 2, 3];

numbers.forEach((n) {
  print(n * n);
});

numbers.forEach((n) => print(n * 2));
```

⚠️ Notes:

- Arrow functions `=>` allow only a single expression.
- Anonymous functions are often used for callbacks.

------

### **4.4 Scope and Closures**

```
Function makeCounter() {
  var count = 0;
  return () {
    count++;
    return count;
  };
}

void main() {
  var counter = makeCounter();
  print(counter()); // 1
  print(counter()); // 2
}
```

⚠️ Notes:

- Closures capture external variables and preserve their state.
- Be cautious when creating closures in loops, as variables may be shared.

------

### **4.5 Higher-Order Functions**

```
int apply(int x, int Function(int) f) {
  return f(x);
}

void main() {
  print(apply(5, (n) => n * 2)); // 10
}
```

⚠️ Notes:

- In Dart, functions are *first-class objects*.
- Always specify function type signatures for readability and debugging.

------

### **Summary**

- Dart parameters fall into **required positional, optional positional, and named parameters**.
- Use `required` to enforce mandatory named parameters.
- **Default values** must be compile-time constants.
- For readability, prefer **named parameters** when a function takes many arguments.
- When arguments grow too complex, consider using a **data class** or configuration object.

### **Next Steps**
 With functions and scope under your belt, it’s time to move on to **Object-Oriented Programming (Chapter 5: Classes and Objects)**. Classes and methods are another form of functions, giving you stronger abstractions to build complex applications.