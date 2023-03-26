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
import 'package:video_compress/video_compress.dart';
import '../../custom_widgets/custom_loader.dart';
import '../../custom_widgets/custom_snackbar_styling.dart';
import 'state.dart';

class AddVideoLogic extends GetxController {
  final AddVideoState state = AddVideoState();
  final CustomLoader loader = CustomLoader();
  TextEditingController songNameTextController = TextEditingController();
  TextEditingController captionTextController = TextEditingController();

  late dynamic pickedVideo;

  videoPickerFunction({required ImageSource source}) async {
    pickedVideo = await ImagePicker().pickVideo(source: source);
    if (pickedVideo != null) {
      Get.to(ConfirmUploadPage(
        pickedVideo: File(pickedVideo.path),
        pickedVideoPath: pickedVideo.path,
      ));
    } else {
      customSnackBar(
        title: 'No video picked',
        message: "You didn't selected any video to upload",
      );
    }
  }

  uploadVideoFunction() async {
    log('on the way');
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDocSnap =
          await fireStore.collection('users').doc(uid).get();
      var allAvailVideos = await fireStore.collection('videos').get();
      int length = allAvailVideos.docs.length;

      String videoUrl = await _uploadVideoToStorage(vidId: "VIDEO $length");
      String thumbnailUrl =
          await _uploadThumbnailToStorage(vidId: "VIDEO $length");

      ModelVideo modelVideo = ModelVideo(
          userName: (userDocSnap.data() as Map<String, dynamic>)['username'],
          uid: uid,
          id: "VIDEO $length",
          likes: [],
          commentCount: 0,
          songName: songNameTextController.text,
          caption: captionTextController.text,
          videoUrl: videoUrl,
          thumbnailUrl: thumbnailUrl,
          userProfilePhoto:
              (userDocSnap.data() as Map<String, dynamic>)['profile_photo']);

      await fireStore
          .collection('videos')
          .doc("VIDEO $length")
          .set(modelVideo.toJson());

      loader.hideLoader();

      customSnackBar(
        title: 'Congratulations',
        message: 'Video has been shared successfully',
      );
    } catch (e) {
      loader.hideLoader();
      log("Error $e");
      customSnackBar(
        title: 'Error Uploading Video',
        message: '$e',
      );
    }
  }

  _uploadVideoToStorage({required String vidId}) async {
    Reference ref = firebaseStorage.ref().child("videos").child(vidId);
    UploadTask uploadTask = ref.putFile(await _compressTheVideo());
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  _compressTheVideo() async {
    final compressedVideo = await VideoCompress.compressVideo(pickedVideo.path,
        quality: VideoQuality.LowQuality);
    return compressedVideo!.file;
  }

  _uploadThumbnailToStorage({required String vidId}) async {
    Reference ref = firebaseStorage.ref().child("thumbnails").child(vidId);
    UploadTask uploadTask = ref.putFile(await _createThumbnail());
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  _createThumbnail() async {
    final videoThumbnail =
        await VideoCompress.getFileThumbnail(pickedVideo.path);
    return videoThumbnail;
  }
}