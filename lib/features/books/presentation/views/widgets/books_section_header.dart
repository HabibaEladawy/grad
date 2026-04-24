
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../l10n/app_localizations.dart';

class BooksSectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;

  const BooksSectionHeader({
    super.key,
    required this.title,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final isRtl =
        Localizations.localeOf(context).languageCode == 'ar';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              textAlign:
              isRtl ? TextAlign.right : TextAlign.left,
              style: AppTextStyle
                  .medium16TextHeading(context),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          InkWell(
            onTap: onViewAll,
            borderRadius: BorderRadius.circular(8.r),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 4.h,
              ),
              child: Text(
                l10n.viewAll,
                style: AppTextStyle
                    .regular12TextBody(context)
                    .copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}