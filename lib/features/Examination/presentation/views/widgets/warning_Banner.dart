
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';

class WarningBanner extends StatelessWidget {
  const WarningBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: CustomPaint(
        painter: DashedBorderPainter(
          color: isDark
              ? AppColors.border_button_outlined_dark
              : AppColors.border_button_outlined_light,
          radius: AppRadius.radius_sm,
          dashWidth: 8,
          dashSpace: 8,
          strokeWidth: 0.6,
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: isDark
                ? AppColors.primary_50_dark
                : AppColors.primary_50_light,
            borderRadius: BorderRadius.circular(AppRadius.radius_sm),
          ),
          child: Column(
            children: [
              Row(
                textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: isDark
                        ? AppColors.primary_default_dark
                        : AppColors.primary_default_light,
                    size: 16.w,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    l10n.warningTitle,
                    style: AppTextStyle.semibold16TextHeading(context),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                l10n.warningDescription,
                style: AppTextStyle.medium12TextButton(context),
                textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                textAlign: isRtl ? TextAlign.right : TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double radius;
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;

  const DashedBorderPainter({
    required this.color,
    required this.radius,
    required this.dashWidth,
    required this.dashSpace,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(radius),
      ));

    final dashPath = Path();
    final pathMetrics = path.computeMetrics();

    for (final metric in pathMetrics) {
      double distance = 0;
      while (distance < metric.length) {
        dashPath.addPath(
          metric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant DashedBorderPainter oldDelegate) =>
      oldDelegate.color != color ||
          oldDelegate.dashWidth != dashWidth ||
          oldDelegate.dashSpace != dashSpace;
}