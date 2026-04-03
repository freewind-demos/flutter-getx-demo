// Flutter GetX — 计数器
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(Controller());
  runApp(const MyApp());
}

class Controller extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('GetX')),
        body: Center(
          child: Obx(() => Text('Count: ${Get.find<Controller>().count.value}')),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.find<Controller>().increment(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
