import 'package:get/get.dart';

class CheckBokState{
  final String title;
  bool value;

  CheckBokState({required this.title, this.value = false});

}

class Test extends GetxController{
  final String title;
  bool value;

  Test({required this.title, this.value = false});
}

class Controller extends GetxController {
  int counter = 0;
  void increment() {
    counter++;
    update(); // use update() to update counter variable on UI when increment be called
  }
}