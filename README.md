# Flutter GetX（响应式状态）

## 简介

用 GetX 的 `GetxController`、`Rx` 变量与 `Obx` 自动刷新 UI；`GetMaterialApp` 提供路由等扩展；必须在 `main` 里 **`Get.put(Controller())`** 注册后再 `runApp`，否则 `Get.find` 会找不到实例。

## 快速开始

### 环境要求

Flutter SDK。

### 运行

```bash
flutter pub get
flutter run
```

## 概念讲解

### 第一部分：`.obs` 与 `Obx`

`count` 声明为 `0.obs`，包装成响应式；`Obx(() => Text('...${...count.value}'))` 在依赖的 Rx 变化时重建。注意在 `Obx` 里要**真正读到** Rx，不要间接引用丢了订阅。

### 第二部分：`Get.put` 放置位置

本 Demo 在 `void main()` 里 `Get.put(Controller())`，保证首屏前已注册。页面多了以后可改用 `Get.lazyPut` 或 Bindings。

```dart
void main() {
  Get.put(Controller());
  runApp(const MyApp());
}
```

## 完整示例

见 `lib/main.dart`：`GetMaterialApp`、计数文案与 FAB。

## 注意事项

- GetX 还含路由、弹窗、国际化等工具，本 Demo 只演示状态一角。
- 若只用状态、不用路由，注意别把多种职责混在一个巨型 Controller 里。

## 完整讲解（中文）

GetX 的风格是「**少写样板，多用约定**」：一处 `put`，到处 `find`，再加 `Obx` 绑定界面。优点是上手快；缺点是初学时容易忽略生命周期与依赖边界，Controller 之间互相 `find` 过多会难测。把 `Get.put` 想成「轻量服务定位」，先注册、后使用，本 Demo 就是最短的一条正确路径。
