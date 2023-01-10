import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/views/widgets/appbar.dart';
import 'package:custodia_provider/views/widgets/buttons.dart';
import 'package:custodia_provider/views/widgets/default_card.dart';
import 'package:flutter/material.dart';

final List accountOptions = [
  {'name': 'Social posts', 'route': '/social-posts'},
  {'name': 'Notification settings', 'route': '/notification-settings'},
  {'name': 'Working hours', 'route': '/working-hours'},
];

final List aboutOptions = [
  {'name': 'Privacy policy', 'route': '/log-weight'},
  {'name': 'Terms of use', 'route': '/log-weight'},
];

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, ''),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 35,
                  ),
                  TetiaryButtonOutlined(
                    onPress: () =>
                        Navigator.pushNamed(context, '/edit-profile'),
                    buttonText: 'Edit profile',
                  ),
                ],
              ),
              const YMargin(20),
              const Text(
                'Dr. Yetunde Wonda',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(7),
              const Text(
                '@yetundewonda',
                style: TextStyle(
                  color: grey,
                  fontSize: 13,
                ),
              ),
              const YMargin(15),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.428,
                ),
              ),
              const YMargin(35),
              const Text(
                'My account',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(15),
              DefaultCard(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 19,
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, accountOptions[index]['route']),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            accountOptions[index]['name'],
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: grey,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: accountOptions.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
              const YMargin(40),
              const Text(
                'About',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(15),
              DefaultCard(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 19,
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, aboutOptions[index]['route']),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            aboutOptions[index]['name'],
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: grey,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: aboutOptions.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
              const YMargin(50),
              SecondaryButton(
                buttonText: 'Logout',
                onPressed: () => null,
                color: red,
              ),
              const YMargin(20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                child: Center(
                  child: Text(
                    'Version 1.3.0 \n Copyright © 2022 Lifebox Labs',
                    style: TextStyle(
                      color: grey,
                      height: 1.615,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
