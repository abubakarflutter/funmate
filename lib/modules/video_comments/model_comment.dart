import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String username;
  String commentContent;
  dynamic datePublished;
  String profilePhoto;
  String uid;
  String id;
  List likes;



  CommentModel({
    required this.username,
    required this.commentContent,
    required this.datePublished,
    required this.profilePhoto,
    required this.uid,
    required this.id,
    required this.likes,
  });


  Map<String, dynamic> toJson() => {
    'username': username,
    'comment': commentContent,
    'comment_date': datePublished,
    'profile_photo': profilePhoto,
    'uid': uid,
    'id': id,
    'likes': likes,
  };


  static CommentModel fromSnap(DocumentSnapshot documentSnapshot) {
    var doc = documentSnapshot.data() as Map<String, dynamic>;
    return CommentModel(
      username: doc['username'],
      commentContent: doc['comment'],
      datePublished: doc['comment_date'],
      profilePhoto: doc['profile_photo'],
      uid: doc['uid'],
      id: doc['id'],
      likes: doc['likes'],
    );
  }

}