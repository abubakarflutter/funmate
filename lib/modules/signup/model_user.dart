import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  String profilePhoto;
  String uid;



  UserModel({
     required this.name,
     required this.email,
     required this.profilePhoto,
     required this.uid,
  });


  Map<String, dynamic> toJson() => {
    'username': name,
    'email': email,
    'profile_photo': profilePhoto,
    'uid': uid,
  };


  static UserModel fromSnap(DocumentSnapshot documentSnapshot) {
    var doc = documentSnapshot.data() as Map<String, dynamic>;
    return UserModel(
      email: doc['email'],
      name: doc['name'],
      profilePhoto: doc['profile_photo'],
      uid: doc['uid'],
    );
  }

}