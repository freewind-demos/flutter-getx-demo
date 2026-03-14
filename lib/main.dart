// Flutter GetX
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class Controller extends GetxController {
  var count = 0.obs;
  void increment() => count++;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Obx(() => Text('Count: ${Get.find<Controller>().count}')),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.find<Controller>().increment(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
