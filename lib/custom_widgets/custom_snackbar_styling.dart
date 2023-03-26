import 'package:flutter/material.dart';
import 'package:funmate/utils/colors.dart';
import 'package:get/get.dart';

void customSnackBar({required String title, message}){
  Get.snackbar(
    title,
    message,
    borderRadius: 10,
    backgroundColor: kPrimaryBlueColor.withOpacity(.5),
    borderColor: kPrimaryBlueColor,
    borderWidth: 1,
    margin: const EdgeInsets.only(
      bottom: 20,
      left: 20,
      right: 20,
    ),
    colorText: Colors.black54,
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
    backgroundGradient: const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff33ccff),
        Color(0xffff99cc),
      ],
    ),
  );
}