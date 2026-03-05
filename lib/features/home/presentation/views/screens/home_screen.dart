import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const  String routeName='HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Text('Home',style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
            color: Colors.purple
        ),),
      ),
    );
  }
}
