import 'package:flutter/material.dart';
import 'package:funmate/custom_widgets/custom_thumbnail_rotation.dart';
import 'package:funmate/custom_widgets/single_video_player.dart';
import 'package:funmate/general_controller/general_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'logic.dart';

class FeedScreenPage extends StatelessWidget {
  final logic = Get.put(FeedScreenLogic());
  final state = Get
      .find<FeedScreenLogic>()
      .state;

  FeedScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        return PageView.builder(
            itemCount: logic.videosList.length,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {

              var videoItem = logic.videosList[index];

              return Stack(
                children: [

                  SingleVideoPlayer(
                    videoUrl: videoItem.videoUrl,
                  ),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [


                              Expanded(child: Container(
                                // color: Colors.grey,
                                padding: const EdgeInsets.only(
                                    left: 10
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(videoItem.userName ?? "",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    Text('description caption',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                    Row(
                                      children: [

                                        const Icon(
                                          Icons.music_note,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(videoItem.caption ?? "",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),


                                      ],
                                    )


                                  ],
                                ),
                              )),


                              Container(
                                // color: Colors.yellow,
                                margin: EdgeInsets.only(
                                  top: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 2.6,
                                  right: 10
                                ),
                                child: Column(

                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,

                                  children: [


                                    //----- Profile Photo
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      clipBehavior: Clip.none,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              100),
                                          child: SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Image.network(
                                              videoItem.userProfilePhoto ?? "",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          bottom: -8,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4,
                                                horizontal: 4
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius
                                                    .circular(50)
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              size: 10,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),

                                    //--- Like Button
                                    GestureDetector(
                                      onTap: () => logic.likeVideoFunc(videoItem.id),
                                      child: Column(
                                        children: [
                                           Icon(
                                            Icons.favorite,
                                            color: (videoItem.likes ?? []).contains(GeneralController.to.user.uid) ? Colors.red : Colors.white,
                                            size: 35,
                                          ),
                                          Text(
                                            (videoItem.likes ?? []).length.toString(),
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),

                                    //--- Comment Button
                                    Column(
                                      children: [
                                        const Icon(
                                          Icons.chat,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                        Text('0',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),

                                      ],
                                    ),

                                    //--- Comment Button
                                    Column(
                                      children: [

                                        const Icon(
                                          Icons.share,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                        Text('0',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),

                                      ],
                                    ),


                                    //---- Song Thumbnail Rotation
                                    const AnimatedImage(
                                      thumbnailUrl:
                                      'https://images.unsplash.com/photo-1679599441274-6dcac44dba0a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=873&q=80',
                                    ),

                                  ],
                                ),
                              ),


                            ],
                          )),
                    ],
                  )


                ],
              );
            });
      }),
    );
  }
}