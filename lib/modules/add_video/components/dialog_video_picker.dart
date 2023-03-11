import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';


class DialogVideoPicker extends StatelessWidget {

  final Function fromGalleryFunc;
  final Function fromCameraFunc;


  const DialogVideoPicker({
    Key? key,
    required
    this.fromGalleryFunc,
    required
    this.fromCameraFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.white, width: 2)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ///---Text Heading Row
                Row(
                  children: [
                    Text(
                      'Upload Photo',
                      style: GoogleFonts.leagueSpartan(
                        color: kSoftBlackColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '  (Choose One)',
                      style: GoogleFonts.leagueSpartan(
                        color: kSoftBlackColor,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20.h,
                ),

                ///------Picker Containers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///----------Gallery Picker Container
                    InkWell(
                      onTap: () => fromGalleryFunc(),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: kCustomBlueColor.withOpacity(.3),
                            border: Border.all(
                                color: kPrimaryBlueColor, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/gallery-icon.svg'),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'Photo Gallery',
                                style: GoogleFonts.leagueSpartan(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: kPrimaryBlueColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ///-----------Camera Picker Container
                    InkWell(
                      onTap: () => fromCameraFunc(),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.orange.withOpacity(.3),
                            border: Border.all(
                                color: Colors.orange, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/camera-icon.svg'),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'Camera',
                                style: GoogleFonts.leagueSpartan(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.orange),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ));
  }
}