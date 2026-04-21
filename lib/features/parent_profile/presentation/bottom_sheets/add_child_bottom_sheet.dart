import 'package:dana/core/widgets/blood_type_selector.dart';
import 'package:dana/core/widgets/custom_button.dart';
import 'package:dana/core/widgets/custom_date_picker.dart';
import 'package:dana/core/widgets/custom_text_field.dart';
import 'package:dana/core/widgets/custom_toggle_selector.dart';
import 'package:dana/core/utils/app_text_style.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:dana/features/parent_profile/data/models/child_model.dart';
import 'package:dana/core/widgets/home_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddChildBottomSheet extends StatefulWidget {
  final Function(ChildModel) onAddChild;
  final int? selectedIndex;

  const AddChildBottomSheet({
    super.key,
    required this.onAddChild,
    this.selectedIndex,
  });

  @override
  State<AddChildBottomSheet> createState() => _AddChildBottomSheetState();
}

class _AddChildBottomSheetState extends State<AddChildBottomSheet> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  String? bloodType;
  int ageYears = 0;
  int ageMonths = 0;

  late int localSelectedIndex;

  @override
  void initState() {
    super.initState();
    localSelectedIndex = widget.selectedIndex ?? 1;
  }

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
              context.l10n.addChildTitle,
              style: AppTextStyle.medium20TextDisplay(context),
            ),
            SizedBox(height: 8.h),
            Text(
              context.l10n.addChildDesc,
              style: AppTextStyle.regular16TextBody(context),
            ),
            SizedBox(height: 24.h),

            Text(
              context.l10n.childNameLabel,
              style: AppTextStyle.medium12TextHeading(context),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              controller: nameController,
              hintText: context.l10n.childNameHint,
              inputType: TextInputType.name,
              inputFormatter: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z\u0600-\u06FF\s]'),
                ),
              ],
            ),

            SizedBox(height: 16.h),
            CustomDatePicker(
              controller: ageController,
              onChanged: (years, months) {
                setState(() {
                  ageYears = years;
                  ageMonths = months;
                });
              },
            ),

            SizedBox(height: 16.h),

            Text(
              context.l10n.childGenderLabel,
              style: AppTextStyle.medium12TextHeading(context),
            ),
            SizedBox(height: 8.h),
            CustomToggleSelector(
              firstText: context.l10n.boy,
              secondText: context.l10n.girl,
              onChanged: (value) {
                setState(() {
                  localSelectedIndex = value;
                });
              },
            ),

            SizedBox(height: 16.h),

            BloodTypeSelector(
              value: bloodType,
              onChanged: (value) {
                setState(() {
                  bloodType = value;
                });
              },
            ),
            SizedBox(height: 150.h),

            CustomButton(
              text: context.l10n.add,
              onTap: () {
                if (nameController.text.isNotEmpty &&
                    ageController.text.isNotEmpty &&
                    bloodType != null) {
                  widget.onAddChild(
                    ChildModel(
                      name: nameController.text,
                      years: ageYears,
                      months: ageMonths,
                      gender: localSelectedIndex,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
