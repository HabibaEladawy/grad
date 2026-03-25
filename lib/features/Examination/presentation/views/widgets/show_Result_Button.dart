import 'package:dana_graduation_project/features/Examination/presentation/views/widgets/result_Bottom_Sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import 'app_Primary_Button.dart';

class ShowResultButton extends StatelessWidget {
  final bool isEnabled;
  final String label;

  const ShowResultButton({
    super.key,
    required this.isEnabled,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return Container(
      width: double.infinity,
      color: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isEnabled ? 1.0 : 0.55,
        child: AppPrimaryButton(
          label: label,
          onPressed: isEnabled
              ? () => ResultBottomSheet.show(context)
              : null,
        ),
      ),
    );
  }
}