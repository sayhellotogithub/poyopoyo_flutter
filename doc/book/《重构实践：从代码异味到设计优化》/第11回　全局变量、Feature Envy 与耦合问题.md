## 第11回　全局变量、Feature Envy 与耦合问题

### 第11回　グローバル変数・Feature Envy・結合度の問題

------

## 中文版

### 引言

在代码设计中，除了类和方法本身的复杂度之外，**类与类之间的耦合度** 也会极大地影响可维护性。
 常见的三种异味：

- **全局变量依赖（Global Variables）**
- **Feature Envy（特性嫉妒）**
- **过度耦合（Tight Coupling）**

它们往往导致：测试困难、改动牵一发动全身、模块边界模糊。

------

### 11.1 全局变量（Global Variables）

**特征**：

- 使用 `static` 或单例保存全局状态。
- 多处代码依赖同一个全局对象。
- 副作用不可控，难以测试。

**示例（Before → After）**

```
// Before
class Config {
  static String apiKey = "123456";
}

void fetch() {
  print("Using apiKey: ${Config.apiKey}");
}
// After：依赖注入
class Config {
  final String apiKey;
  Config(this.apiKey);
}

class ApiClient {
  final Config config;
  ApiClient(this.config);

  void fetch() {
    print("Using apiKey: ${config.apiKey}");
  }
}
```

✅ 好处：可测试性增强，避免隐藏依赖。

------

### 11.2 Feature Envy（特性嫉妒）

**特征**：

- 一个方法频繁访问另一个类的数据。
- 方法逻辑更“属于”另一个类。

**示例（Before → After）**

```
// Before
class Customer(val level: Int)

class Order(val amount: Double, val customer: Customer) {
    fun discount(): Double {
        return if (customer.level > 3) amount * 0.9 else amount
    }
}
// After：移动方法
class Customer(val level: Int) {
    fun discount(amount: Double): Double {
        return if (level > 3) amount * 0.9 else amount
    }
}

class Order(val amount: Double, val customer: Customer) {
    fun finalPrice() = customer.discount(amount)
}
```

✅ 好处：逻辑归属更合理，降低类间耦合。

------

### 11.3 耦合问题（Coupling Issues）

**特征**：

- 模块之间通过直接字段访问、全局变量、硬编码依赖耦合。
- 改动一个模块时，另一个模块必须同步修改。

**重构方向**：

- 引入接口/抽象层（Dependency Inversion）。
- 通过依赖注入（DI）隔离实现。
- 使用事件/观察者模式降低耦合。

------

### 小结

- **全局变量**：副作用不可控 → 用依赖注入替代。
- **Feature Envy**：方法归属错误 → 移动方法。
- **过度耦合**：模块边界不清晰 → 用接口和抽象降低依赖。
   **核心思想**：让模块之间保持**低耦合、高内聚**。

------

## 日本語版

### 序文

コード設計において、クラスやメソッド単体の複雑さだけでなく、**クラス間の結合度** も保守性を大きく左右します。
 代表的な悪臭は：

- **グローバル変数依存**
- **Feature Envy（特性嫉妬）**
- **過度な結合（Tight Coupling）**

これらはテスト困難、影響範囲の拡大、モジュール境界の曖昧化を招きます。

------

### 11.1 グローバル変数（Global Variables）

**特徴**：

- `static` やシングルトンでグローバル状態を保持。
- 複数のコードが同じオブジェクトに依存。
- 副作用が制御できず、テストも難しい。

**例（Before → After）**

```
// Before
class Config {
  static String apiKey = "123456";
}

void fetch() {
  print("Using apiKey: ${Config.apiKey}");
}
// After：依存性注入
class Config {
  final String apiKey;
  Config(this.apiKey);
}

class ApiClient {
  final Config config;
  ApiClient(this.config);

  void fetch() {
    print("Using apiKey: ${config.apiKey}");
  }
}
```

✅ メリット：テストしやすくなり、隠れた依存を排除できる。

------

### 11.2 Feature Envy（特性嫉妬）

**特徴**：

- あるメソッドが別クラスのデータを頻繁に参照。
- 実際のロジックはその別クラスに属するべき。

**例（Before → After）**

```
// Before
class Customer(val level: Int)

class Order(val amount: Double, val customer: Customer) {
    fun discount(): Double {
        return if (customer.level > 3) amount * 0.9 else amount
    }
}
// After：メソッド移動
class Customer(val level: Int) {
    fun discount(amount: Double): Double {
        return if (level > 3) amount * 0.9 else amount
    }
}

class Order(val amount: Double, val customer: Customer) {
    fun finalPrice() = customer.discount(amount)
}
```

✅ メリット：ロジックの所在が正しくなり、クラス間の結合度が低下。

------

### 11.3 結合度の問題（Coupling Issues）

**特徴**：

- モジュール同士がフィールド直参照・グローバル変数・ハードコード依存で結合。
- 1つの変更が別モジュールにも波及。

**リファクタリング方向**：

- インタフェース／抽象レイヤーを導入（依存関係逆転）。
- 依存性注入（DI）で実装を隔離。
- イベント／オブザーバパターンで疎結合化。

------

### まとめ

- **グローバル変数**：副作用が制御不能 → 依存性注入で解決。
- **Feature Envy**：メソッドの所在が誤り → メソッド移動で修正。
- **過度な結合**：モジュール境界が曖昧 → インタフェースや抽象で緩和。
   **基本思想**：**低結合・高凝集** を実現すること。

------