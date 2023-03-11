import 'dart:io';

import 'package:funmate/modules/add_video/view_confirm_upload.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../common_widgets/custom_snackbar_styling.dart';
import 'state.dart';

class AddVideoLogic extends GetxController {
  final AddVideoState state = AddVideoState();



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


}