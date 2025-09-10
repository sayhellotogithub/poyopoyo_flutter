## 第27回　Android 的 MVVM + UseCase 重构实践

### 第27回　Android における MVVM＋UseCase リファクタリング実践

------

## 中文版

### 引言

在 Android 项目中，常见的问题是：

- Activity/Fragment 内部既写 UI，又写业务逻辑和数据访问。
- ViewModel 成为“巨型类”，既处理 UI 状态，又直接调用 Repository。
- 业务逻辑难以复用，测试困难。

👉 解决方案：**MVVM + UseCase** 架构重构。

- **MVVM**：UI → ViewModel → Model，关注 UI 与状态。
- **UseCase**：作为应用层业务逻辑单元，解耦 ViewModel 与 Repository。

------

### 27.1 重构前（问题示例）

```
class UserFragment : Fragment() {
    private val repo = UserRepository()

    fun onViewCreated() {
        button.setOnClickListener {
            val user = repo.findById("123")
            textView.text = user.name
        }
    }
}
```

**问题：**

- Fragment 直接依赖 Repository。
- UI 与业务逻辑耦合。
- 测试困难。

------

### 27.2 重构后（MVVM + UseCase）

```
// Domain 层：业务实体
data class User(val id: String, val name: String)

// Domain 层：UseCase
class GetUserUseCase(private val repo: UserRepository) {
    fun execute(id: String): User = repo.findById(id)
}

// Data 层：仓库
class UserRepository {
    fun findById(id: String): User {
        return User("123", "Anna")
    }
}

// Presentation 层：ViewModel
class UserViewModel(private val getUserUseCase: GetUserUseCase) : ViewModel() {
    private val _user = MutableLiveData<User>()
    val user: LiveData<User> = _user

    fun loadUser(id: String) {
        _user.value = getUserUseCase.execute(id)
    }
}

// Presentation 层：Fragment
class UserFragment : Fragment() {
    private val vm: UserViewModel by viewModels {
        val repo = UserRepository()
        val useCase = GetUserUseCase(repo)
        object : ViewModelProvider.Factory {
            override fun <T : ViewModel> create(modelClass: Class<T>): T {
                return UserViewModel(useCase) as T
            }
        }
    }

    fun onViewCreated() {
        vm.user.observe(viewLifecycleOwner) { user ->
            textView.text = user.name
        }
        button.setOnClickListener { vm.loadUser("123") }
    }
}
```

✅ 好处：

- **Fragment 只管 UI**，不依赖数据层。
- **ViewModel 专注状态管理**，业务逻辑下沉到 UseCase。
- **UseCase 可复用、可测试**，Repository 可替换。

------

### 27.3 MVVM + UseCase 的优势

1. **单一职责**
   - Fragment 负责 UI，ViewModel 管理状态，UseCase 封装业务逻辑，Repository 处理数据。
2. **可测试性**
   - UseCase 可以独立测试，不依赖 UI。
   - ViewModel 可通过 Mock UseCase 测试 UI 状态。
3. **可扩展性**
   - 新增业务逻辑 → 新建 UseCase，不必修改 ViewModel/Fragment。
   - 便于迁移到 Clean Architecture。

------

### 小结

- **MVVM** 分离 UI 与状态。
- **UseCase** 下沉业务逻辑，解耦 ViewModel 与 Repository。
- 结合使用，让 Android 应用 **更清晰、更可测试、更可演进**。

------

## 日本語版

### 序文

Android 開発ではよくある問題：

- Activity／Fragment に UI・ビジネスロジック・データアクセスが混在。
- ViewModel が「巨大クラス」化し、状態管理とビジネスロジックを兼務。
- ビジネスロジックの再利用が困難で、テストも難しい。

👉 解決策：**MVVM＋UseCase** アーキテクチャへリファクタリング。

- **MVVM**：UI → ViewModel → Model。UI と状態を担当。
- **UseCase**：アプリケーション層のビジネスロジックを分離。

------

### 27.1 リファクタリング前

```
class UserFragment : Fragment() {
    private val repo = UserRepository()

    fun onViewCreated() {
        button.setOnClickListener {
            val user = repo.findById("123")
            textView.text = user.name
        }
    }
}
```

**問題点：**

- Fragment が Repository に直接依存。
- UI とビジネスロジックが結合。
- テスト困難。

------

### 27.2 リファクタリング後（MVVM＋UseCase）

（代码与中文版一致，略）

✅ メリット：

- **Fragment は UI のみ担当**。
- **ViewModel は状態管理専任**。
- **UseCase にビジネスロジックを集約**。

------

### 27.3 MVVM＋UseCase の利点

1. **単一責務の原則を徹底**。
2. **テスト容易性**：UseCase は単体テスト可能。
3. **拡張性**：新しいユースケースを追加しても既存コードを壊さない。

------

### まとめ

- **MVVM**：UI と状態を分離。
- **UseCase**：ビジネスロジックを下層に移動。
- **両者の組み合わせ** により、Android アプリは **明快・テスト容易・進化可能** になる。

## MVVM + UseCase 依赖关系图（中文版）

```
flowchart LR
    UI[UI 层\nActivity / Fragment] --> VM[ViewModel\n状态管理/调度]
    VM --> UC[UseCase\n业务规则/应用服务]
    UC --> Repo[Repository（抽象接口）]
    Repo --> DS[(Data Source\nAPI / DB / Cache)]
    UC --> Domain[Domain Model\n实体/值对象]

    %% 测试友好性（虚线表示替身/Mock）
    Test[单元测试] -. Mock .-> Repo
```

**要点（中文）：**

- 依赖方向：**UI → ViewModel → UseCase → Repository → Data Source**；Domain 由 UseCase 使用，但不反向依赖外层。
- **Repository 是抽象接口**，由数据层实现；测试时可 **Mock Repository**。
- ViewModel 不直接触达数据源，业务逻辑集中在 UseCase，职责清晰、可测试。

------

## 📊 MVVM + UseCase 依存関係図（日本語版）

```
flowchart LR
    UI[UI 層\nActivity / Fragment] --> VM[ViewModel\n状態管理／オーケストレーション]
    VM --> UC[UseCase\nアプリケーションロジック]
    UC --> Repo[Repository（抽象インタフェース）]
    Repo --> DS[(Data Source\nAPI / DB / Cache)]
    UC --> Domain[Domain Model\nエンティティ／値オブジェクト]

    %% テスト容易性（点線＝モック差し替え）
    Test[ユニットテスト] -. Mock .-> Repo
```

**ポイント（日文）：**

- 依存の向きは **UI → ViewModel → UseCase → Repository → Data Source**。Domain は UseCase から利用され、外側に依存しない。
- **Repository は抽象**、実装はデータ層で提供。テストでは **Mock に差し替え** 可能。
- ViewModel はデータ層へ直接依存せず、ビジネスロジックは UseCase に集約。

------