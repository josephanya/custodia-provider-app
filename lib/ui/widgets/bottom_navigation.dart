import 'package:custodia_provider/services/notifications/push_notification_service.dart';
import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/custom_icons.dart';
import 'package:custodia_provider/ui/core/constants/fonts.dart';
import 'package:custodia_provider/ui/views/chats/conversations/conversation_list.dart';
import 'package:custodia_provider/ui/views/patients/patients_list/patients_list.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/ui/views/home/alerts_list/alerts_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavigation extends ConsumerStatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends ConsumerState<BottomNavigation> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const ConversationList(),
    const PatientsList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    ref.read(pushNotificationsProvider).requestPermission();
    ref.read(pushNotificationsProvider).saveDeviceToken();
    ref.read(pushNotificationsProvider).setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: .5.w,
            color: AppColors.lightGrey,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CustomIcon.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcon.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcon.profile),
              label: 'Patients',
            ),
          ],
          selectedLabelStyle: const TextStyle(
            fontFamily: Fonts.kPrimary,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: Fonts.kPrimary,
          ),
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.grey,
          unselectedFontSize: 11.5,
          selectedFontSize: 11.5,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
