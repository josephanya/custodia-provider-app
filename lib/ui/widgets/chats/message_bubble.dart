import 'package:cached_network_image/cached_network_image.dart';
import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/views/photo/full_photo.dart';
import 'package:custodia_provider/ui/widgets/utils/loader.dart';
// import 'package:custodia/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';
// import 'package:url_launcher/url_launcher.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.content,
    required this.isMe,
    // required this.time,
    required this.type,
  }) : super(key: key);

  final String content;
  final bool isMe;
  // final DateTime time;
  final String type;

  @override
  Widget build(BuildContext context) {
    final bgColor = isMe ? AppColors.blue : AppColors.offWhite;
    final textColor = isMe ? AppColors.white : Colors.black87;
    // final timeColor = isMe ? AppColors.lightBlue : AppColors.grey;
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = isMe
        ? const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 250.w),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: radius,
            ),
            child: (type == 'image')
                ? GestureDetector(
                    child: Material(
                      borderRadius: radius,
                      clipBehavior: Clip.hardEdge,
                      child: CachedNetworkImage(
                        placeholder: (context, url) => Container(
                          width: 150.w,
                          height: 230.h,
                          color: AppColors.lightBlue,
                          child: const Center(
                            child: Loader(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          'images/img_not_available.jpeg',
                          width: 150.w,
                          height: 230.h,
                          fit: BoxFit.cover,
                        ),
                        imageUrl: content,
                        width: 150.w,
                        height: 230.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullPhoto(
                          path: content,
                        ),
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                    child: Column(
                      crossAxisAlignment: align,
                      children: [
                        GestureDetector(
                          onLongPress: () {
                            Clipboard.setData(
                              ClipboardData(
                                text: content,
                              ),
                            ).then((_) {
                              toast('Text copied to clipboard');
                            });
                          },
                          child: Column(
                            children: [
                              // Linkify(
                              //   onOpen: (link) async {
                              //     if (await canLaunchUrl(Uri.parse(link.url))) {
                              //       await launchUrl(Uri.parse(link.url));
                              //     } else {
                              //       throw 'Could not launch $link';
                              //     }
                              //   },
                              //   text: content,
                              //   style: TextStyle(
                              //     color: textColor,
                              //     fontSize: FontSize.s13,
                              //     height: 1.33.h,
                              //   ),
                              //   linkStyle: TextStyle(
                              //     color: textColor,
                              //     fontSize: FontSize.s13,
                              //     height: 1.33.h,
                              //     decoration: TextDecoration.underline,
                              //   ),
                              // ),
                              Text(
                                content,
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: FontSize.s13,
                                  height: 1.33.h,
                                ),
                              )
                            ],
                          ),
                        ),
                        // const YMargin(5),
                        // Text(
                        //   DateFormat('hh:mm aaa').format(time),
                        //   style: TextStyle(
                        //     color: timeColor,
                        //     fontSize: 9.sp,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
