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
    const PatientsList(),
    const ChatsList(),
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
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    const Icon(Icons.forum),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(1.5),
                        decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: const Text(
                          '10',
                          style: TextStyle(
                            color: white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
                label: 'Patients',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'Chat',
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
          ),
        ),
      ),
    );
  }
}
