import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/core/constants/custom_icons.dart';
import 'package:custodia_provider/ui/views/auth/login/login_vm.dart';
import 'package:custodia_provider/ui/views/profile/profile_vm.dart';
import 'package:custodia_provider/ui/widgets/utils/appbar.dart';
import 'package:custodia_provider/ui/widgets/utils/default_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  @override
  void initState() {
    ref.read(profileProvider.notifier).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(profileProvider);
    return Scaffold(
      appBar: appBar(context, ''),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.blue,
                foregroundColor: AppColors.white,
                radius: 32.r,
                child: Text(
                  '${provider.user?.firstName![0].toUpperCase()}${provider.user?.lastName![0].toUpperCase()}',
                  style: TextStyle(
                    fontSize: FontSize.s20,
                  ),
                ),
              ),
              const YMargin(16),
              Text(
                '${provider.user?.firstName} ${provider.user?.lastName}',
                style: TextStyle(
                  fontSize: FontSize.s18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(4),
              Text(
                '${provider.user?.email} ',
                style: TextStyle(
                  fontSize: FontSize.s13,
                  color: AppColors.grey,
                ),
              ),
              const YMargin(32),
              Text(
                'My account',
                style: TextStyle(
                  fontSize: FontSize.s16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(12),
              const DefaultCard(
                child: Column(
                  children: [
                    Option(
                      optionName: 'Personal details',
                      optionRoute: '/personal-details',
                      icon: Icon(
                        CustomIcon.information,
                        size: 20,
                        color: AppColors.blue,
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
              const YMargin(32),
              Text(
                'About',
                style: TextStyle(
                  fontSize: FontSize.s16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(12),
              const DefaultCard(
                child: Column(
                  children: [
                    LinkOption(
                      optionName: 'Help center',
                      optionLink: 'https://wa.link/5pmuke',
                      icon: Icon(
                        CustomIcon.help,
                        size: 20,
                        color: AppColors.blue,
                      ),
                    ),
                    LinkOption(
                      optionName: 'Privacy policy',
                      optionLink: 'https://custodiahealth.com/privacy-policy',
                      icon: Icon(
                        CustomIcon.privacyPolicy,
                        size: 20,
                        color: AppColors.blue,
                      ),
                    ),
                    LinkOption(
                      optionName: 'Terms of use',
                      optionLink: 'https://custodiahealth.com/terms-of-use',
                      icon: Icon(
                        CustomIcon.terms,
                        size: 20,
                        color: AppColors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const YMargin(24),
              DefaultCard(
                onPress: () async {
                  ref.read(loginProvider.notifier).logout();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 17.5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            CustomIcon.logout,
                            size: 20,
                            color: AppColors.red,
                          ),
                          XMargin(16),
                          Text(
                            'Logout',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: AppColors.grey,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ),
              const YMargin(20),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 50.w,
                  vertical: 10.h,
                ),
                child: Center(
                  child: Text(
                    'Version 1.0.0 \n Copyright © 2023 Custodia Health',
                    style: TextStyle(
                      color: AppColors.grey,
                      height: 1.615.h,
                      fontSize: FontSize.s13,
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
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
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
                  style: TextStyle(
                    fontSize: FontSize.s14,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.grey,
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
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
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
                Text(
                  optionName,
                  style: TextStyle(
                    fontSize: FontSize.s14,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.grey,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
