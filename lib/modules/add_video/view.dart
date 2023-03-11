import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../common_widgets/custom_animated_button.dart';
import '../../utils/colors.dart';
import 'components/dialog_video_picker.dart';
import 'logic.dart';

class AddVideoPage extends StatelessWidget {
  final logic = Get.put(AddVideoLogic());
  final state = Get.find<AddVideoLogic>().state;

  AddVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedButton(
          text: 'Upload Video',
          onPress: (){
            ///---------Dialog Box For Image Picker
            showDialog(
                context: context,
                builder: (BuildContext context) =>  DialogVideoPicker(
                  fromGalleryFunc: (){
                    logic.videoPickerFunction(
                      source: ImageSource.gallery
                    );
                  },
                  fromCameraFunc: (){
                    logic.videoPickerFunction(
                        source: ImageSource.camera
                    );

                  },
                ));
          },
        ),
      ),
    );
  }
}