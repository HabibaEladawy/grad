import 'package:dana_graduation_project/features/Examination/presentation/views/widgets/drag_handle.dart';
import 'package:dana_graduation_project/features/Examination/presentation/views/widgets/result_Content.dart';
import 'package:dana_graduation_project/features/Examination/presentation/views/widgets/result_Image.dart';
import 'package:dana_graduation_project/features/Examination/presentation/views/widgets/specia_listResult_BottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import 'app_Primary_Button.dart';


class SensitivityResultBottomSheet extends StatelessWidget {
  const SensitivityResultBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const SensitivityResultBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: 440.w,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.bg_surface_default_dark
            : AppColors.bg_surface_default_light,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const DragHandle(),
          SizedBox(height: 24.h),
          ResultImage(imagePath: AppAssets.exam_2),
          SizedBox(height: 48.h),
          ResultContent(
            titleColor: AppColors.warning_default_light,
            title: l10n.resultSensitivityTitle,
            description: l10n.resultSensitivityDescription,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 32.h),
            child: AppPrimaryButton(
              label: l10n.sensoryActivitiesPlan,
              onPressed: () {
                Navigator.pop(context);
                SpecialistResultBottomSheet.show(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}




