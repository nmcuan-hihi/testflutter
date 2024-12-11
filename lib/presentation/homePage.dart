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
      body: Column(
        children: [
          Form(
          child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                    labelText: 'Tìm kiếm ...',
                    suffixIcon: Icon(Icons.search, color: Colors.green),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 2.0),
                    ),
                   ),
                   autovalidateMode: AutovalidateMode.onUserInteraction,
                  
                  ),
                )
              ],
            ),
          ),
          Expanded(child: _widgetOptions[_chon]),
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

