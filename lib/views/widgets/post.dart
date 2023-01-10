import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/views/screens/full_photo.dart';
import 'package:custodia_provider/views/screens/post_details.dart';
import 'package:custodia_provider/views/widgets/bottom_sheet.dart';

class Post extends StatelessWidget {
  const Post({
    Key? key,
    required this.hasMedia,
  }) : super(key: key);

  final bool hasMedia;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PostDetails(post: 'hi'),
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: .5,
            color: lightGrey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                    ),
                    const XMargin(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '@yetundewonda',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        YMargin(4),
                        Text(
                          '2 hrs ago',
                          style: TextStyle(
                            color: grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () => CustomBottomSheet(
                    context: context,
                    body: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: const BoxDecoration(
                                  color: black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              const XMargin(15),
                              const Text(
                                'Copy text',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const YMargin(30),
                          Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: const BoxDecoration(
                                  color: black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              const XMargin(15),
                              const Text(
                                'Delete post',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ).modalBottomSheet(),
                  child: const Icon(
                    Icons.more_horiz,
                    size: 19,
                    color: grey,
                  ),
                ),
              ],
            ),
            const YMargin(15),
            Row(
              children: const [
                Flexible(
                  child: Text(
                    'I took 7,348 steps today, a new record for me. I’m so proud of myself!',
                    style: TextStyle(
                      height: 1.4,
                      fontSize: 13.5,
                    ),
                  ),
                )
              ],
            ),
            hasMedia
                ? Column(
                    children: [
                      const YMargin(15),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullPhoto(
                              path:
                                  'https://pyxis.nymag.com/v1/imgs/361/d5b/c3d6afff0017b0bd01c82eb3e84eb8cd5a-michael-b-jordan.rsquare.w1200.jpg',
                            ),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            placeholder: (context, url) => Container(
                              width: 150,
                              height: 230,
                              color: lightBlue,
                              child: Center(
                                child: Platform.isAndroid
                                    ? const CircularProgressIndicator(
                                        color: blue,
                                      )
                                    : const CupertinoActivityIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              'images/img_not_available.jpeg',
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            imageUrl:
                                'https://pyxis.nymag.com/v1/imgs/361/d5b/c3d6afff0017b0bd01c82eb3e84eb8cd5a-michael-b-jordan.rsquare.w1200.jpg',
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
            const YMargin(18),
            Row(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.thumb_up,
                      size: 16,
                    ),
                    XMargin(3),
                    Text(
                      '143',
                      style: TextStyle(
                        fontSize: 13,
                        color: grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const XMargin(25),
                Row(
                  children: const [
                    Icon(
                      Icons.thumb_up,
                      size: 16,
                    ),
                    XMargin(3),
                    Text(
                      '15',
                      style: TextStyle(
                        fontSize: 13,
                        color: grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
