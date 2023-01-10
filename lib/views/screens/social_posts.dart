import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/views/widgets/appbar.dart';
import 'package:custodia_provider/views/widgets/post.dart';
import 'package:flutter/material.dart';

class SocialPosts extends StatelessWidget {
  const SocialPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Social posts'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const YMargin(15),
              ListView.separated(
                itemBuilder: (context, index) => const Post(
                  hasMedia: false,
                ),
                separatorBuilder: (context, index) => const YMargin(12),
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              const YMargin(12),
            ],
          ),
        ),
      ),
    );
  }
}
