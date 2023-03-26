import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../custom_widgets/custom_animated_button.dart';
import '../../custom_widgets/custom_text_field.dart';
import 'logic.dart';

class ConfirmUploadPage extends StatefulWidget {
  final File pickedVideo;
  final String pickedVideoPath;

  const ConfirmUploadPage({Key? key, required this.pickedVideo, required this.pickedVideoPath}) : super(key: key);

  @override
  State<ConfirmUploadPage> createState() => _ConfirmUploadPageState();
}

class _ConfirmUploadPageState extends State<ConfirmUploadPage> {
  final logic = Get.find<AddVideoLogic>();

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.pickedVideo);
    _controller.initialize();
    _controller.play();
    _controller.setVolume(1);
    _controller.setLooping(true);
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Confirm Video'),
        centerTitle: true,
      ),


      body: Column(
        children: [

          Expanded(child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 20.w
              ),
              child: Column(

                children: [

                  SizedBox(
                    height: 20.h,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20.w,
                    height: MediaQuery.of(context).size.height / 2,
                    // child: VideoPlayer(_controller),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  MyCustomTextField(
                    controller: logic.songNameTextController,
                    hintText: 'Song Name',
                    isSecure: true,
                    prefixIcon: Icon(
                      MaterialIcons.audiotrack,
                      size: 18.sp,
                    ),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  MyCustomTextField(
                    controller: logic.captionTextController,
                    hintText: 'Caption',
                    isSecure: true,
                    prefixIcon: Icon(
                      MaterialIcons.closed_caption,
                      size: 18.sp,
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),

                ],
              ),
            ),
          )),


          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
            ),
            child: AnimatedButton(
              text: 'Confirm & Share',
              onPress: (){
                logic.loader.showLoader(context);
                logic.uploadVideoFunction();
              },
            ),
          )





        ],
      ),
    );
  }
}