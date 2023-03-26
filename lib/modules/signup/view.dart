import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:funmate/utils/constants.dart';
import 'package:get/get.dart';
import '../../custom_widgets/custom_animated_button.dart';
import '../../custom_widgets/custom_text_field.dart';
import 'logic.dart';

class SignupPage extends StatelessWidget {
  final logic = Get.put(SignupLogic());
  final state = Get
      .find<SignupLogic>()
      .state;

  SignupPage({super.key});

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
              key: logic.signUpFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Image.asset('assets/images/1.png',
                    height: 130.h,
                  ),


                  Stack(
                    fit: StackFit.loose,
                    children: [
                      GetBuilder<SignupLogic>(builder: (logic) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300.withOpacity(.4),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: logic.profileImage == null ? CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40.r,
                            child: Icon(
                              FontAwesome.user_circle_o,
                              color: Colors.grey.shade300,
                              size: 70.sp,
                            ),
                          ) :
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: Image.file(
                                logic.profileImage!.value,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )

                          ,
                        );
                      }),

                      Positioned(
                          right: 0.w,
                          bottom: 5.h,
                          child: GestureDetector(
                            onTap: () => logic.pickImage(),
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff33ccff),
                                ),
                                child: Icon(
                                  Feather.camera,
                                  color: Colors.white,
                                  size: 14.sp,
                                )
                              //       :  Image.file(
                              //   logic.profileImage!.value
                              // ) ,
                            ),
                          ))

                    ],
                  ),


                  SizedBox(
                    height: 20.h,
                  ),


                  MyCustomTextField(
                    controller: logic.userNameTextController,
                    hintText: 'Username',
                    prefixIcon: Icon(
                      AntDesign.user,
                      size: 18.sp,
                    ),
                  ),


                  SizedBox(
                    height: 20.h,
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
                    text: 'Sign Up',
                    onPress: () {
                      logic.registerUser(context);
                    },
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