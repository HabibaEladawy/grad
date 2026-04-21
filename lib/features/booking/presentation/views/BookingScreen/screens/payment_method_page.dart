import 'package:dana/core/widgets/custom_button.dart';
import 'package:dana/core/widgets/animated_dropdown.dart';
import 'package:dana/core/widgets/custom_toggle_selector.dart';
import 'package:dana/core/widgets/selectable_option.dart';
import 'package:dana/core/utils/app_colors.dart';
import 'package:dana/core/utils/app_raduis.dart';
import 'package:dana/core/utils/app_sizes.dart';
import 'package:dana/core/utils/app_text_style.dart';
import 'package:dana/providers/app_theme_provider.dart';
import 'package:dana/features/booking/presentation/views/OnlinePayment/screens/Online_Payment_Screen.dart';
import 'package:dana/features/booking/presentation/views/BookingScreen/screens/Payment_Confirm_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  static const String routeName = 'PaymentMethodScreen';

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? childName;
  List<String> children = ["ياسر", "جاسر"];
  int? selectedIndex = 1;
  int? selectedOption;

  final FocusNode _noteFocusNode = FocusNode();
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _noteFocusNode.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    final bool isButtonEnabled = childName != null && selectedOption != null;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.r),
        child: CustomButton(
          color: isButtonEnabled
              ? (isDark
                    ? AppColors.button_primary_default_dark
                    : AppColors.button_primary_default_light)
              : (isDark
                    ? AppColors.bg_button_primary_disabled_dark
                    : AppColors.bg_button_primary_disabled_light),
          text: 'احجز زيارتك',
          textColor: isButtonEnabled
              ? (isDark
                    ? AppColors.text_button_dark
                    : AppColors.text_button_light)
              : (isDark
                    ? AppColors.text_button_disabled_dark
                    : AppColors.text_button_disabled_light),
          onTap: isButtonEnabled
              ? () {
                  if (selectedOption == 0) {
                    Navigator.pushNamed(
                      context,
                      PaymentSuccessScreen.routeName,
                    );
                  } else if (selectedOption == 1) {
                    Navigator.pushNamed(context, OnlinePaymentScreen.routeName);
                  }
                }
              : () {},
        ),
      ),
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.only(top: 32.h, right: 24.w, left: 24.w),
          child: ListView(
            children: [
              Text(
                'خطوة أخيرة… علشان نطمن على ابنك',
                style: AppTextStyle.medium20TextDisplay(context),
              ),
              SizedBox(height: AppSizes.h8),
              Text(
                'اختار المريض وطريقة الدفع… وخلاص نكمّل الحجز.',
                style: AppTextStyle.regular16TextBody(context),
              ),
              SizedBox(height: 24.h),
              // المريض
              Text('المريض', style: AppTextStyle.bold12TextHeading(context)),
              SizedBox(height: AppSizes.h8),
              SizedBox(
                height: 48.h,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: AnimatedDropdown(
                    hintText: 'أختر اسم طفلك',
                    items: children,
                    value: childName,
                    onChanged: (val) {
                      setState(() {
                        childName = val;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              // نوع الزيارة
              Text(
                'نوع الزيارة',
                style: AppTextStyle.bold12TextHeading(context),
              ),
              SizedBox(height: AppSizes.h8),
              CustomToggleSelector(
                firstText: 'كشف',
                secondText: 'إعاده',
                onChanged: (i) {},
              ),
              SizedBox(height: 16.h),
              // ملاحظة الطبيب
              Text(
                'ملاحظة للطبيب',
                style: AppTextStyle.bold12TextHeading(context),
              ),
              SizedBox(height: AppSizes.h8),
              SizedBox(
                height: 85.h,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: _noteController,
                    focusNode: _noteFocusNode,
                    style: AppTextStyle.bold12TextBody(context),
                    minLines: 5,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'اكتب أي تعليق بسيط… (اختياري)',
                      hintStyle: AppTextStyle.bold12TextBody(context),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      filled: true,
                      fillColor: isDark
                          ? AppColors.bg_card_default_dark
                          : AppColors.bg_card_default_light,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          color: isDark
                              ? AppColors.border_card_default_dark
                              : AppColors.border_card_default_light,
                          width: AppRadius.stroke_regular,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          color: isDark
                              ? AppColors.border_card_default_dark
                              : AppColors.border_card_default_light,
                          width: AppRadius.stroke_regular,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              // اختر طريقة الدفع
              Text(
                'اختر طريقة الدفع',
                style: AppTextStyle.bold16TextDisplay(context),
              ),
              SizedBox(height: AppSizes.h12),
              SizedBox(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      SelectableOption(
                        text: 'الدفع عند الزيارة',
                        value: 0,
                        imagePath: "assets/Images/money.png",
                        selectedValue: selectedOption,
                        onChanged: (val) {
                          setState(() => selectedOption = val);
                        },
                      ),
                      SizedBox(height: 12.h),
                      SelectableOption(
                        text: 'الدفع عن طريق الفيزا',
                        imagePath: "assets/Images/credit card.png",
                        value: 1,
                        selectedValue: selectedOption,
                        onChanged: (val) {
                          setState(() => selectedOption = val);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
