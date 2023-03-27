import 'package:firebase_auth/firebase_auth.dart';
import 'package:funmate/modules/login/view.dart';
import 'package:funmate/utils/constants.dart';
import 'package:get/get.dart';
import '../modules/bottom_nav_bar/view.dart';


class GeneralController extends GetxController {
  static GeneralController get to => Get.find();
   Rx<User?>? _user;


   User get user => _user!.value!;


  @override
  void onReady() {
    // TODO: implement onReady
   _user = Rx<User?>(firebaseAuth.currentUser);
   _user!.bindStream(firebaseAuth.authStateChanges());
    ever(_user!, _setInitialScreen);
    super.onReady();
  }

   _setInitialScreen(User? user){
       if(firebaseAuth.currentUser == null || user == null){
         Get.offAll(LoginPage());

       } else {
         Get.offAll(BottomNavBarPage());
       }
   }

}