import 'package:flutter/material.dart';
import 'package:home_work_42/screens/search_screen.dart';

class Cocktails extends StatelessWidget {
  const Cocktails({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SearchScreen(),);
  }
}
