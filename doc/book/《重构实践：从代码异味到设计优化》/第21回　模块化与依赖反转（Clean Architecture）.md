第21回　模块化与依赖反转（Clean Architecture）

## 第21回　模块化与依赖反转（Clean Architecture）

### 第21回　モジュール化と依存関係逆転（Clean Architecture）

------

## 中文版

### 引言

在小规模项目中，函数和类的重构足以保持可维护性。
 但在中大型系统中，**模块化设计** 与 **依赖反转原则（Dependency Inversion Principle, DIP）** 才能真正保证系统的演进性。

这也是 **Clean Architecture** 的核心：

- **高层策略**（业务规则）独立于
- **低层实现**（数据库、框架、外部服务）

------

### 21.1 模块化（Modularization）

**目标**：让系统按职责划分为清晰的模块，每个模块都有边界。

常见的分层：

- **Presentation 层**（UI/接口）
- **Application 层**（用例/业务流程）
- **Domain 层**（领域模型，规则核心）
- **Infrastructure 层**（数据库、外部 API、框架实现）

👉 原则：**内层不依赖外层，依赖方向始终指向 Domain**。

------

### 21.2 依赖反转（Dependency Inversion）

**问题**：传统实现中，高层逻辑往往直接依赖低层实现（如直接依赖数据库）。
 **解决方案**：通过 **抽象接口** 反转依赖，让高层定义规则，低层提供实现。

```
// Before：高层依赖低层
class UserService(val dao: UserDao) {
    fun getUser(id: String): User = dao.findById(id)
}
// After：依赖反转
interface UserRepository {
    fun findById(id: String): User
}

class UserService(val repo: UserRepository) {
    fun getUser(id: String): User = repo.findById(id)
}

// 基础设施层提供实现
class UserDao : UserRepository {
    override fun findById(id: String): User { ... }
}
```

✅ 好处：高层逻辑（UserService）不再依赖具体实现，而是依赖抽象。

------

### 21.3 Clean Architecture 的好处

- **可替换性**：数据库或框架可随时替换，而不影响业务逻辑。
- **可测试性**：核心逻辑可通过 Mock 实现进行单元测试。
- **可扩展性**：新增功能时，不必修改核心业务，只需在外围扩展。

------

### 小结

- **模块化**：划清边界，降低耦合。
- **依赖反转**：高层依赖抽象，低层依赖实现。
- **Clean Architecture**：业务核心独立于技术实现，实现长期可维护性。

------

## 日本語版

### 序文

小規模プロジェクトでは、関数やクラスのリファクタリングで十分に保守性を保てます。
 しかし、中～大規模システムでは、**モジュール化設計** と **依存関係逆転の原則（DIP）** が不可欠です。

これは **Clean Architecture** の中心理念でもあり、

- **上位層（ビジネスルール）** を
- **下位層（DB、フレームワーク、外部サービス）** から独立させることを意味します。

------

### 21.1 モジュール化（Modularization）

**目的**：責務ごとに明確なモジュールに分割し、境界を定義する。

典型的なレイヤー分割：

- **Presentation 層**（UI／インタフェース）
- **Application 層**（ユースケース／業務フロー）
- **Domain 層**（ドメインモデル／業務ルールの中核）
- **Infrastructure 層**（DB、外部 API、フレームワーク実装）

👉 原則：**内側は外側に依存しない。依存方向は常に Domain 層へ向かう。**

------

### 21.2 依存関係逆転（Dependency Inversion）

```
// Before：上位層が下位層に依存
class UserService(val dao: UserDao) {
    fun getUser(id: String): User = dao.findById(id)
}
// After：依存関係を逆転
interface UserRepository {
    fun findById(id: String): User
}

class UserService(val repo: UserRepository) {
    fun getUser(id: String): User = repo.findById(id)
}

// インフラ層が実装を提供
class UserDao : UserRepository {
    override fun findById(id: String): User { ... }
}
```

✅ メリット：上位層（UserService）は具象ではなく抽象に依存。

------

### 21.3 Clean Architecture の利点

- **交換可能性**：DB やフレームワークを差し替えてもビジネスロジックは影響を受けない。
- **テスト容易性**：モックを使ってコアロジックをテスト可能。
- **拡張性**：新機能は周辺層に追加するだけで、コアを変更する必要がない。

------

### まとめ

- **モジュール化**：責務ごとに境界を分離し、結合度を下げる。
- **依存関係逆転**：上位層は抽象に依存し、下位層が実装に依存する。
- **Clean Architecture**：技術に依存しないビジネス中心の構造で、長期的な保守性を実現。

