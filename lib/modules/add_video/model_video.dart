import 'package:cloud_firestore/cloud_firestore.dart';

class ModelVideo{
  String? userName;
  String? uid;
  String? id;
  List? likes;
  int? commentCount;
  String? songName;
  String? caption;
  String? videoUrl;
  String? thumbnailUrl;
  String? userProfilePhoto;


  ModelVideo({
    required this.userName,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.userProfilePhoto,
});


  Map<String, dynamic> toJson() => {
    'username': userName,
    'uid': uid,
    'id': id,
    'likes': likes,
    'comment_count': commentCount,
    'song_name': songName,
    'caption': caption,
    'video_url': videoUrl,
    'thumbnail_url': thumbnailUrl,
    'user_profile_photo': userProfilePhoto,
  };

  static ModelVideo fromSnap(DocumentSnapshot documentSnapshot) {
    var doc = documentSnapshot.data() as Map<String, dynamic>;
    return ModelVideo(
      userName: doc['email'],
      uid: doc['name'],
      id: doc['profile_photo'],
      likes: doc['likes'],
      commentCount: doc['comment_count'],
      songName: doc['song_name'],
      caption: doc['caption'],
      videoUrl: doc['video_url'],
      thumbnailUrl: doc['thumbnail_url'],
      userProfilePhoto: doc['user_profile_photo'],
    );
  }


}