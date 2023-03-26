import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../custom_widgets/custom_snackbar_styling.dart';
import '../../utils/constants.dart';
import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();


  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final logInFormKey = GlobalKey<FormState>();




  logInUser() async {

    if(logInFormKey.currentState!.validate()) {
      try {

        UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: emailTextController.text, password: passwordTextController.text);


        customSnackBar(
          title: 'Logged In Successfully',
          message:  'Authentication done successfully',
        );

      } catch (e) {
        customSnackBar(
          title: 'Error',
          message:  '$e',
        );
      }
    } else {
      customSnackBar(
        title: 'Fields Missing',
        message:  'Kindly input both email and password',
      );
    }


  }




}