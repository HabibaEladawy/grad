import 'package:dana/core/widgets/phone_field.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:dana/core/utils/app_sizes.dart';
import 'package:dana/core/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPhoneField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomPhoneField({super.key, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.phoneNumber,
          style: AppTextStyle.medium12TextHeading(context),
        ),
        Container(
          margin: EdgeInsets.only(top: AppSizes.h8),
          height: 64.h,
          child: PhoneField(controller: controller),
        ),
      ],
    );
  }
}
