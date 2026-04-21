import 'package:flutter/material.dart';

enum Status { upcoming, completed, cancelled }

class Appointment {
  final String? bookingId;
  final String? childId;
  final String? doctorId;
  final String doctorName;
  final String image;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String address;
  final Status status;

  Appointment({
    this.bookingId,
    this.childId,
    this.doctorId,
    required this.doctorName,
    required this.image,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.address,
    required this.status,
  });
}
