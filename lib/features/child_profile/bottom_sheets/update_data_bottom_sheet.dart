
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/custom_buttom.dart';
import '../../../core/constant/homeIndicator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Custom_Text_Field.dart';
import '../../../providers/app_theme_provider.dart';
import 'confirm_data_bottom_sheet.dart';

class UpdateDataBottomSheet extends StatefulWidget {
  const UpdateDataBottomSheet({super.key});

  @override
  State<UpdateDataBottomSheet> createState() => _UpdateDataBottomSheetState();
}

class _UpdateDataBottomSheetState extends State<UpdateDataBottomSheet> {
  double? childWeight;
  double? childHeight;
  double? headCircumference;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    final bool isButtonEnabled =
        childWeight != null && childHeight != null && headCircumference != null;

    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: HomeIndicator()),
              SizedBox(height: 20.h),
              Text(
                'طمنا عليه، أخباره إيه النهارده؟',
                style: AppTextStyle.medium20TextDisplay(context),
              ),
              SizedBox(height: 8.h),
              Text(
                'اتأكد إن بياناتك دايماً مظبوطة وحديثة، عشان نقدر نساعدك.',
                style: AppTextStyle.regular16TextBody(context),
              ),
              SizedBox(height: 24.h),

              Text('الوزن', style: AppTextStyle.medium12TextBody(context)),
              SizedBox(height: 8.h),
              CustomTextField(
                hintText: 'مثال: 12 ',
                suffixText: 'كجم',
                onChange: (value) {
                  setState(() {
                    childWeight = double.tryParse(value);
                  });
                },
              ),

              SizedBox(height: 16.h),
              Text('الطول', style: AppTextStyle.medium12TextBody(context)),
              SizedBox(height: 8.h),
              CustomTextField(
                hintText: 'مثال: 12 ',
                suffixText: 'سم',
                onChange: (value) {
                  setState(() {
                    childHeight = double.tryParse(value);
                  });
                },
              ),

              SizedBox(height: 16.h),
              Text('محيط الرأس', style: AppTextStyle.medium12TextBody(context)),
              SizedBox(height: 8.h),
              CustomTextField(
                hintText: 'مثال: 12 ',
                suffixText: 'سم',
                onChange: (value) {
                  setState(() {
                    headCircumference = double.tryParse(value);
                  });
                },
              ),

              SizedBox(height: 40.h),
              CustomButton(
                color: isButtonEnabled
                    ? (isDark
                          ? AppColors.button_primary_default_dark
                          : AppColors.button_primary_default_light)
                    : (isDark
                          ? AppColors.bg_button_primary_disabled_dark
                          : AppColors.bg_button_primary_disabled_light),
                text: 'حفظ القياسات الجديدة',
                borderColor: isDark
                    ? AppColors.bg_button_primary_disabled_dark
                    : AppColors.bg_button_primary_disabled_light,

                textStyle: isButtonEnabled
                    ? AppTextStyle.semibold16TextButton(context)
                    : AppTextStyle.semibold16TextButtonDisabled(context),
                onTap: isButtonEnabled
                    ? () {
                        Navigator.pop(context);
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: isDark
                              ? AppColors.bg_surface_default_dark
                              : AppColors.bg_surface_default_light,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.r),
                            ),
                          ),
                          builder: (_) => const ConfirmDataBottomSheet(
                            firstText: 'بيكبر قدام عينينا!',
                            secondText:
                                'تسلم إيديكم.. قياسات نوح الجديدة اتسجلت في ملفه بأمان. متابعتكم المستمرة لوزنه وطوله هي أهم خطوة عشان نطمن على صحته ونموه السليم.',
                          ),
                        );
                      }
                    : () {},
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
