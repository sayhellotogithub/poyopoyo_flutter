## 第24回　数据库重构：Expand–Migrate–Contract 模式

### 第24回　データベースリファクタリング：Expand–Migrate–Contract パターン

------

## 中文版

### 引言

在应用层我们可以通过接口和抽象来保证兼容性，但在 **数据库层面**，schema 的修改往往会带来极大风险：

- 一旦直接删除或修改字段，可能导致线上应用崩溃。
- 多服务、多版本客户端并发访问时，难以保证兼容。

👉 因此，现代数据库重构常采用 **Expand–Migrate–Contract（扩展–迁移–收缩）模式**。

------

### 24.1 Expand（扩展阶段）

- 在保留旧结构的同时，引入新结构。
- 例如：新增一个新列 `full_name`，但保留旧的 `first_name` 和 `last_name`。

```
ALTER TABLE users ADD COLUMN full_name VARCHAR(255);
```

此时应用可以继续使用旧字段，逐步过渡到新字段。

------

### 24.2 Migrate（迁移阶段）

- 将旧数据迁移到新结构。
- 通过脚本或应用层逻辑同步数据。

```
UPDATE users SET full_name = CONCAT(first_name, ' ', last_name) WHERE full_name IS NULL;
```

- 应用代码逐步切换到新字段。
- 确保 **双写机制**（更新时写入新旧字段），避免数据不一致。

------

### 24.3 Contract（收缩阶段）

- 当确认所有客户端都使用新结构后，才删除旧结构。

```
ALTER TABLE users DROP COLUMN first_name;
ALTER TABLE users DROP COLUMN last_name;
```

- 此阶段需伴随 **版本发布计划** 和 **API/应用日志监控**，确保无旧依赖。

------

### 24.4 优点

- **兼容性好**：任何时刻，应用都能访问可用的 schema。
- **风险可控**：分阶段演进，而不是一次性破坏性修改。
- **支持灰度发布**：允许多个版本的服务共存。

------

### 小结

- **Expand**：新增结构，保证兼容。
- **Migrate**：迁移数据，逐步切换。
- **Contract**：删除旧结构，收缩到最终形态。

**核心思想**：数据库 schema 的演进要 **分阶段、渐进式、安全可回滚**。

------

## 日本語版

### 序文

アプリケーション層では抽象化で互換性を保てますが、**データベース層** のスキーマ変更はリスクが大きい：

- カラムを直接削除・変更すると、本番アプリが即座に壊れる可能性がある。
- 複数サービス・複数バージョンのクライアントが同時に利用する環境では、互換性確保が難しい。

👉 そのため、現代的な DB リファクタリングでは **Expand–Migrate–Contract（拡張–移行–収縮）パターン** が推奨されます。

------

### 24.1 Expand（拡張段階）

- 旧構造を残しつつ、新しい構造を追加。
- 例：新しい `full_name` カラムを追加し、旧 `first_name` と `last_name` を残す。

```
ALTER TABLE users ADD COLUMN full_name VARCHAR(255);
```

この段階では旧フィールドを利用しつつ、新フィールドへの移行を準備する。

------

### 24.2 Migrate（移行段階）

- 旧データを新構造へ移行。
- スクリプトやアプリケーションでデータを同期。

```
UPDATE users SET full_name = CONCAT(first_name, ' ', last_name) WHERE full_name IS NULL;
```

- アプリを段階的に新フィールドへ切り替える。
- 更新時は新旧フィールド両方に書き込む「二重書き込み」で整合性を保つ。

------

### 24.3 Contract（収縮段階）

- 全てのクライアントが新構造を利用していることを確認後、旧構造を削除。

```
ALTER TABLE users DROP COLUMN first_name;
ALTER TABLE users DROP COLUMN last_name;
```

- この段階ではリリース計画・API／ログ監視を併用し、旧依存がないことを保証する。

------

### 24.4 メリット

- **高い互換性**：常に利用可能なスキーマを保持。
- **リスク低減**：破壊的変更を避け、段階的に進める。
- **段階的リリース可能**：複数バージョンのサービスを共存させられる。

------

### まとめ

- **Expand**：新構造を追加し互換性を確保。
- **Migrate**：データを移行し、徐々に切替。
- **Contract**：旧構造を削除し、最終形に収束。

**基本思想**：DB スキーマの進化は **段階的・安全・ロールバック可能** であるべき。

## Mermaid 时序图（中文版说明）

```
sequenceDiagram
    participant Dev as 开发团队
    participant DB as 数据库
    participant App as 应用服务

    Dev->>DB: Expand（新增字段 full_name）
    Note right of DB: 保留 first_name / last_name<br/>同时增加 full_name

    App->>DB: 读写旧字段（first_name, last_name）
    App->>DB: 双写数据到新旧字段

    Dev->>DB: Migrate（批量迁移数据）
    Note right of DB: 使用脚本/批处理<br/>把旧数据填充到新字段

    App->>DB: 开始读写新字段 full_name
    App-->>DB: 保持双写机制

    Dev->>DB: Contract（删除旧字段）
    Note right of DB: 删除 first_name / last_name<br/>完全切换到 full_name
```

------

### 📌 图表说明

- **Expand**：新增新结构，旧结构保留。
- **Migrate**：迁移数据，并启用双写，确保一致性。
- **Contract**：删除旧结构，完成最终收缩。

------

## 📊 Mermaid シーケンス図（日文版説明）

```
sequenceDiagram
    participant Dev as 開発チーム
    participant DB as データベース
    participant App as アプリケーション

    Dev->>DB: Expand（full_name カラムを追加）
    Note right of DB: first_name / last_name を残しつつ<br/>full_name を追加

    App->>DB: 旧カラムを読み書き（first_name, last_name）
    App->>DB: 新旧カラムへ二重書き込み

    Dev->>DB: Migrate（データ移行）
    Note right of DB: スクリプトで旧データを full_name にコピー

    App->>DB: 新カラム full_name へ読み書き
    App-->>DB: 二重書き込みを維持

    Dev->>DB: Contract（旧カラム削除）
    Note right of DB: first_name / last_name を削除し<br/>full_name へ完全移行
```

------