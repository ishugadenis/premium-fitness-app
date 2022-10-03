import 'package:flutter/material.dart';
import 'package:premium_fitness_app/screens/MealScreen.dart';
import 'package:premium_fitness_app/screens/wp_screeen.dart';
import 'package:provider/provider.dart';
import '../providers/goals.dart';
import './progress_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './workout_categories_screen.dart';
import './workout_plan_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabsScreen extends StatefulWidget {


  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String, dynamic>> _pages = [
    {'page': WorkoutCategories(), 'title': 'Workout Training'},
    {'page': WorkoutPlan(), 'title': 'Plan'},
    {'page': UserProgress(), 'title': 'Progress'},
    {'page': MealScreen(), 'title': 'MealPlan'}
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
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryColor,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: const <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          ),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 206, 123, 123),
        onTap: _selectedpage,
        
        
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.calendar,
                  color: Colors.white, size: 30),
              label: 'Plan'),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.chartLine, color: Colors.white, size: 30),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.hotdog, color: Colors.white, size: 30),
            label: 'Meals',
          ),
        ],
      ),
    );
  }
}
