
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:funmate/modules/feed_screen/view.dart';

import '../modules/add_video/view.dart';

///------ SCREENS
final bottomBarPages = [
  FeedScreenPage(),
  Text('Search Screen'),
  AddVideoPage(),
  Text('Chat Screen'),
  Text('Profile Screen'),
];



///------ PADDING  -  MARGINS
const double kScaffoldHorizontalPadding = 20;



///------ FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var fireStore = FirebaseFirestore.instance;