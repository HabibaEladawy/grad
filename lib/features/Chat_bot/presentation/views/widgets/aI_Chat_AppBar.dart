
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../../Chat_with_doctor/presentation/views/screens/Doctor_chat/widgets/Icon_Btn.dart';
import '../../../../Chat_with_doctor/presentation/views/screens/Doctor_chat/widgets/Input_Field.dart';
import '../../../../Chat_with_doctor/presentation/views/screens/Doctor_chat/widgets/chat_Back_Button.dart';
import '../../../../Chat_with_doctor/presentation/views/screens/Doctor_chat/widgets/send_Button.dart';

class AIChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackPressed;

  const AIChatAppBar({super.key, this.onBackPressed});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.bg_card_default_dark
            : AppColors.bg_card_default_light,
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppRadius.space_xl,
            vertical: AppRadius.space_sm,
          ),
          child:
          Row(
            textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40.w,
                height: 40.w,
                child: CircleAvatar(
                  backgroundImage: AssetImage(AppAssets.aiAvater),
                ),
              ),
              SizedBox(width: AppRadius.space_sm),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.aiAssistantName,
                  style: AppTextStyle.medium16TextHeading(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              ChatBackButton(
                isRtl: isRtl,
                onPressed: onBackPressed ?? () => Navigator.maybePop(context),
              ),
            ],
          ),        ),
      ),
    );
  }
}


