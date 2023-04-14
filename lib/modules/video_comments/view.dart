import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:funmate/modules/video_comments/components/widget_comment_detail.dart';
import 'package:funmate/utils/colors.dart';
import 'package:funmate/utils/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../custom_widgets/custom_text_field.dart';
import '../../general_controller/general_controller.dart';
import 'logic.dart';

class VideoCommentsPage extends StatelessWidget {
  final String docId;


  VideoCommentsPage({Key? key, required this.docId}) : super(key: key);

  final logic = Get.put(VideoCommentsLogic());
  final state = Get
      .find<VideoCommentsLogic>()
      .state;

  @override
  Widget build(BuildContext context) {


    logic.getComments(docId);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Comments',
          style: TextStyle(
            // color: Colors.white
          ),),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: logic.commentList.length,
                    itemBuilder: (context, index) {
                      var commentDetail = logic.commentList[index];
                      return CommentWidget(
                        photoUrl: commentDetail.profilePhoto,
                        userName: commentDetail.username,
                        commentTime: "",
                        // commentTime: commentDetail.datePublished.toString(),
                        commentContent: commentDetail.commentContent,
                        commentLikeCount: commentDetail.likes.length.toString(),
                        likeIndicateText: commentDetail.likes.contains(GeneralController.to.user.uid) ? 'You Like' : 'Like?',
                        favIcon: InkWell(
                          onTap: () => logic.likeCommentFunc(docId, commentDetail.id),
                          child: Icon(
                            commentDetail.likes.contains(GeneralController.to.user.uid) ? FontAwesome.heart : FontAwesome.heart_o,
                            size: 16,
                            color: commentDetail.likes.contains(GeneralController.to.user.uid) ?  Colors.red : kSoftBlackColor,
                            // color: Colors.red,
                          ),
                        ),
                      );
                    });
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MyCustomTextField(
                        controller: logic.commentTextController,
                        hintText: 'Enter Comment Here',
                        textFieldHeigh: 40
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  InkWell(
                    onTap: () {
                      logic.postComment(docId, context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kCustomBlueColor,
                      ),
                      child: const Icon(
                        FontAwesome.send_o,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  )

                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}