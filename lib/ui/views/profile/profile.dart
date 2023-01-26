import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/buttons.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final List accountOptions = [
  {'name': 'My details', 'route': '/my-details'},
  {'name': 'Change password', 'route': '/change-password'},
];

final List aboutOptions = [
  {'name': 'Help center', 'url': 'https://helpcenter.custodiahealth.com'},
  {
    'name': 'Privacy policy',
    'url': 'https://custodiahealth.com/privacy-policy'
  },
  {'name': 'Terms of use', 'url': 'https://custodiahealth.com/terms-of-use'},
];

final List logoutOptions = [
  {'name': 'Logout', 'route': '/log-weight'},
];

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  Future<void> _openLink(String urlString) async {
    final Uri url = Uri.parse(urlString);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

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
                    buttonText: 'Edit photo',
                  ),
                ],
              ),
              const YMargin(15),
              const Text(
                'Joseph Anya',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(4),
              const Text(
                'josephanya4real@gmail.com',
                style: TextStyle(
                  fontSize: 13,
                  color: grey,
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
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 10,
                              ),
                              const XMargin(16),
                              Text(
                                accountOptions[index]['name'],
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: grey,
                            size: 18,
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
                      vertical: 17.5,
                    ),
                    child: InkWell(
                      onTap: () => _openLink(aboutOptions[index]['url']),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 10,
                              ),
                              const XMargin(16),
                              Text(
                                aboutOptions[index]['name'],
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: grey,
                            size: 18,
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
              const YMargin(40),
              DefaultCard(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 17.5,
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, logoutOptions[index]['route']),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 10,
                              ),
                              const XMargin(16),
                              Text(
                                logoutOptions[index]['name'],
                                style: const TextStyle(
                                  color: red,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: grey,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: logoutOptions.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
              const YMargin(20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                child: Center(
                  child: Text(
                    'Version 1.0.0 \n Copyright © 2022 Custodia Health',
                    style: TextStyle(
                      color: grey,
                      height: 1.615,
                      fontSize: 13,
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
