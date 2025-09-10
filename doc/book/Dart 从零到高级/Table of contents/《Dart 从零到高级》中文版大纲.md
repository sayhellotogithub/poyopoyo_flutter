## **第一卷：基础入门**

### 第1章 认识 Dart

1.1 Dart 的历史与发展
 1.2 Dart 与 Flutter 的关系
 1.3 Dart 的应用场景
 1.4 开发环境搭建（SDK、DartPad、IDE）
 1.5 第一个 Dart 程序：Hello World

### 第2章 基本语法

2.1 main() 函数与入口
 2.2 变量与常量（var / final / const）
 2.3 数据类型（int、double、String、bool）
 2.4 集合类型（List、Set、Map）
 2.5 运算符与表达式（算术、逻辑、关系、条件）

### 第3章 流程控制

3.1 if / else 分支
 3.2 switch / case 多分支
 3.3 for / while / do-while 循环
 3.4 break 与 continue
 3.5 异常处理（try / catch / finally）

### 第4章 函数与作用域

4.1 函数定义与调用
 4.2 参数形式（必选、可选、命名、默认值）
 4.3 匿名函数与箭头函数
 4.4 作用域与闭包
 4.5 高阶函数

------

## **第二卷：面向对象编程**

### 第5章 类与对象

5.1 类的定义与实例化
 5.2 字段与方法
 5.3 构造函数（默认、命名、工厂）
 5.4 Getter 与 Setter
 5.5 静态变量与方法

### 第6章 面向对象进阶

6.1 继承与多态
 6.2 抽象类与接口
 6.3 Mixin 与 with 关键字
 6.4 枚举类型（enum）
 6.5 运算符重载

### 第7章 现代语言特性

7.1 扩展方法（extension）
 7.2 空安全（Null Safety）详解
 7.3 级联操作符（.. 与 ?..）
 7.4 常量构造函数
 7.5 late 与延迟初始化

------

## **第三卷：集合与函数式编程**

### 第8章 集合操作

8.1 List 深入
 8.2 Map 深入
 8.3 Set 深入
 8.4 集合字面量与推导式（if / for）

### 第9章 函数式编程

9.1 map / where / reduce / fold
 9.2 Iterable 与惰性求值
 9.3 集合链式调用
 9.4 函数式与面向对象的结合

------

## **第四卷：异步与并发**

### 第10章 Future 与异步编程

10.1 Future 基础
 10.2 async / await
 10.3 then / catchError / whenComplete 链式调用
 10.4 超时与异常处理

### 第11章 Stream 与事件流

11.1 Stream 基础
 11.2 单订阅流与广播流
 11.3 StreamController
 11.4 异步迭代（await for）
 11.5 流的转换与组合

### 第12章 并发与 Isolate

12.1 Isolate 模型
 12.2 消息传递机制
 12.3 compute 方法
 12.4 多 Isolate 协作
 12.5 与多线程的比较

------

## **第五卷：工程化开发**

### 第13章 包与依赖管理

13.1 pub.dev 与生态
 13.2 pubspec.yaml 配置
 13.3 添加与管理依赖
 13.4 路径与 Git 依赖

### 第14章 模块化与项目结构

14.1 Library 与 part
 14.2 多文件组织方式
 14.3 命名与导入规则
 14.4 项目目录规范

### 第15章 单元测试与调试

15.1 test 包
 15.2 分组与断言
 15.3 Mock 测试
 15.4 调试工具与 IDE

### 第16章 代码规范与工具链

16.1 dart analyze 与静态检查
 16.2 dartfmt 与自动格式化
 16.3 常用 lint 规则
 16.4 CI/CD 集成

------

## **第六卷：高级主题**

### 第17章 泛型（Generics）

17.1 泛型类
 17.2 泛型方法
 17.3 泛型约束
 17.4 类型推断

### 第18章 注解与元编程

18.1 内置注解（@override、@deprecated 等）
 18.2 自定义注解
 18.3 反射（dart:mirrors 简介）
 18.4 build_runner 与代码生成
 18.5 json_serializable 实战

### 第19章 FFI 与跨语言调用

19.1 FFI 基础
 19.2 调用 C 函数
 19.3 内存与指针管理
 19.4 Dart + Rust 实战
 19.5 Flutter 中的 FFI 应用

### 第20章 性能优化

20.1 内存管理与垃圾回收
 20.2 Isolate 性能调优
 20.3 Dart DevTools 使用
 20.4 性能监控与实战案例

------

## **第七卷：实战篇**

### 第21章 命令行工具开发

21.1 CLI 项目结构
 21.2 args 包解析参数
 21.3 终端输出与进度条
 21.4 实用工具案例

### 第22章 服务端开发

22.1 shelf 框架
 22.2 RESTful API
 22.3 WebSocket 实现
 22.4 数据库访问（PostgreSQL / MongoDB）
 22.5 Dart Frog 实战

### 第23章 桌面与跨平台应用

23.1 Dart + Flutter 的关系
 23.2 跨平台桌面应用
 23.3 插件与原生交互
 23.4 Dart 在 IoT/嵌入式中的尝试

------

## **第八卷：架构与最佳实践**

### 第24章 设计模式

24.1 单例模式
 24.2 工厂模式
 24.3 Repository 模式
 24.4 观察者模式

### 第25章 Clean Architecture

25.1 三层结构（Data/Domain/Presentation）
 25.2 UseCase 的组织
 25.3 Repository 接口与实现
 25.4 测试驱动开发（TDD）

### 第26章 工程案例

26.1 JSON API 客户端
 26.2 聊天室（Stream + WebSocket）
 26.3 数据处理与文件解析工具
 26.4 跨平台生产力应用

------

## **附录**

- 附录A：常用 Dart 包索引
- 附录B：术语中英对照表
- 附录C：学习资源与社区链接
- 附录D：练习题参考答案

------