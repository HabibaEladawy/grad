import 'package:dana_graduation_project/core/utils/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const  String routeName='HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: TextButton(onPressed: (){
          Navigator.of(context).pushNamed(AppRoutes.doctorTime);
        },
          child: Text('Home',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple
              )),
          ),
      ),
    );
  }
}
