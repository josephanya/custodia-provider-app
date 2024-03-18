import 'package:custodia_provider/services/notifications/push_notification_service.dart';
import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/custom_icons.dart';
import 'package:custodia_provider/ui/core/constants/fonts.dart';
import 'package:custodia_provider/ui/views/bottom_navigation/bottom_navigation_vm.dart';
import 'package:custodia_provider/ui/views/chats/conversations/conversation_list.dart';
import 'package:custodia_provider/ui/views/home/alerts_list/alerts_list.dart';
import 'package:custodia_provider/ui/views/patients/patients_list/patients_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavigation extends ConsumerStatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends ConsumerState<BottomNavigation> {
  late PageController _pageController;

  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const ConversationList(),
    const PatientsList(),
  ];

  void _onChangedTab(int index) {
    ref.read(activeTabProvider.notifier).updateActiveTab(index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    if (index == 1) {
      ref.read(unreadMessagesProvider.notifier).resetUnreadMessagesCount();
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    ref.read(pushNotificationsProvider).requestPermission();
    ref.read(pushNotificationsProvider).saveDeviceToken();
    ref.read(pushNotificationsProvider).setupInteractedMessage();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeTabIndex = ref.watch(activeTabProvider);
    final unreadMessagesCount = ref.watch(unreadMessagesProvider);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: PageView(
        controller: _pageController,
        children: _widgetOptions,
        onPageChanged: (index) {
          ref.read(activeTabProvider.notifier).updateActiveTab(index);
          if (index == 1) {
            ref
                .read(unreadMessagesProvider.notifier)
                .resetUnreadMessagesCount();
          }
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: .5,
            color: AppColors.lightGrey,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(
                CustomIcon.home,
                size: 22,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  const Icon(
                    CustomIcon.chat,
                    size: 22,
                  ),
                  if (unreadMessagesCount > 0)
                    const Positioned(
                      top: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: AppColors.red,
                      ),
                    ),
                ],
              ),
              label: 'Chats',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                CustomIcon.profile,
                size: 22,
              ),
              label: 'Patients',
            ),
          ],
          selectedLabelStyle: const TextStyle(
            fontFamily: Fonts.kPrimary,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: Fonts.kPrimary,
          ),
          currentIndex: activeTabIndex,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.grey,
          unselectedFontSize: 11,
          selectedFontSize: 11,
          onTap: _onChangedTab,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
