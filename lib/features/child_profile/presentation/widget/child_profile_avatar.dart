import 'package:dana/core/utils/app_raduis.dart';
import 'package:flutter/material.dart';

Widget childProfileAvatar({
  required bool isGirl,
  required String? profileUrl,
  required double side,
}) {
  final u = profileUrl;
  if (u != null && u.isNotEmpty && u.startsWith('http')) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.radius_full),
      child: Image.network(
        u,
        width: side,
        height: side,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Image.asset(
          isGirl
              ? 'assets/Images/girl_child_photo.png'
              : 'assets/Images/home/boy_child_photo.png',
          width: side,
        ),
      ),
    );
  }
  return Image.asset(
    isGirl
        ? 'assets/Images/girl_child_photo.png'
        : 'assets/Images/home/boy_child_photo.png',
    width: side,
    height: side,
  );
}
