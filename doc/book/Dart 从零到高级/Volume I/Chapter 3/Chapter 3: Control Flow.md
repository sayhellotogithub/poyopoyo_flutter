## **Chapter 3: Control Flow**

------

### **3.1 if / else Statements**

Used for conditional branching:

```
var age = 20;
if (age >= 18) {
  print('Adult');
} else {
  print('Minor');
}
```

⚠️ **Notes**:

- Conditions must evaluate to `bool` (`true` or `false`). You cannot use integers like `0/1` as in C.
- Always use `{}` even for single-line blocks for clarity and safety.

------

### **3.2 switch / case Statements**

Useful for multiple conditions:

```
var grade = 'B';
switch (grade) {
  case 'A':
    print('Excellent');
    break;
  case 'B':
    print('Good');
    break;
  default:
    print('Unknown grade');
}
```

⚠️ **Notes**:

- Each `case` must end with `break`, `return`, or `throw`.
- `switch` works with `int`, `String`, and `enum`, but not with complex expressions.

------

### 3.3 Looping Structures 

#### **Standard for loop**

```
for (var i = 0; i < 3; i++) {
  print('Loop $i');
}
```

⚠️ Notes: Best for known iteration counts. Ensure loop condition eventually terminates.

------

#### **while loop**

```
var count = 0;
while (count < 3) {
  print(count);
  count++;
}
```

⚠️ Notes: Used when iteration count is unknown. Avoid infinite loops by updating variables properly.

------

#### **do-while loop**

```
var x = 0;
do {
  print(x);
  x++;
} while (x < 3);
```

⚠️ Notes: Executes at least once regardless of the condition.

------

#### **for-in loop (iterating collections)**

```
var list = ['A', 'B', 'C'];
for (var item in list) {
  print(item);
}
```

⚠️ Notes: Works with `Iterable`. Avoid modifying the collection while iterating.

------

#### **forEach method**

```
var numbers = [1, 2, 3];
numbers.forEach((n) => print(n));
```

⚠️ Notes: Concise but lacks `break` and `continue`. Use `for-in` if control is required.

------

#### **Labeled loops**

```
outerLoop:
for (var i = 0; i < 3; i++) {
  for (var j = 0; j < 3; j++) {
    if (j == 1) continue outerLoop;
    print('i=$i, j=$j');
  }
}
```

⚠️ Notes: Useful for nested loops when controlling the outer loop, but can reduce readability. Use sparingly.

------

### **3.4 break and continue**

```
for (var i = 0; i < 5; i++) {
  if (i == 2) continue; // skip this iteration
  if (i == 4) break;    // exit loop
  print(i);
}
```

⚠️ **Notes**:

- `continue` skips the current iteration but does not exit the loop.
- `break` only exits the current loop, not outer loops.

------

### **3.5 Exception Handling**

```
try {
  var result = 10 ~/ 0; // integer division by zero
} catch (e) {
  print('Exception occurred: $e');
} finally {
  print('Execution completed');
}
```

⚠️ **Notes**:

- `~/` is the integer division operator; dividing by zero throws an exception.
- `finally` always executes, even if `return` is used in `try` or `catch`.
- In production, catch specific exceptions instead of using a generic `catch (e)`.

------

✅ **Summary**
 In this chapter, we covered conditional branching, loops, control flow statements, and exception handling. Next, we’ll move on to **functions and scope**.