
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/custom_buttom.dart';
import '../../../core/constant/homeIndicator.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Animated_Dropdown.dart';
import '../../../core/widgets/Custom_Text_Field.dart';
import '../../../core/widgets/Phone_Field.dart';

class EditProfileBottomSheet extends StatefulWidget {
  const EditProfileBottomSheet({super.key});

  @override
  State<EditProfileBottomSheet> createState() => _EditProfileBottomSheetState();
}

class _EditProfileBottomSheetState extends State<EditProfileBottomSheet> {
  String? goverName;

  List<String> governorates = [
    'البحر الأحمر',
    'القاهرة',
    'الجيزه',
    'الغربية',
    'القليوبية',
    'الإسكندرية',
    'مطروح',
    'البحيرة',
    'كفر الشيخ',
    'المنوفية',
    'دمياط',
    'بورسعيد',
    'السويس',
    'أسوان',
  ];

  @override
  Widget build(BuildContext context) {
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
                'تعديل بيانات الملف الشخصي',
                style: AppTextStyle.medium20TextDisplay(context),
              ),
              SizedBox(height: 8.h),
              Text(
                'اتأكد إن بياناتك دايماً مظبوطة وحديثة، عشان نقدر نساعدك.',
                style: AppTextStyle.regular16TextBody(context),
              ),
              SizedBox(height: 24.h),
              Text(
                'اسم ولي الامر بالكامل',
                style: AppTextStyle.medium12TextBody(context),
              ),
              SizedBox(height: 8.h),
              CustomTextField(hintText: 'أدخل اسمك رباعي'),
              SizedBox(height: 16.h),
              Text('المحافظة', style: AppTextStyle.medium12TextBody(context)),
              SizedBox(height: 8.h),
              AnimatedDropdown(
                hintText: 'اختر المحافظة',
                items: governorates,
                value: goverName,
                onChanged: (val) {
                  setState(() {
                    goverName = val;
                  });
                },
              ),
              SizedBox(height: 16.h),
              Text('رقم الهاتف', style: AppTextStyle.medium12TextBody(context)),
              SizedBox(height: 8.h),
              SizedBox(
                height: 64.h,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: PhoneField(),
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'البريد الألكتروني',
                style: AppTextStyle.medium12TextBody(context),
              ),
              SizedBox(height: 8.h),
              CustomTextField(hintText: 'ادخل البريد الألكتروني'),
              SizedBox(height: 101.h),
              CustomButton(
                text: 'تعديل البيانات',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
