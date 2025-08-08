# Flutter Modular 项目结构与技术介绍（Melos + Riverpod + GoRouter）

## 项目结构概览

```
poyopoyo_flutter/
├── pubspec.yaml             # 根项目，仅用于声明 SDK 与 dev_dependencies
├── melos.yaml               # Melos 配置文件，定义 workspace 范围与脚本
└── packages/                # 所有功能模块按包划分
    ├── app/                 # 应用主入口（MaterialApp、路由、ProviderScope 等）
    ├── core/                # 核心服务与通用功能（网络、错误处理、主题等）
    ├── features/            # 功能模块
    │   ├── auth/            # 登录模块（完整 Clean Architecture）
    │   └── home/            # 首页模块
    └── shared/              # 可复用 UI 组件或基础类库（AppButton、AppDialog 等）
```

## 技术栈说明

| 分类     | 工具库                         | 说明                                               |
| -------- | ------------------------------ | -------------------------------------------------- |
| 状态管理 | `flutter_riverpod`             | 现代响应式 Provider，支持依赖注入与 ViewModel 构建 |
| 路由管理 | `go_router`                    | 支持嵌套路由、导航守卫、ShellRoute 等              |
| 模块管理 | `melos`                        | 多包 workspace 管理工具，支持 monorepo             |
| 数据模型 | `freezed`, `json_serializable` | 构建不可变类 + JSON序列化                          |
| 网络访问 | `dio`, `retrofit.dart`         | REST API 客户端生成器                              |
| 构建脚本 | `build_runner`                 | 代码自动生成工具（如 freezed, retrofit）           |

## 每个模块结构建议（以 features/auth 为例）

```
features/auth/
├── lib/
│   ├── auth.dart                   # 模块导出
│   ├── data/                       # 数据层
│   │   └── auth_repository_impl.dart
│   ├── domain/                     # 领域层
│   │   ├── entities/
│   │   ├── repositories/
│   │   └── usecases/
│   ├── presentation/              # 展示层
│   │   ├── viewmodels/            # Riverpod ViewModel
│   │   ├── screens/
│   │   └── widgets/
│   └── auth_route.dart            # go_router 路由定义
└── pubspec.yaml                   # 模块依赖定义
```

## 架构优点

- 🌱 支持模块解耦、按需加载、团队协作分工
- 🔄 Riverpod 实现全局状态与局部状态统一管理
- 🧩 每个模块具备完整的 Clean Architecture 分层，便于测试与扩展
- 🚀 可扩展为 plugin 化系统（注册路由、注入模块）