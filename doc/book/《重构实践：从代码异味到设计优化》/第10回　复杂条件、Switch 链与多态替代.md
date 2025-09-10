## 第10回　复杂条件、Switch 链与多态替代

### 第10回　複雑な条件式・switchチェーンと多態による置換

------

## 中文版

### 引言

复杂的条件判断和庞大的 `switch`/`if-else` 链，是代码中最常见的“逻辑陷阱”。
 它们导致：

- 难以阅读和理解。
- 修改时容易遗漏情况。
- 违反“开放-封闭原则”（OCP）。

解决这些问题的重要手法就是：**条件分解（Decompose Conditional）** 与 **多态替代（Replace Conditional with Polymorphism）**。

------

### 10.1 复杂条件（Complex Conditional）

**特征**：

- 表达式逻辑过长，混合了多个判断。
- 多层嵌套 `if`，逻辑不清晰。

**示例（Before → After）**

```
// Before
bool canAccess(User user) {
  return user != null &&
         user.isActive &&
         user.role == "ADMIN" &&
         !user.isBlocked;
}
// After：条件分解
bool isActive(User user) => user.isActive;
bool isAdmin(User user) => user.role == "ADMIN";
bool isValid(User user) => !user.isBlocked;

bool canAccess(User user) {
  return isActive(user) && isAdmin(user) && isValid(user);
}
```

✅ 好处：逻辑可读性提高，测试也更容易。

------

### 10.2 Switch / if-else 链

**特征**：

- 对类型、状态进行分支判断。
- 相同的 `switch` 逻辑出现在多个地方。

**示例（Before → After）**

```
// Before
fun calculatePay(type: String, hours: Int): Int {
    return when (type) {
        "FULLTIME" -> hours * 1000
        "PARTTIME" -> hours * 800
        "INTERN" -> hours * 500
        else -> 0
    }
}
// After：多态替代
interface Employee {
    fun pay(hours: Int): Int
}

class FullTime : Employee {
    override fun pay(hours: Int) = hours * 1000
}
class PartTime : Employee {
    override fun pay(hours: Int) = hours * 800
}
class Intern : Employee {
    override fun pay(hours: Int) = hours * 500
}

fun calculatePay(e: Employee, hours: Int) = e.pay(hours)
```

✅ 好处：新增类型时不需要修改原有代码，只需新增类即可。

------

### 10.3 使用建议

- **条件分解**：适合处理复杂的逻辑表达式。
- **多态替代**：适合 `switch/if` 链，并且未来可能增加更多分支。
- 如果分支固定且简单，可以保留 `switch`，不必过度设计。

------

### 小结

- **复杂条件** → 使用条件分解，让逻辑更清晰。
- **Switch 链** → 使用多态替代，让扩展更灵活。
   **核心思想**：**避免逻辑硬编码，把变化隔离到多态结构中。**

------

## 日本語版

### 序文

複雑な条件分岐や巨大な `switch`／`if-else` チェーンは、コードに潜む典型的な「ロジックの罠」です。
 その結果：

- 読みにくく理解が難しい。
- 修正時に抜け漏れが発生しやすい。
- 「オープン・クローズド原則（OCP）」に違反する。

解決の鍵は **条件分解（Decompose Conditional）** と **多態による置換（Replace Conditional with Polymorphism）** です。

------

### 10.1 複雑な条件式（Complex Conditional）

**特徴**：

- 複雑すぎる式で複数の条件を混在。
- if の入れ子が深く、ロジックが不透明。

**例（Before → After）**

```
// Before
bool canAccess(User user) {
  return user != null &&
         user.isActive &&
         user.role == "ADMIN" &&
         !user.isBlocked;
}
// After：条件分解
bool isActive(User user) => user.isActive;
bool isAdmin(User user) => user.role == "ADMIN";
bool isValid(User user) => !user.isBlocked;

bool canAccess(User user) {
  return isActive(user) && isAdmin(user) && isValid(user);
}
```

✅ メリット：ロジックの意図が明確になり、テストもしやすい。

------

### 10.2 switch / if-else チェーン

**特徴**：

- 型や状態に応じて分岐。
- 同じ `switch` 処理が複数箇所に重複。

**例（Before → After）**

```
// Before
fun calculatePay(type: String, hours: Int): Int {
    return when (type) {
        "FULLTIME" -> hours * 1000
        "PARTTIME" -> hours * 800
        "INTERN" -> hours * 500
        else -> 0
    }
}
// After：多態に置換
interface Employee {
    fun pay(hours: Int): Int
}

class FullTime : Employee {
    override fun pay(hours: Int) = hours * 1000
}
class PartTime : Employee {
    override fun pay(hours: Int) = hours * 800
}
class Intern : Employee {
    override fun pay(hours: Int) = hours * 500
}

fun calculatePay(e: Employee, hours: Int) = e.pay(hours)
```

✅ メリット：新しいタイプを追加する際、既存コードを変更せずクラス追加だけで済む。

------

### 10.3 利用のヒント

- **条件分解**：複雑な条件式を整理するのに適している。
- **多態による置換**：switch/if チェーンを整理し、将来的な拡張に備える。
- 分岐が固定かつ単純なら switch を残してもよい（過剰設計を避ける）。

------

### まとめ

- **複雑な条件式** → 条件分解で意図を明確化。
- **switch チェーン** → 多態で拡張性を確保。
   **基本思想**：**ロジックのハードコーディングを避け、変化を多態構造に閉じ込める。**