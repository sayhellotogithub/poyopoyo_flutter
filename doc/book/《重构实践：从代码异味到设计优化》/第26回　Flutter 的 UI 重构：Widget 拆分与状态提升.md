## 第26回　Flutter 的 UI 重构：Widget 拆分与状态提升

### 第26回　Flutter の UI リファクタリング：Widget 分割と状態リフトアップ

------

## 中文版

### 引言

在 Flutter 项目中，UI 往往因为 **Widget 过大**、**状态分散** 而变得难以维护。
 典型问题包括：

- 一个 Widget 代码上千行，既负责布局又负责业务逻辑。
- 子组件无法复用，只能在一个大文件里维护。
- 状态提升（state lifting）没有做好，导致数据传递混乱。

👉 本回介绍 **Widget 拆分** 与 **状态提升** 两个关键重构手法。

------

### 26.1 Widget 拆分（Extract Widget）

**Before：一个庞大的 Widget**

```
class UserProfilePage extends StatelessWidget {
  final User user;
  UserProfilePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl)),
        Text(user.name, style: TextStyle(fontSize: 20)),
        Text(user.email),
        ElevatedButton(
          onPressed: () => print("Follow ${user.name}"),
          child: Text("Follow"),
        ),
      ],
    );
  }
}
```

**After：提取独立子组件**

```
class UserProfilePage extends StatelessWidget {
  final User user;
  UserProfilePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAvatar(user.avatarUrl),
        UserInfo(user),
        FollowButton(user),
      ],
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String url;
  UserAvatar(this.url);

  @override
  Widget build(BuildContext context) =>
      CircleAvatar(backgroundImage: NetworkImage(url));
}

class UserInfo extends StatelessWidget {
  final User user;
  UserInfo(this.user);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(user.name, style: TextStyle(fontSize: 20)),
          Text(user.email),
        ],
      );
}

class FollowButton extends StatelessWidget {
  final User user;
  FollowButton(this.user);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () => print("Follow ${user.name}"),
        child: Text("Follow"),
      );
}
```

✅ 好处：代码更短、子组件可复用，UI 结构清晰。

------

### 26.2 状态提升（State Lifting）

**问题场景**：子组件内部持有状态，父组件无法控制，导致状态不一致。

**Before**

```
class CounterWidget extends StatefulWidget {
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Count: $count"),
        ElevatedButton(
          onPressed: () => setState(() => count++),
          child: Text("Increment"),
        ),
      ],
    );
  }
}
```

**After：状态提升到父组件**

```
class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;

  void _increment() => setState(() => count++);

  @override
  Widget build(BuildContext context) {
    return CounterWidget(count: count, onIncrement: _increment);
  }
}

class CounterWidget extends StatelessWidget {
  final int count;
  final VoidCallback onIncrement;

  CounterWidget({required this.count, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Count: $count"),
        ElevatedButton(
          onPressed: onIncrement,
          child: Text("Increment"),
        ),
      ],
    );
  }
}
```

✅ 好处：父组件掌握状态，子组件只负责展示，便于扩展到全局状态管理（如 Riverpod、Bloc）。

------

### 小结

- **Widget 拆分**：把大组件拆成小组件，增强复用与可读性。
- **状态提升**：让父组件掌控状态，子组件专注 UI 展示。
   **核心思想**：UI 重构的关键是 **分而治之 + 单一职责**。

------

## 日本語版

### 序文

Flutter プロジェクトでは、**巨大な Widget** や **状態の分散** が原因で UI の保守性が低下しやすい。
 典型的な問題：

- 1つの Widget が数百行以上になり、レイアウトとロジックが混在。
- 子コンポーネントが再利用できず、大きなファイルに詰め込まれる。
- 状態リフトアップができていないため、データ伝達が混乱。

👉 本回では **Widget 分割** と **状態リフトアップ** のリファクタリング手法を紹介する。

------

### 26.1 Widget 分割（Extract Widget）

（前后代码同上，略，日文注解即可）

✅ メリット：コードが短くなり、子コンポーネントを再利用可能。UI 構造が明確になる。

------

### 26.2 状態リフトアップ（State Lifting）

（前后代码同上，略，日文注解即可）

✅ メリット：親コンポーネントが状態を管理し、子は UI 表示に専念できる。状態管理フレームワーク導入にも繋げやすい。

------

### まとめ

- **Widget 分割**：大きなコンポーネントを小さく分け、再利用性と可読性を向上。
- **状態リフトアップ**：親が状態を保持し、子は表示のみに集中。
   **基本思想**：UI リファクタリングの鍵は **責務分離と分割統治**。

------