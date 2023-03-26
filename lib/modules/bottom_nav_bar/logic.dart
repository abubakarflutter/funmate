import 'package:get/get.dart';

import 'state.dart';

class BottomNavBarLogic extends GetxController {
  final BottomNavBarState state = BottomNavBarState();


  Rx<int> pageIndex = 0.obs;

}