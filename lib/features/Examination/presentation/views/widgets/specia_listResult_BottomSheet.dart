import 'package:dana_graduation_project/features/Examination/presentation/views/widgets/drag_handle.dart';
import 'package:dana_graduation_project/features/Examination/presentation/views/widgets/result_Content.dart';
import 'package:dana_graduation_project/features/Examination/presentation/views/widgets/result_Image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import 'app_Primary_Button.dart';

import 'package:flutter/material.dart';

class SpecialistResultBottomSheet extends StatelessWidget {
  const SpecialistResultBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const SpecialistResultBottomSheet(),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          const DragHandle(),
          SizedBox(height: 24.h),
          ResultImage(imagePath: AppAssets.exam_3),
          SizedBox(height: 48.h),
          ResultContent(
            titleColor: AppColors.error_default_light,
            title: l10n.resultSpecialistTitle,
            description: l10n.resultSpecialistDescription,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 32.h),
            child: AppPrimaryButton(
              label: l10n.bookSpecialistConsultation,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.videos);
              },
            ),
          ),
        ],
      ),
    );
  }
}