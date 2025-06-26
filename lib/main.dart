import 'package:flutter/material.dart';
import 'SensorAndStatus.dart';
import 'ControlPage.dart';
import 'NotificationPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    SensorDashboard(),
    ControlPage(),
    NotificationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(index: _currentIndex, children: _pages),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: _RoundedIcon(
                icon: Icons.home_rounded,
                isSelected: _currentIndex == 0,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _RoundedIcon(
                icon: Icons.tune,
                isSelected: _currentIndex == 1,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _RoundedIcon(
                icon: Icons.notifications,
                isSelected: _currentIndex == 2,
              ),
              label: '',
            ),
          ],
          selectedItemColor: Color.fromARGB(255, 87, 163, 0),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class _RoundedIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;

  const _RoundedIcon({required this.icon, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color:
            isSelected
                ? Color.fromARGB(255, 87, 163, 0)
                : const Color.fromARGB(255, 255, 255, 255),
        shape: BoxShape.circle,
        border: Border.all(
          color:
              isSelected
                  ? Color.fromARGB(255, 87, 163, 0)
                  : const Color.fromARGB(112, 210, 210, 210),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Icon(
        icon,
        size: 28,
        color:
            isSelected
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}
