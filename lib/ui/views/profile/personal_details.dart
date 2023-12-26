import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/views/profile/profile_vm.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PersonalDetails extends ConsumerWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(profileProvider);
    return Scaffold(
      appBar: appBar(context, 'Personal details'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 15.h,
          ),
          child: Column(
            children: [
              DefaultCard(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 25.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'First name',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: FontSize.s14,
                            ),
                          ),
                          Text(
                            '${provider.user?.firstName}',
                            style: TextStyle(
                              fontSize: FontSize.s14,
                            ),
                          ),
                        ],
                      ),
                      const YMargin(29),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Last name',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: FontSize.s14,
                            ),
                          ),
                          Text(
                            '${provider.user?.lastName}',
                            style: TextStyle(
                              fontSize: FontSize.s14,
                            ),
                          ),
                        ],
                      ),
                      const YMargin(29),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: FontSize.s14,
                              color: AppColors.grey,
                            ),
                          ),
                          Text(
                            '${provider.user?.email}',
                            style: TextStyle(
                              fontSize: FontSize.s14,
                            ),
                          ),
                        ],
                      ),
                    ],
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
