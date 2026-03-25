import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../l10n/app_localizations.dart';

class ExaminationSectionHeader extends StatelessWidget {
  const ExaminationSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.sectionHeaderTitle,
            style: AppTextStyle.medium16TextHeading(context),
          ),
          SizedBox(height: 8.h),
          Text(
            l10n.sectionHeaderSubtitle,
            style: AppTextStyle.medium12TextBody(context),
          ),
        ],
      ),
    );
  }
}