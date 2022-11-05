import 'package:get/get.dart';

class Controller extends GetxController {
  int selected = 0;
  selectedTopup(int i) {
    selected = i;
    update();
  }
  List listTopUp = [50, 100, 150, 200, 300, 500, 750];
}
