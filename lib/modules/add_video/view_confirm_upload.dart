import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pl;

import '../../common_widgets/custom_animated_button.dart';

class ConfirmUploadPage extends StatefulWidget {
  final File pickedVideo;
  final String pickedVideoPath;

  const ConfirmUploadPage({Key? key, required this.pickedVideo, required this.pickedVideoPath}) : super(key: key);

  @override
  State<ConfirmUploadPage> createState() => _ConfirmUploadPageState();
}

class _ConfirmUploadPageState extends State<ConfirmUploadPage> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.pickedVideo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Expanded(child: SingleChildScrollView(
            child: Column(

              children: [

              ],
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
              },
            ),
          )





        ],
      ),
    );
  }
}