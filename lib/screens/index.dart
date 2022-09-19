import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/index.dart';
import 'package:movie_app/screens/navigator/TabNavigator.dart';
import 'package:movie_app/screens/navigator/bottom_item.dart';

class BottomApp extends StatefulWidget {
  const BottomApp({super.key});

  @override
  State<BottomApp> createState() => _BottomAppState();
}

class _BottomAppState extends State<BottomApp> {
  int _selectedIndex = 0;
  var _currentTab = TabItem.home;
  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.like: GlobalKey<NavigatorState>(),
    TabItem.ticket: GlobalKey<NavigatorState>(),
    TabItem.account: GlobalKey<NavigatorState>(),
    TabItem.shuffle: GlobalKey<NavigatorState>(),
  };
  void _onItemTapped(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.home) {
            // select 'main' tab
            _onItemTapped(TabItem.home);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body:
            // Container(
            //   padding: EdgeInsets.only(top: sizeHeight * 0.084),
            //   decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //       begin: Alignment.topRight,
            //       end: Alignment.topLeft,
            //       colors: [Color(0xff4E4376), Color(0xff2B5876)],
            //     ),
            //   ),
            //   height: double.infinity,
            //   width: double.infinity,
            //   child: _widgetOptions.elementAt(_selectedIndex),
            // ),
            Stack(
          children: [_buildOffstageNavigator(TabItem.home),
            _buildOffstageNavigator(TabItem.home),
            _buildOffstageNavigator(TabItem.home),
            _buildOffstageNavigator(TabItem.home),],
        ),
        bottomNavigationBar: buildBottomNavigator(
          _currentTab, _onItemTapped
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}


SizedBox buildBottomNavigator(TabItem currentTab, void Function(TabItem tabItem) onItemTapped) {
    return SizedBox(
      height: 87,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [Color(0xff4E4376), Color(0xff2B5876)],
              ),
            ),
            height: 87,
            alignment: AlignmentDirectional.bottomEnd,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [
                  const Color(0xff75D1DD).withOpacity(0.3),
                  const Color(0xff6B66A6).withOpacity(0.3),
                ],
              ),
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(0.2),
                  width: 2.0,
                ),
              ),
            ),
            height: 87,
            alignment: AlignmentDirectional.bottomEnd,
          ),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _currentTab,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
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
          ),
        ],
      ),
    );
  }
}
