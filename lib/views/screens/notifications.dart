import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/views/widgets/appbar.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Notifications'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 15,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 16,
                  ),
                  const XMargin(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text.rich(
                        TextSpan(
                          text: '',
                          children: <InlineSpan>[
                            TextSpan(
                              text: '@stephanie',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' commented on your post',
                            ),
                          ],
                        ),
                      ),
                      YMargin(3),
                      Text(
                        '3 hours ago',
                        style: TextStyle(
                          fontSize: 12,
                          color: grey,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
