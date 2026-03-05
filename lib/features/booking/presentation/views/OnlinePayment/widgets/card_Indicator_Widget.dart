import 'package:flutter/cupertino.dart';

class CardIndicatorWidget extends StatelessWidget {
  const CardIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 134,
        height: 5,
        decoration: BoxDecoration(
          color: const Color(0xFFE3E7E8),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}