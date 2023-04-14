import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:funmate/custom_widgets/custom_loader.dart';
import 'package:funmate/custom_widgets/custom_snackbar_styling.dart';
import 'package:funmate/modules/video_comments/model_comment.dart';
import 'package:get/get.dart';

import '../../general_controller/general_controller.dart';
import '../../utils/constants.dart';
import 'state.dart';

class VideoCommentsLogic extends GetxController {
  final VideoCommentsState state = VideoCommentsState();
  final CustomLoader loader = CustomLoader();

  TextEditingController commentTextController = TextEditingController();

  final Rx<List<CommentModel>> _commentList = Rx<List<CommentModel>>([]);

  List<CommentModel> get commentList => _commentList.value;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // _commentList.bindStream(
    //     fireStore.collection('videos').doc().collection('comments').snapshots().map((QuerySnapshot query) {
    //       List<CommentModel> retrievedComments = [];
    //
    //       for (var element in query.docs) {
    //         retrievedComments.add(CommentModel.fromSnap(element));
    //       }
    //
    //       return retrievedComments;
    //     }));
  }


  getComments(String postDocId) async {
    _commentList.bindStream(
        fireStore.collection('videos').doc(postDocId).collection('comments').snapshots().map((QuerySnapshot query) {
          List<CommentModel> retrievedComments = [];

          for (var element in query.docs) {
            retrievedComments.add(CommentModel.fromSnap(element));
          }

          return retrievedComments;
        }));
  }


  postComment(String postDocId,BuildContext context) async {
    if (commentTextController.text.isEmpty ||
        commentTextController.text.trim() == '') {
      //--- please enter valid comment
      customSnackBar(
        title: 'Sorry',
        message: 'Please enter valid comment',
      );
    } else {
      try {

        loader.showLoader(context);


        String uid = firebaseAuth.currentUser!.uid;
        DocumentSnapshot userDocSnap =
            await fireStore.collection('users').doc(uid).get();


        var commentDocSnaps =
        await fireStore.collection('videos').doc(postDocId).collection('comments').get();
        int length = commentDocSnaps.docs.length;

        CommentModel commentModel = CommentModel(
            username: (userDocSnap.data() as Map<String, dynamic>)['username'],
            commentContent: commentTextController.text,
            datePublished: FieldValue.serverTimestamp(),
            profilePhoto:
                (userDocSnap.data() as Map<String, dynamic>)['profile_photo'],
            uid: uid,
            id: "comment $length",
            likes: []);

        await fireStore
            .collection("videos")
            .doc(postDocId)
            .collection('comments')
            .doc("comment $length")
            .set(commentModel.toJson());


        commentTextController.clear();
        loader.hideLoader();

        customSnackBar(
          title: 'Congratulations',
          message: 'Comment has been shared successfully',
        );
      } catch (e) {
        loader.hideLoader();
        log("Error $e");
        customSnackBar(
          title: 'Error Posting Comment',
          message: '$e',
        );
      }
    }
  }


  likeCommentFunc(String videoId, String commentId) async {
    DocumentSnapshot doc = await fireStore.collection('videos').doc(videoId).collection("comments").doc(commentId).get();
    if((doc.data() as dynamic)['likes'].contains(GeneralController.to.user.uid)) {
      await doc.reference.update(
          {
            'likes': FieldValue.arrayRemove([GeneralController.to.user.uid])
          }
      );
    } else {
      await doc.reference.update({
        'likes': FieldValue.arrayUnion([GeneralController.to.user.uid])
      });
    }

  }
}