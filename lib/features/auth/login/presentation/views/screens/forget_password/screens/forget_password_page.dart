
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../core/utils/app_raduis.dart';
import '../../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../../core/widgets/Otp_Bottom_Sheet.dart';
import '../../../../../../../../providers/app_theme_provider.dart';
import '../../new_password/screens/new_password_screen.dart';
import '../widgets/forget_Password_Body.dart';

class ForgetPasswordDialog extends StatefulWidget {
  static const String routeName = 'ForgetPasswordDialog';

  const ForgetPasswordDialog({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (context) => const ForgetPasswordDialog(),
    );
  }

  @override
  State<ForgetPasswordDialog> createState() => _ForgetPasswordDialogState();
}

class _ForgetPasswordDialogState extends State<ForgetPasswordDialog> {
  final TextEditingController _phoneController = TextEditingController();
  final DraggableScrollableController _sheetController =
  DraggableScrollableController();

  @override
  void dispose() {
    _phoneController.dispose();
    _sheetController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    final nav = Navigator.of(context);
    Navigator.pop(context);
    OtpBottomSheet.show(
      context,
      _phoneController.text,
      onVerified: () {
        nav.pushNamed(NewPasswordScreen.routeName);
      },
    );
  }

  void _expandSheet() {
    _sheetController.animateTo(
      0.95,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return DraggableScrollableSheet(
      controller: _sheetController,
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      snap: true,
      snapSizes: const [0.5, 0.95],
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: isDark
                ? AppColors.bg_surface_default_dark
                : AppColors.bg_surface_default_light,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppRadius.radius_lg.r),
              topRight: Radius.circular(AppRadius.radius_lg.r),
            ),
          ),
          child: Column(
            children: [
              _buildDragIndicator(isDark),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: ForgetPasswordBody(
                      phoneController: _phoneController,
                      onNextPressed: _onNextPressed,
                      onPhoneFieldTap: _expandSheet,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDragIndicator(bool isDark) {
    return Container(
      margin: EdgeInsets.only(top: AppSizes.h12, bottom: AppSizes.h8),
      width: 134.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[600] : Colors.grey[300],
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }
}