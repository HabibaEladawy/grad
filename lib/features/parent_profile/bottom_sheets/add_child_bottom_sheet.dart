

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/custom_buttom.dart';
import '../../../core/constant/homeIndicator.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Custom_Text_Field.dart';
import '../../../core/widgets/Custom_Toggle_Selector.dart';
import '../../home/data/model/ChildModelUi.dart';

class AddChildBottomSheet extends StatefulWidget {
  final Function(ChildModelUi) onAddChild;
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

  late int localSelectedIndex;

  String calculateAge(DateTime birthDate) {
    final now = DateTime.now();

    int years = now.year - birthDate.year;
    int months = now.month - birthDate.month;

    if (now.day < birthDate.day) {
      months--;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    String yearText = years == 1
        ? "سنة"
        : years == 2
        ? "سنتين"
        : years >= 3 && years <= 10
        ? "$years سنوات"
        : '$years سنة';

    String monthText = months == 1
        ? "شهر"
        : months == 2
        ? "شهرين"
        : months == 11
        ? '$months شهر'
        : "$months شهور";

    if (years > 0) {
      return yearText;
    } else {
      return monthText;
    }
  }

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
                'ضيف أولادك وابدأ رحلتك معاهم',
                style: AppTextStyle.medium20TextDisplay(context),
              ),
              SizedBox(height: 8.h),
              Text(
                'ابدأ دلوقتي وخلي كل حاجة تخص ولادك قريبة منك دايمًا.',
                style: AppTextStyle.regular16TextBody(context),
              ),
              SizedBox(height: 24.h),

              Text(
                'اسم الطفل',
                style: AppTextStyle.medium12TextHeading(context),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: nameController,
                hintText: 'أدخل اسم ابنك',
                inputType: TextInputType.name,
                inputFormatter: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Z\u0600-\u06FF\s]'),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              Text(
                'تاريخ ميلاده',
                style: AppTextStyle.medium12TextHeading(context),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: ageController,
                hintText: 'أختر تاريخ الميلاد',
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
                    String age = calculateAge(pickedDate);
                    setState(() {
                      ageController.text = age;
                    });
                  }
                },
              ),
              SizedBox(height: 16.h),

              Text(
                'نوع الطفل',
                style: AppTextStyle.medium12TextHeading(context),
              ),
              SizedBox(height: 8.h),
              CustomToggleSelector(
                firstText: 'ولد',
                secondText: 'بنت',
                onChanged: (value) {
                  setState(() {
                    localSelectedIndex = value;
                  });
                },
              ),

              SizedBox(height: 16.h),

              Text(
                'فصيلة الدم',
                style: AppTextStyle.medium12TextHeading(context),
              ),
              SizedBox(height: 8.h),
              CustomTextField(hintText: 'أختر فصيلة الدم'),
              SizedBox(height: 150.h),

              CustomButton(
                text: 'إضافة',
                onTap: () {
                  if (nameController.text.isNotEmpty &&
                      ageController.text.isNotEmpty) {
                    widget.onAddChild(
                      ChildModelUi(
                        name: nameController.text,
                        age: ageController.text,
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
      ),
    );
  }
}
