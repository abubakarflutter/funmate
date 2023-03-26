import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custom_widgets/custom_upload_button.dart';
import '../../utils/constants.dart';
import 'logic.dart';

class BottomNavBarPage extends StatelessWidget {
  final logic = Get.put(BottomNavBarLogic());
  final state = Get
      .find<BottomNavBarLogic>()
      .state;

  BottomNavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            // setState(() {
            logic.pageIndex.value = index;
            // });
          },
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey.shade400,
          currentIndex: logic.pageIndex.value,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                label: 'Search'
            ),
            BottomNavigationBarItem(
                icon: CustomUploadButton(),
                label: ''
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                  size: 30,
                ),
                label: 'Chat'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: 'Profile'
            ),
          ],
        ),
        body: bottomBarPages[logic.pageIndex.value],
      );
    });
  }
}