## **1.1 Dartの歴史と発展**

Dart は 2011 年に Google によって発表されました。
 当初は「JavaScript の代替」として設計され、Web ブラウザ上での動作を想定していました。
 しかし、JavaScript との互換性やパフォーマンスの問題から当初の戦略は調整され、Dart は徐々に「クロスプラットフォーム開発に適したモダンな言語」へと進化しました。

大きな転機は **2017 年の Flutter の登場** です。
 Flutter は UI フレームワークとして世界的に注目を集め、その中心的言語として Dart の存在感も急速に拡大しました。現在ではモバイル、Web、デスクトップ、サーバー、IoT まで幅広く利用されています。

------

## **1.2 DartとFlutterの関係**

Flutter は「1 つのコードベースで複数プラットフォームに対応する」ことを目的とした UI フレームワークです。
 その基盤を支えるのが Dart です。

Dart が Flutter に選ばれた理由：

- **ホットリロード** 機能により開発効率が非常に高い
- **強力な非同期処理モデル**（Future / Stream）が UI と相性が良い
- **Ahead-of-Time (AOT) コンパイル**によりネイティブ並みのパフォーマンスを実現
- **Just-in-Time (JIT) コンパイル**により開発中の高速な実行が可能

このように、Dart は Flutter の表現力と開発体験を支える「心臓部」と言えます。

------

## **1.3 Dartの利用シーン**

Dart は Flutter 以外にも、幅広い用途に利用できます。

- **モバイルアプリ開発**：iOS / Android のクロスプラットフォームアプリ
- **Web 開発**：Dart2js による JavaScript 変換、または WebAssembly
- **サーバーサイド開発**：`shelf` フレームワークを使った REST API や WebSocket サーバー
- **デスクトップ開発**：Windows / macOS / Linux アプリ
- **コマンドラインツール**：Dart 単体で CLI ツール作成
- **FFI 連携**：C/C++/Rust などのネイティブコードと統合

Dart は「フルスタックで活用できる言語」として注目されています。

------

## **1.4 開発環境の構築**

Dart を始めるにはいくつかの方法があります。

1. **Dart SDK のインストール**
   - Windows, macOS, Linux に対応
   - `dart --version` で確認
2. **DartPad（ブラウザ環境）**
   - インストール不要で学習できる
   - https://dartpad.dev
3. **IDE サポート**
   - Visual Studio Code + Dart/Flutter プラグイン
   - IntelliJ IDEA / Android Studio
4. **Flutter SDK 経由**
   - Flutter SDK を導入すると Dart SDK も同梱されている

------

## **1.5 最初のプログラム：Hello World**

Dart の基本的なプログラムを試してみましょう。

```
void main() {
  print('Hello, World!');
}
```

### 解説

- `main()` は Dart プログラムのエントリーポイントです。
- `print()` は標準出力に文字列を表示する関数です。

ターミナルで以下を実行すると、結果が表示されます：

```
dart run hello.dart
```

出力:

```
Hello, World!
```

------

💡 **まとめ**
 この章では Dart の背景や Flutter との関係、利用シーンを確認し、開発環境を整えて最初のプログラムを実行しました。次章からは Dart の基本文法に入ります。