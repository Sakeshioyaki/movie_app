import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/home.dart';
import 'package:movie_app/screens/home/page_view_popular.dart';
import 'package:movie_app/screens/login.dart';

class BottomLayout extends StatefulWidget {
  const BottomLayout({super.key});

  @override
  State<BottomLayout> createState() => _BottomLayoutState();
}

class _BottomLayoutState extends State<BottomLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      const HomePage(),
      const Text(
        'Index 1: Business',
        style: optionStyle,
      ),
      const Text(
        'Index 2: School',
        style: optionStyle,
      ),
      const Login(),
      const Text(
        'Index 2: School',
        style: optionStyle,
      ),
    ];
    // double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.084),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [Color(0xff4E4376), Color(0xff2B5876)],
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: PopularPage(),
        //   child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: buildBottomNavigator(),
    );
  }

  Widget buildBottomNavigator() {
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
            currentIndex: _selectedIndex,
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
