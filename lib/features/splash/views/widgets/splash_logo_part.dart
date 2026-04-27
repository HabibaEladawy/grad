import 'package:flutter/material.dart';
import 'splash_left_column.dart';
import 'splash_right_column.dart';


class SplashLogoPart extends StatelessWidget {
  final Animation<Offset> bounceLeft;
  final Animation<Offset> bounceRight;

  const SplashLogoPart({
    super.key,
    required this.bounceLeft,
    required this.bounceRight,
  });

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: isRTL
          ? [
        SplashRightColumn(bounceRight: bounceRight),
        SplashLeftColumn(bounceLeft: bounceLeft),
      ]
          : [
        SplashLeftColumn(bounceLeft: bounceLeft),
        SplashRightColumn(bounceRight: bounceRight),
      ],
    );
  }
}