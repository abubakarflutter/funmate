import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:funmate/utils/constants.dart';
import 'package:get/get.dart';

import '../add_video/model_video.dart';
import 'state.dart';

class FeedScreenLogic extends GetxController {
  final FeedScreenState state = FeedScreenState();

  final Rx<List<ModelVideo>> _videosList = Rx<List<ModelVideo>>([]);

  List<ModelVideo> get videosList => _videosList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _videosList.bindStream(
        fireStore.collection('videos').snapshots().map((QuerySnapshot query) {
      List<ModelVideo> retrievedVideo = [];

      for (var element in query.docs) {
        retrievedVideo.add(ModelVideo.fromSnap(element));
      }

      return retrievedVideo;
    }));
  }
}