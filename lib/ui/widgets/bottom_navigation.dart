import 'package:custodia_provider/ui/core/theme/custom_icons.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/chats/chat_list.dart';
import 'package:custodia_provider/ui/views/patients/patients_list/patients_list.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/ui/core/routes.dart';
import 'package:custodia_provider/ui/views/home/home.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const ChatsList(),
    const PatientsList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData(context),
      onGenerateRoute: RouteGenerator.generateRoute,
      home: Scaffold(
        backgroundColor: white,
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: .5,
              color: lightGrey,
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: white,
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
              fontFamily: 'Circular Std',
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'Circular Std',
            ),
            currentIndex: _selectedIndex,
            selectedItemColor: blue,
            unselectedItemColor: grey,
            unselectedFontSize: 11.5,
            selectedFontSize: 11.5,
            onTap: _onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ),
      ),
    );
  }
}
