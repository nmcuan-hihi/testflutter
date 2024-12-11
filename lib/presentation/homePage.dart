import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'tuft.dart';
import 'booking.dart';
import 'favorites.dart';
import 'profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  int _chon = 0;
  String timkiem = "";

  final List<Widget> _widgetOptions = [
    Placeholder(),
    TuftScreen(),
    Booking(),
    Favorites(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Tìm Kiếm ...",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black),
          ),
          onChanged: (value){
            setState(() {
              timkiem = value;
            });
          },
        ),
      ),
      body: Column(
        children: [
          if (timkiem.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Tìm Kiếm: $timkiem",
            
            ),
          )
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _chon,
        activeColor: Colors.green,
        inactiveColor: Colors.black87,
        onTap: (int index) {
          setState(() {
            _chon = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.sportscourt),
            label: 'Tuft',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.tickets),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

