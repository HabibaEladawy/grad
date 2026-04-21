import 'package:dana/core/constant/governorates.dart';
import 'package:dana/core/widgets/animated_dropdown.dart';
import 'package:dana/core/widgets/custom_button.dart';
import 'package:dana/core/widgets/custom_text_field.dart';
import 'package:dana/core/widgets/phone_field.dart';
import 'package:dana/core/utils/app_text_style.dart';
import 'package:dana/core/widgets/home_indicator.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileBottomSheet extends StatefulWidget {
  const EditProfileBottomSheet({super.key});

  @override
  State<EditProfileBottomSheet> createState() => _EditProfileBottomSheetState();
}

class _EditProfileBottomSheetState extends State<EditProfileBottomSheet> {
  String? goverName = Governorates.egypt[1];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: HomeIndicator()),
            SizedBox(height: 20.h),
            Text(
              context.l10n.editProfileTitle,
              style: AppTextStyle.medium20TextDisplay(context),
            ),
            SizedBox(height: 8.h),
            Text(
              context.l10n.editProfileDesc,
              style: AppTextStyle.regular16TextBody(context),
            ),
            SizedBox(height: 24.h),
            Text(
              context.l10n.fullNameLabel,
              style: AppTextStyle.medium12TextBody(context),
            ),
            SizedBox(height: 8.h),
            CustomTextField(hintText: context.l10n.fullNameHint),
            SizedBox(height: 16.h),
            Text(
              context.l10n.governorateLabel,
              style: AppTextStyle.medium12TextBody(context),
            ),
            SizedBox(height: 8.h),
            AnimatedDropdown(
              hintText: context.l10n.governorateHint,
              items: Governorates.egypt,
              value: goverName,
              onChanged: (val) {
                setState(() {
                  goverName = val;
                });
              },
            ),
            SizedBox(height: 16.h),
            Text(
              context.l10n.phoneNumberLabel,
              style: AppTextStyle.medium12TextBody(context),
            ),
            SizedBox(height: 8.h),
            SizedBox(height: 64.h, child: PhoneField()),
            SizedBox(height: 6.h),
            Text(
              context.l10n.accountLabel,
              style: AppTextStyle.medium12TextBody(context),
            ),
            SizedBox(height: 8.h),
            CustomTextField(hintText: context.l10n.accountHint),
            SizedBox(height: 101.h),
            CustomButton(
              text: context.l10n.editData,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
