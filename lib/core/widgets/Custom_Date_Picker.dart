
import 'package:flutter/material.dart';

import '../utils/app_sizes.dart';
import '../utils/app_text_style.dart';
import 'Custom_Text_Field.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    required this.controller,
    required this.onDateSelected,
    this.hintText = 'أختر تاريخ الميلاد',
  });

  final TextEditingController controller;
  final Function(DateTime date) onDateSelected;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('تاريخ ميلاده', style: AppTextStyle.medium12TextHeading(context)),
        SizedBox(height: AppSizes.h8),
        CustomTextField(
          controller: controller,
          hintText: hintText,
          readOnly: true,
          icon: Icons.calendar_month_rounded,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              locale: const Locale("ar"),
            );

            if (pickedDate != null) {
              onDateSelected(pickedDate);
            }
          },
        ),
      ],
    );
  }
}