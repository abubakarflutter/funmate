import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funmate/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentWidget extends StatelessWidget {

  final String photoUrl, userName, commentTime, commentContent,
      commentLikeCount, likeIndicateText;
  final Widget favIcon;


  const CommentWidget({
    super.key,
    required this.photoUrl,
    required this.userName,
    required this.commentTime,
    required this.commentContent,
    required this.commentLikeCount,
    required this.likeIndicateText,
    required this.favIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 20
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
                photoUrl),
          ),

          const SizedBox(
            width: 15,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      userName,
                      style: GoogleFonts.leagueSpartan(
                        color: kSoftBlackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),

                    Text(
                      commentTime,
                      // "5 min ago",
                      style: GoogleFonts.leagueSpartan(
                        color: kSoftBlackColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 12.sp,
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  // width: MediaQuery.of(context).size.width - 100,
                    child: Text(
                      commentContent,
                      style: GoogleFonts.leagueSpartan(
                        color: kSoftBlackColor,
                        fontWeight: FontWeight.w400,
                        height: 1.1,
                        fontSize: 14.sp,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      likeIndicateText,
                      style: GoogleFonts.leagueSpartan(
                        color: likeIndicateText == "Like?" ? kSoftBlackColor.withOpacity(.3) : Colors.red,
                        fontWeight: likeIndicateText == "Like?" ? FontWeight.w400 : FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),

                    // Expanded(child: Container()),

                    Row(
                      children: [
                        favIcon,
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          commentLikeCount,
                          style: GoogleFonts.leagueSpartan(
                            color: kSoftBlackColor,
                            fontWeight: FontWeight.w400,
                            // height: 1.1,
                            fontSize: 14.sp,
                          ),
                        ),

                      ],
                    )

                  ],
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}