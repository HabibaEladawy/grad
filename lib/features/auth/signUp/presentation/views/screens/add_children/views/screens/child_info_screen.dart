
import 'package:dana_graduation_project/core/utils/app_raduis.dart';

import 'package:dana_graduation_project/core/widgets/custom_elevetedButton.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../../providers/app_theme_provider.dart';
import '../../../contact_info/presentation/views/screens/contant_Info_screen.dart';
import '../widgets/child_info_body.dart';
///ضيف اولادك
class ChildInfoScreen extends StatefulWidget {
  static const String routeName = 'ChildInfoScreen';
  final VoidCallback? onNext;

  const ChildInfoScreen({super.key, required this.onNext});

  @override
  State<ChildInfoScreen> createState() => _ChildInfoScreenState();
}

class _ChildInfoScreenState extends State<ChildInfoScreen> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppRadius.space_xl),
        child: CustomElevatedButton(
          onTap: () => Navigator.of(context).pushNamed(ContactInfoScreen.routeName),
          icon: Icons.arrow_forward_ios,
          text: AppLocalizations.of(context)!.next,
        ),
      ),
      body: SafeArea(
        child: ChildInfoBody(
          selectedIndex: selectedIndex,
          onGenderSelect: (i) => setState(() => selectedIndex = i),
        ),
      ),
    );
  }
}