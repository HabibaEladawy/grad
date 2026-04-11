import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/widgets/custom_elevetedButton.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../../providers/app_theme_provider.dart';
import '../../../../../../../login/presentation/cubit/sign_up_cubit.dart';
import '../widgets/child_info_body.dart';

class ChildInfoScreen extends StatefulWidget {
  static const String routeName = 'ChildInfoScreen';
  final VoidCallback? onNext;
  const ChildInfoScreen({super.key, required this.onNext});

  @override
  State<ChildInfoScreen> createState() => _ChildInfoScreenState();
}

class _ChildInfoScreenState extends State<ChildInfoScreen> {
  int selectedIndex = 1; // 1=male, 2=female

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
          onTap: () {
            final canProceed = context.read<SignUpCubit>().onStep2Next();
            if (canProceed) widget.onNext?.call();
          },
          icon: Icons.arrow_forward_ios,
          text: AppLocalizations.of(context)!.next,
        ),
      ),
      body: SafeArea(
        child: ChildInfoBody(
          selectedIndex: selectedIndex,
          onGenderSelect: (i) {
            setState(() => selectedIndex = i);
            context.read<SignUpCubit>().updateChildGender(
              i == 1 ? 'male' : 'female',
            );
          },
        ),
      ),
    );
  }
}