import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:funmate/utils/colors.dart';
import 'package:funmate/utils/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common_widgets/custom_animated_button.dart';
import '../../common_widgets/custom_text_field.dart';
import '../signup/view.dart';
import 'logic.dart';

class LoginPage extends StatelessWidget {
  final logic = Get.put(LoginLogic());
  final state = Get.find<LoginLogic>().state;

   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kScaffoldHorizontalPadding
            ),
            child: Form(
              key: logic.logInFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Image.asset('assets/images/1.png',
                   height: 200.h,
                  ),

                  MyCustomTextField(
                    controller: logic.emailTextController,
                    hintText: 'Email',
                    prefixIcon: Icon(
                      AntDesign.mail,
                      size: 18.sp,
                    ),
                  ),


                  SizedBox(
                    height: 20.h,
                  ),


                  MyCustomTextField(
                    controller: logic.passwordTextController,
                    hintText: 'Password',
                    isSecure: true,
                    prefixIcon: Icon(
                      AntDesign.lock1,
                      size: 18.sp,
                    ),
                  ),


                  SizedBox(
                    height: 45.h,
                  ),



                  AnimatedButton(
                    text: 'Log In',
                    onPress: (){
                      logic.logInUser();
                    },
                  ),


                  SizedBox(
                    height: 45.h,
                  ),

                  RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account?',
                        style:
                        GoogleFonts.leagueSpartan(
                          color: kSoftBlackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: ' Sign up',
                              style: GoogleFonts.leagueSpartan(
                                color: const Color(0xff33ccff),
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                    Get.to(SignupPage());
                                }
                          )
                        ]
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}