import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';


class MyCustomTextField extends StatelessWidget {
  final String? hintText, prefixIconPath;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final bool? editable , isSecure;
  final Function? onTapFunction, inputValidators;

  const MyCustomTextField(
      {Key? key,
        this.hintText,
        this.prefixIconPath,
        this.controller,
        this.editable = true,
        this.isSecure = false,
        this.prefixIcon,
        this.inputValidators,
        this.onTapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300.withOpacity(.4),
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(0, 6))
      ]),
      child: TextFormField(
        onTap: () => onTapFunction == null
            ? {log('===== This Field Has Null Function ====')}
            : onTapFunction!(),
        readOnly: editable! ? false : true,
        controller: controller,
        obscureText: isSecure!,
        cursorColor: kSoftBlackColor,
        validator: inputValidators == null
            ? (value) {
          if (value!.isEmpty) {
            return 'Required';
          } else if (value.replaceAll(' ', '') == "") {
            return 'Invalid Value Entered';
          } else {
            return null;
          }
        }
            : (value) => inputValidators!(value),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.only(
            left: 15.w,
            right: 0.w,
          ),
          prefixIcon: prefixIcon!,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: Colors.white, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
            borderSide:
            const BorderSide(color: kPrimaryBlueColor, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
            borderSide:
            const BorderSide(color: kPrimaryBlueColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
            borderSide: const BorderSide(color: Colors.white, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
            borderSide: const BorderSide(color: kPrimaryBlueColor),
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.leagueSpartan(
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
          ),
        ),
        style: GoogleFonts.leagueSpartan(
          color: kSoftBlackColor,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}