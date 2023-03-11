import 'package:flutter/material.dart';

class CustomUploadButton extends StatelessWidget {
  const CustomUploadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 30,
      child: Stack(
        children: [
          Container(
            width: 38,
            margin: EdgeInsets.only(
              left: 10,
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 45, 108),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            width: 38,
            margin: EdgeInsets.only(
              right: 10,
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 32, 211, 234),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Center(
            child: Container(
              width: 38,
              margin: EdgeInsets.symmetric(
                vertical: 2
              ),
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.add,
                color: Colors.black54,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}