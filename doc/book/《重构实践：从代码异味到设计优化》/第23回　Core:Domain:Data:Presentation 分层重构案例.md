## 第23回　Core/Domain/Data/Presentation 分层重构案例

### 第23回　Core・Domain・Data・Presentation 分層リファクタリング事例

------

## 中文版

### 引言

在前几回，我们讨论了模块化、依赖反转、Package by Feature 等架构思路。
 本回通过一个具体案例，展示如何把 **耦合严重的系统** 重构为 **分层架构**：

- **Presentation 层**：负责 UI/接口交互。
- **Domain 层**：业务规则与实体。
- **Data 层**：数据持久化与 API 调用。
- **Core 层**：基础设施/工具库，跨层共享。

------

### 23.1 重构前（耦合混乱）

```
// 一个控制器直接调用数据库，缺少分层
class UserController {
    fun getUser(id: String): User {
        val conn = DriverManager.getConnection("jdbc:mysql://...")
        val stmt = conn.prepareStatement("SELECT * FROM users WHERE id=?")
        stmt.setString(1, id)
        val rs = stmt.executeQuery()
        return if (rs.next()) User(rs.getString("id"), rs.getString("name")) else null
    }
}
```

**问题：**

- Controller 直接依赖数据库连接。
- 业务逻辑、数据访问混在一起。
- 无法单元测试，扩展困难。

------

### 23.2 重构后（分层架构）

```
// Domain 层：实体与接口
data class User(val id: String, val name: String)

interface UserRepository {
    fun findById(id: String): User?
}

// Data 层：数据库实现
class UserRepositoryImpl : UserRepository {
    override fun findById(id: String): User? {
        // 数据访问逻辑
        return User("123", "Anna")
    }
}

// Application 层（或 UseCase）：业务逻辑
class GetUserUseCase(private val repo: UserRepository) {
    fun execute(id: String): User? = repo.findById(id)
}

// Presentation 层：接口控制器
class UserController(private val getUser: GetUserUseCase) {
    fun getUser(id: String): User? = getUser.execute(id)
}
```

✅ 好处：

- Controller 不再直接操作数据库。
- Repository 隔离了数据访问。
- UseCase 封装业务逻辑。
- 各层可单独测试、替换实现（如切换 API / DB）。

------

### 23.3 Core 层的作用

在大型项目中，**Core 层** 用来存放：

- 通用工具（日志、网络封装）。
- 基础设施抽象（错误处理、依赖注入接口）。
- 与具体业务无关的可复用组件。

这样保证 **Domain 层完全独立**，而 **Core 层为全局提供支撑**。

------

### 小结

- **重构前**：高耦合，Controller 直接操作数据库。
- **重构后**：分层清晰，业务逻辑、数据访问、UI 各自独立。
- **Core 层**：提供全局工具与抽象支撑。

**核心思想**：分层重构不是“增加文件数量”，而是 **让职责更明确、依赖方向更合理**。

------

## 日本語版

### 序文

これまでにモジュール化、依存関係逆転、Package by Feature などを紹介しました。
 今回は具体的な事例として、**結合度の高いシステム** を **分層アーキテクチャ** にリファクタリングする方法を示します：

- **Presentation 層**：UI／インタフェース。
- **Domain 層**：業務ルールとエンティティ。
- **Data 層**：DB／API へのアクセス。
- **Core 層**：基盤機能や共通ユーティリティ。

------

### 23.1 リファクタリング前（結合度が高い例）

```
// コントローラが DB を直接操作
class UserController {
    fun getUser(id: String): User {
        val conn = DriverManager.getConnection("jdbc:mysql://...")
        val stmt = conn.prepareStatement("SELECT * FROM users WHERE id=?")
        stmt.setString(1, id)
        val rs = stmt.executeQuery()
        return if (rs.next()) User(rs.getString("id"), rs.getString("name")) else null
    }
}
```

**問題点：**

- Controller が DB に直接依存。
- ビジネスロジックとデータアクセスが混在。
- テスト困難で拡張もしにくい。

------

### 23.2 リファクタリング後（分層アーキテクチャ）

```
// Domain 層
data class User(val id: String, val name: String)

interface UserRepository {
    fun findById(id: String): User?
}

// Data 層
class UserRepositoryImpl : UserRepository {
    override fun findById(id: String): User? {
        return User("123", "Anna")
    }
}

// Application 層（ユースケース）
class GetUserUseCase(private val repo: UserRepository) {
    fun execute(id: String): User? = repo.findById(id)
}

// Presentation 層
class UserController(private val getUser: GetUserUseCase) {
    fun getUser(id: String): User? = getUser.execute(id)
}
```

✅ メリット：

- Controller が DB を直接扱わない。
- Repository がデータアクセスを隔離。
- UseCase がビジネスロジックをカプセル化。
- 層ごとにテスト・交換が容易。

------

### 23.3 Core 層の役割

大規模プロジェクトでは **Core 層** が全体を支える：

- ログ、ネットワーク共通処理。
- エラー処理や依存性注入の抽象。
- ドメインに依存しない汎用コンポーネント。

👉 Domain 層を独立させつつ、Core が全体を下支えする構造になる。

------

### まとめ

- **Before**：Controller が DB に直結し、結合度が高い。
- **After**：層ごとに責務を分離し、依存方向が整理される。
- **Core 層**：全体を横断する基盤的な支援を提供。

**基本思想**：分層リファクタリングは「ファイルを増やすこと」ではなく、**責務を明確化し依存関係を正しく整理すること**。