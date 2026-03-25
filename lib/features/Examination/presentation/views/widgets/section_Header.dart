import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../data/model/examination_model.dart';

class ExamSectionTitleHeader extends StatelessWidget {
  final ExamSection section;
  final bool showDivider;

  const ExamSectionTitleHeader({
    super.key,
    required this.section,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDivider)
          Divider(
            color: isDark
                ? AppColors.border_card_default_dark
                : AppColors.border_card_default_light,
            thickness: 0.6,
            height: 24.h,
          ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: RichText(
            textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
            text: TextSpan(
              style: AppTextStyle.semibold24TextHeading(context),
              children: [
                TextSpan(text: section.title),
                if (section.subtitle != null)
                  TextSpan(
                    text: ' ${section.subtitle}',
                    style: AppTextStyle.regular16TextBody(context),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}