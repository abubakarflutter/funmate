import 'package:flutter/material.dart';


class AnimatedImage extends StatefulWidget {
  final dynamic thumbnailUrl;

  const AnimatedImage({super.key,required this.thumbnailUrl});

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Stack(
            children: [
              Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.white,
                      Colors.grey
                    ]),
                  ),
                  child: Image.network(widget.thumbnailUrl,
                   fit: BoxFit.cover,
                  )),
              Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    gradient:  LinearGradient(
                        colors: [
                      Colors.black12.withOpacity(.2),
                      Colors.black26.withOpacity(.3),
                    ]),
                  ),
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}