import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/views/screens/create_post.dart';
import 'package:custodia_provider/views/widgets/appbar.dart';
import 'package:custodia_provider/views/widgets/post.dart';
import 'package:flutter/material.dart';

class Groups extends StatelessWidget {
  const Groups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithActionWithoutBack(
        context,
        'Groups',
        const CreatePostButton(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 15,
          ),
          child: Column(
            children: const [
              Post(
                hasMedia: false,
              ),
              YMargin(12),
              Post(
                hasMedia: true,
              ),
              YMargin(12),
              Post(
                hasMedia: false,
              ),
              YMargin(12),
              Post(
                hasMedia: false,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 50,
        height: 50,
        child: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePost(),
            ),
          ),
          child: const Icon(
            Icons.add,
            color: white,
          ),
        ),
      ),
    );
  }
}

class CreatePostButton extends StatelessWidget {
  const CreatePostButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreatePost(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          decoration: const BoxDecoration(
            color: lightBlue,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(6.0),
            child: Icon(
              Icons.add,
              size: 16,
              color: blue,
            ),
          ),
        ),
      ),
    );
  }
}
