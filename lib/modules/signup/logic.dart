import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:funmate/modules/signup/model_user.dart';
import 'package:funmate/utils/constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../custom_widgets/custom_snackbar_styling.dart';
import 'state.dart';

class SignupLogic extends GetxController {
  final SignupState state = SignupState();


  Rx<File>? profileImage;
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();



  ///------Register the User
  registerUser(BuildContext context) async {

    if(signUpFormKey.currentState!.validate() && profileImage != null){
      try {

        ///----- Create User
        UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: emailTextController.text, password: passwordTextController.text);

        ///---- Upload Profile Picture To Storage & Get URL
        String profileUrl = await uploadProfilePicture();

        UserModel userModel = UserModel(name: userNameTextController.text, email: emailTextController.text, profilePhoto: profileUrl, uid: userCredential.user!.uid);

        await fireStore.collection('users').doc(userCredential.user!.uid).set(userModel.toJson());


        customSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created successfully',
        );

        // Get.offAll(HomePage());


      } catch (e) {
        customSnackBar(
          title: 'Error',
          message:  '$e',
        );
      }

    } else {
      customSnackBar(
        title: 'Fields Missing',
        message: 'Kindly fill out complete information',
      );
    }


  }


  ///------ Method for Uploading Profile Picture to Firebase Storage
  Future<String> uploadProfilePicture() async {
    Reference ref = firebaseStorage.ref().child('profilePics').child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(profileImage!.value);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }



  ///------ Image Picker Function
  void pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      profileImage = Rx<File>(File(pickedImage.path));
      update();

      customSnackBar(
        title:    'Image Picked',
        message:  'You can override by selecting any other',
      );


    } else {

      customSnackBar(
        title: 'No Image Picked',
        message: 'Make sure you select an image for registering account',
      );

    }
  }

}