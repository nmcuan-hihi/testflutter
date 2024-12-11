import 'package:flutter/material.dart';
import 'package:testflutter/presentation/favorites.dart';
import 'presentation/homePage.dart';
import './presentation/tuft.dart';
import './presentation/booking.dart';
import './presentation/profile.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Homepage(),
        '/tuft': (context) => const TuftScreen(),
        '/favorites': (context) => const Favorites(),
        '/booking': (context) => const Booking(),
        '/profile': (context) => const Profile(), 
      },
    );
  }
}
