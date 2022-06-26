import 'package:flutter/material.dart';
import './progress_screen.dart';
import 'profile_screen.dart';
import './workout_categories_screen.dart';
import './workout_plan_screen.dart';

class TabsScreen extends StatefulWidget {
  // const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'page': WorkoutCategories(), 'title': 'Categories'},
    {'page': const WorkoutPlan(), 'title': 'Plan'},
    {'page': const ProgressScreen(), 'title': 'Progress'},
    //{'page': const ProfileScreen(), 'title': 'Profile'}
  ];

  int _selectedPageIndex = 0;

  void _selectedpage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        backgroundColor: Colors.black,
      ),
      drawer: const Drawer(
        child: Text('The drawer'),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.grey,
        onTap: _selectedpage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined, color: Colors.white),
              label: 'Plan'),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes, color: Colors.white),
            label: 'Progress',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person, color: Colors.white),
          //   label: 'Profile',
          // ),

        ],
      ),
    );
  }
}
