import 'package:flutter/material.dart';
import 'package:winngoo_pages/screens/worship/worship_screen.dart';

import 'business/business_screen.dart';
import 'category/category_screen.dart';
import 'charity/charity_screen.dart';
import 'home/homescreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    BusinessScreen(),
    CharityScreen(),
    WorshipScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },

      //   //onTap: _onItemTapped,
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: Color(0xFF0F7E95),
      //   // unselectedItemColor: Colors.grey,
      //   backgroundColor: Colors.white,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         'assets/images/line-md_home.png',
      //         width: 24,
      //         height: 24,
      //         color: _selectedIndex == 0 ? Color(0xFF0F7E95) : Colors.grey,
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //           'assets/images/material-symbols_category-outline.png',
      //           color: _selectedIndex == 0 ? Color(0xFF0F7E95) : Colors.grey,
      //           width: 24,
      //           height: 24),
      //       label: 'Category',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset('assets/images/ic_sharp-business.png',
      //           color: _selectedIndex == 0 ? Color(0xFF0F7E95) : Colors.grey,
      //           width: 24,
      //           height: 24),
      //       label: 'Business',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset('assets/images/mdi_charity-outline.png',
      //           color: _selectedIndex == 0 ? Color(0xFF0F7E95) : Colors.grey,
      //           width: 24,
      //           height: 24),
      //       label: 'Charity',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //           'assets/images/emojione-monotone_place-of-worship.png',
      //           color: _selectedIndex == 0 ? Color(0xFF0F7E95) : Colors.grey,
      //           width: 24,
      //           height: 24),
      //       label: 'Worship',
      //     ),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF0F7E95),
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/line-md_home.png',
              width: 24,
              height: 24,
              color: _selectedIndex == 0 ? Color(0xFF0F7E95) : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/material-symbols_category-outline.png',
              width: 24,
              height: 24,
              color: _selectedIndex == 1 ? Color(0xFF0F7E95) : Colors.grey,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/ic_sharp-business.png',
              width: 24,
              height: 24,
              color: _selectedIndex == 2 ? Color(0xFF0F7E95) : Colors.grey,
            ),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/mdi_charity-outline.png',
              width: 24,
              height: 24,
              color: _selectedIndex == 3 ? Color(0xFF0F7E95) : Colors.grey,
            ),
            label: 'Charity',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/emojione-monotone_place-of-worship.png',
              width: 24,
              height: 24,
              color: _selectedIndex == 4 ? Color(0xFF0F7E95) : Colors.grey,
            ),
            label: 'Worship',
          ),
        ],
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Notifications Screen',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Screen',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Settings Screen',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
