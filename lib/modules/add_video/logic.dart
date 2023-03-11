import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:funmate/modules/add_video/model_video.dart';
import 'package:funmate/modules/add_video/view_confirm_upload.dart';
import 'package:funmate/utils/constants.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:video_';

import '../../common_widgets/custom_snackbar_styling.dart';
import 'state.dart';

class AddVideoLogic extends GetxController {
  final AddVideoState state = AddVideoState();



  TextEditingController songNameTextController = TextEditingController();
  TextEditingController captionTextController = TextEditingController();



  videoPickerFunction({required ImageSource source}) async {
    final pickedVideo = await ImagePicker().pickVideo(source: source);
    if(pickedVideo != null){
      Get.to(ConfirmUploadPage(
        pickedVideo: File(pickedVideo.path),
        pickedVideoPath: pickedVideo.path,
      ));
    } else {
      customSnackBar(
        title: 'No video picked',
        message:  "You didn't selected any video to upload",
      );
    }
  }

  uploadVideoFunction() async {

    try {
     String uid = firebaseAuth.currentUser!.uid;
     DocumentSnapshot userDocSnap = await fireStore.collection('users').doc(uid).get();
     var allAvailVideos = await fireStore.collection('videos').get();
     int length = allAvailVideos.docs.length;

     String videoUrl = await _uploadVideoToStorage(vidId: "VIDEO $length");
     String thumbnailUrl = await _uploadThumbnailToStorage(vidId: "VIDEO $length");


     ModelVideo modelVideo = ModelVideo(
         userName: (userDocSnap.data() as Map<String, dynamic>)['name'], uid: uid, id: "VIDEO $length", likes: [], commentCount: 0, songName: songNameTextController.text, caption: captionTextController.text, videoUrl: videoUrl, thumbnailUrl: thumbnailUrl, userProfilePhoto:  (userDocSnap.data() as Map<String, dynamic>)['profile_photo']);

     await fireStore.collection('videos').doc("VIDEO $length").set(modelVideo.toJson());


     customSnackBar(
       title: 'Congratulations',
       message: 'Video has been shared successfully',
     );


    } catch (e) {
      log("Error $e");
    }


  }

  _uploadVideoToStorage({required String vidId}) async {
    Reference ref = firebaseStorage.ref().child("videos").child(vidId);
    UploadTask uploadTask = ref.putFile(await _compressTheVideo());
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  _compressTheVideo(){
    VideoCompress
  }

  _uploadThumbnailToStorage({required String vidId}) async {
    Reference ref = firebaseStorage.ref().child("thumbnails").child(vidId);
    UploadTask uploadTask = ref.putFile(await _createThumbnail());
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  _createThumbnail(){
    // final
  }

}