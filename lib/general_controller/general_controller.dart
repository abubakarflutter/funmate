import 'package:firebase_auth/firebase_auth.dart';
import 'package:funmate/modules/home/view.dart';
import 'package:funmate/modules/login/view.dart';
import 'package:funmate/utils/constants.dart';
import 'package:get/get.dart';


class GeneralController extends GetxController {

   Rx<User?>? _user;


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
         Get.offAll(const HomePage());
       }
   }

}