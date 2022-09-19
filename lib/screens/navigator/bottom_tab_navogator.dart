import 'package:flutter/material.dart';
import 'package:movie_app/screens/navigator/bottom_item.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.currentTab, required this.onSelectTab});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Image.asset(
              'assets/icons/home.png',
              height: 22,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Image.asset(
              'assets/icons/like.png',
              height: 22,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Image.asset(
              'assets/icons/ticket.png',
              height: 22,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Image.asset(
              'assets/icons/Account.png',
              height: 22,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Image.asset(
              'assets/icons/shuffle.png',
              height: 22,
            ),
          ),
          label: 'Home',
        ),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
    );
  }
}
