
import 'package:dana_graduation_project/core/widgets/Custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';

class SignUpIndicatorRow extends StatelessWidget {
  final int currentIndex;

  const SignUpIndicatorRow({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.rtl,
      children: List.generate(
        4,
            (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.h4),
          child: CustomIndicator(active: index == currentIndex),
        ),
      ),
    );
  }
}