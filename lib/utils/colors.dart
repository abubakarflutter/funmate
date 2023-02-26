import 'package:flutter/material.dart';

const Color kScaffoldWhiteColor = Color(0xfff7f7f7);
const Color kSoftBlackColor = Color(0xff0e1111);
const Color kPrimaryBlueColor = Color(0xff33ccff);




///----- Primary Color Blue - Schemes
Map<int, Color> color =
{
  50:Color.fromRGBO(51,204,255, .1),
  100:Color.fromRGBO(51,204,255, .2),
  200:Color.fromRGBO(51,204,255, .3),
  300:Color.fromRGBO(51,204,255, .4),
  400:Color.fromRGBO(51,204,255, .5),
  500:Color.fromRGBO(51,204,255, .6),
  600:Color.fromRGBO(51,204,255, .7),
  700:Color.fromRGBO(51,204,255, .8),
  800:Color.fromRGBO(51,204,255, .9),
  900:Color.fromRGBO(51,204,255, 1),
};

MaterialColor kCustomBlueColor = MaterialColor(0xFF33ccff, color);