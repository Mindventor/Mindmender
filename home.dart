import 'package:flutter/material.dart';
import 'package:flutter_application_1/ScreenTime.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('ScreenTimeAnalysis'), // Added ScreenTimeAnalysis widget here
    Text('Chatbot'),
    Text('Online Therapy'),
    Text('Mood Tracking'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MindMender'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('MindMender Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: Icon(Icons.timelapse),
              title: Text('Screentime Analysis'),
              onTap: () {
                // Navigate to ScreenTimeAnalysis when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenTimeAnalysis()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Chatbot'),
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              leading: Icon(Icons.video_call),
              title: Text('Online Therapy'),
              onTap: () => _onItemTapped(3),
            ),
            ListTile(
              leading: Icon(Icons.mood),
              title: Text('Mood Tracking'),
              onTap: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}
