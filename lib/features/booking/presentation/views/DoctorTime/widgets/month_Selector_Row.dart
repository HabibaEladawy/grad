import 'package:dana_graduation_project/core/utils/app_colors.dart';

import 'package:dana_graduation_project/core/utils/app_text.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///done
class MonthSelectorRow extends StatelessWidget {
  const MonthSelectorRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [

            Text(AppLocalizations.of(context)!.choosDate
                , style: AppTextStyle.medium16TextDisplay),

            const Spacer(),

            Icon(Icons.arrow_back_ios,
                color: AppColors.icon_onLight_light, size: 16),
            const SizedBox(width: 4),
            Text(AppText.novabber, style: AppTextStyle.medium12TextBody),
            const SizedBox(width: 4),
            Icon(Icons.arrow_forward_ios,
                color: AppColors.icon_onLight_light, size: 16),
          ],
        ),
      ),
    );
  }
}