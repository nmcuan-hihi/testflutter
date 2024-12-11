import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:testflutter/presentation/booking.dart';
import 'homePage.dart';
import 'tuft.dart';
import 'booking.dart';
import 'profile.dart';


class Favorites extends StatelessWidget {
  const Favorites({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
    );
  }
}

