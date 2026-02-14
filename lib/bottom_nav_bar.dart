import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;

  const BottomNavBar({super.key, this.initialIndex = 0});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _currentIndex;

  final List<Widget> _pages = const [
    _DemoPage(title: "Home"),
    _DemoPage(title: "Library"),
    _DemoPage(title: "Sirius AI"),
    _DemoPage(title: "Profile"),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          const BorderRadius.vertical(top: Radius.circular(18)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius:
          const BorderRadius.vertical(top: Radius.circular(18)),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _currentIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                    FluentSystemIcons.ic_fluent_home_regular),
                activeIcon: Icon(
                    FluentSystemIcons.ic_fluent_home_filled),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    FluentSystemIcons.ic_fluent_library_regular),
                activeIcon: Icon(
                    FluentSystemIcons.ic_fluent_library_filled),
                label: "Library",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    FluentSystemIcons.ic_fluent_bot_regular),
                activeIcon: Icon(
                    FluentSystemIcons.ic_fluent_bot_filled),
                label: "Sirius",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    FluentSystemIcons.ic_fluent_person_regular),
                activeIcon: Icon(
                    FluentSystemIcons.ic_fluent_person_filled),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DemoPage extends StatelessWidget {
  final String title;

  const _DemoPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$title Screen (Demo Version)",
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
