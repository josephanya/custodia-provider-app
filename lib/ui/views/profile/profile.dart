import 'package:custodia_provider/ui/core/theme/custom_icons.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/auth/login/login_vm.dart';
import 'package:custodia_provider/ui/views/profile/profile_vm.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(profileProvider);
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
              CircleAvatar(
                radius: 30,
                child: Text(
                  '${provider.provider?.firstName![0].toUpperCase()}${provider.provider?.lastName![0].toUpperCase()}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const YMargin(15),
              Text(
                '${provider.provider?.firstName} ${provider.provider?.lastName}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(4),
              Text(
                '${provider.provider?.email} ',
                style: const TextStyle(
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
                child: Column(
                  children: const [
                    Option(
                      optionName: 'Personal details',
                      optionRoute: '/personal-details',
                      icon: Icon(
                        CustomIcon.information,
                        size: 20,
                        color: blue,
                      ),
                    ),
                    // Option(
                    //   optionName: 'Change password',
                    //   optionRoute: '/change-pasword',
                    //   icon: Icon(
                    //     CustomIcon.asterisk,
                    //     size: 20,
                    //     color: blue,
                    //   ),
                    // ),
                  ],
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
                child: Column(
                  children: const [
                    LinkOption(
                      optionName: 'Help center',
                      optionLink: 'https://helpcenter.custodiahealth.com',
                      icon: Icon(
                        CustomIcon.help,
                        size: 20,
                        color: blue,
                      ),
                    ),
                    LinkOption(
                      optionName: 'Privacy policy',
                      optionLink: 'https://custodiahealth.com/privacy-policy',
                      icon: Icon(
                        CustomIcon.privacy_policy,
                        size: 20,
                        color: blue,
                      ),
                    ),
                    LinkOption(
                      optionName: 'Terms of use',
                      optionLink: 'https://custodiahealth.com/terms-of-use',
                      icon: Icon(
                        CustomIcon.terms,
                        size: 20,
                        color: blue,
                      ),
                    ),
                  ],
                ),
              ),
              const YMargin(40),
              DefaultCard(
                onPress: () async {
                  ref.read(loginProvider).logout();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 17.5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            CustomIcon.logout,
                            size: 20,
                            color: red,
                          ),
                          XMargin(16),
                          Text(
                            'Logout',
                            style: TextStyle(),
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

class LinkOption extends StatelessWidget {
  const LinkOption({
    required this.optionName,
    required this.optionLink,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String optionName, optionLink;
  final Icon icon;

  Future<void> _openLink(String urlString) async {
    final Uri url = Uri.parse(urlString);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 17.5,
      ),
      child: InkWell(
        onTap: () => _openLink(optionLink),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                const XMargin(16),
                Text(
                  optionName,
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
    );
  }
}

class Option extends StatelessWidget {
  const Option({
    required this.optionName,
    required this.optionRoute,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String optionName, optionRoute;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 17.5,
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, optionRoute),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                const XMargin(16),
                Text(optionName),
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
    );
  }
}
