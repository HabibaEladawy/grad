import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorAvatar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

      ),
      child: CircleAvatar(

        backgroundImage: const AssetImage('assets/Images/doctor_circle.png'),

      ),

    );
  }
}