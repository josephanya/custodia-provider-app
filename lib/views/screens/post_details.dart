import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/views/widgets/appbar.dart';
import 'package:custodia_provider/views/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({
    Key? key,
    required this.post,
  }) : super(key: key);

  final String post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Post'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    const YMargin(17),
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
                              height: 1.357,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                    const YMargin(15),
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
                    const YMargin(15)
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  children: const [
                    YMargin(16),
                    Comment(),
                    YMargin(27),
                    Comment(),
                    YMargin(27),
                    Comment(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Comment extends StatelessWidget {
  const Comment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 15,
        ),
        const XMargin(14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '@richie',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const YMargin(5),
              const Text(
                'I took 7,348 steps today, a new record for me. I’m so proud of myself!',
                style: TextStyle(
                  height: 1.32,
                  fontSize: 13,
                ),
              ),
              const YMargin(11),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Reply',
                        style: TextStyle(
                          fontSize: 13,
                          color: grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      XMargin(25),
                      Text(
                        'Like',
                        style: TextStyle(
                          fontSize: 13,
                          color: grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        '15',
                        style: TextStyle(
                          fontSize: 13,
                          color: grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      XMargin(3),
                      Icon(
                        Icons.heart_broken,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
