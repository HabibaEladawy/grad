
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/custom_buttom.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../core/utils/app_colors.dart' hide AppColors;
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/Password_Field.dart';
import '../../booking/presentation/views/DoctorTime/screens/doctor_Time_screen.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  static String id = 'NewPasswordPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg_surface_default_light,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 34.5.h, horizontal: 24.w),
        child: ListView(
          children: [
            AppTextStyleFonts.headingLargeText(text: 'اختار كلمة مرور جديدة'),
            AppTextStyleFonts.bodyText(
              text:
                  'خليها سهلة عليك ومتتنسيش، بس في نفس الوقت قوية تحافظ على أمان حسابك.',
            ),
            SizedBox(height: 32.h),
            AppTextStyleFonts.headingSmallText(text: 'كلمة المرور الجديدة'),
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: PasswordField(text: 'أدخل كلمة مرور قوية'),
            ),
            AppTextStyleFonts.headingSmallText(text: 'تأكيد كلمة المرور'),
            PasswordField(text: 'أكتب كلمة المرور مره أخري'),

            Padding(
              padding: EdgeInsets.only(top: 137.h),
              child: CustomButton(
                text: 'تأكيد كلمة المرور',
                onTap: () {
                  Navigator.pushNamed(context, DoctorTimeScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
