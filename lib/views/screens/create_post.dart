import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/utils/register_provider.dart';
import 'package:custodia_provider/views/widgets/appbar.dart';
import 'package:custodia_provider/views/widgets/buttons.dart';

class CreatePost extends ConsumerWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(communityProvider);
    return Scaffold(
      appBar: appBarWithAction(
        context,
        'Create post',
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
          child: TetiaryButtonFilled(
            onPress: () => provider.sendPost(),
            buttonText: 'Post',
            isEnabled: provider.isButtonEnabled,
          ),
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 65),
            child: SingleChildScrollView(
              reverse: true,
              child: Form(
                key: provider.formKey,
                onChanged: () => provider.isValid(),
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: blue,
                      cursorWidth: 1.5,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Write a post...',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      maxLines: null,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: black,
                      ),
                      controller: provider.newPostTEC,
                    ),
                    const YMargin(15),
                    // Container(
                    //   height: 300,
                    //   width: double.infinity,
                    //   color: grey,
                    // ),
                    const YMargin(10),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                  width: .5,
                  color: lightGrey,
                )),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 13,
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.camera,
                      size: 24,
                      color: grey,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
