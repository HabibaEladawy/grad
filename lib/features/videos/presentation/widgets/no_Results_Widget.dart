import 'package:dana_graduation_project/core/utils/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../l10n/app_localizations.dart';
class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                AppAssets.empty_search,
                width: 192.w,
                height: 160.h,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                const SizedBox.shrink(),
              ),
            ),

            SizedBox(height: 24.h),

            Text(
              l10n.noResults,
              textAlign: TextAlign.center,
              style: AppTextStyle.semibold16TextHeading(context),
            ),

            SizedBox(height: 8.h),

            Text(
              l10n.searchHint,
              textAlign: TextAlign.center,
              style: AppTextStyle.medium12TextBody(context),
            ),
          ],
        ),
      ),
    );
  }
}