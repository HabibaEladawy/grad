import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';


class CustomPhoneField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String initialCountryCode;
  final VoidCallback? onTap;

  const CustomPhoneField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.validator,
    this.initialCountryCode = 'EG',
    this.onTap,
  });

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  String selectedFlag = '🇪🇬';
  String selectedCode = '+20';

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppTextStyle.medium12TextHeading(context)),
        SizedBox(height: AppSizes.h8),
        Row(
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: CountryCodePicker(
                      onChanged: (country) {
                        setState(() {
                          selectedFlag = country.flagUri ?? '🇪🇬';
                          selectedCode = country.dialCode ?? '';
                        });
                        Navigator.pop(context);
                      },
                      initialSelection: widget.initialCountryCode,
                      favorite: ['', 'EG'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      comparator: (a, b) => a.name!.compareTo(b.name!),
                      searchDecoration: InputDecoration(
                        hintText: 'ابحث عن دولة',
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                height: 52,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.border_card_default_dark
                      : AppColors.border_card_default_light,
                  border: Border.all(
                    color: isDark
                        ? AppColors.border_card_default_dark
                        : AppColors.border_card_default_light,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppRadius.radius_sm),
                    bottomRight: Radius.circular(AppRadius.radius_sm),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      selectedFlag,
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                validator: widget.validator,
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.left,
                textDirection: TextDirection.ltr,
                onTap: widget.onTap,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: isDark
                      ? AppColors.bg_card_default_dark
                      : Colors.white,
                  hintText: widget.hintText,
                  hintStyle: AppTextStyle.regular12TextBody(context).copyWith(
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.radius_sm),
                      bottomLeft: Radius.circular(AppRadius.radius_sm),
                    ),
                    borderSide: BorderSide(
                      color: isDark
                          ? AppColors.border_card_default_dark
                          : AppColors.border_card_default_light,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.radius_sm),
                      bottomLeft: Radius.circular(AppRadius.radius_sm),
                    ),
                    borderSide: BorderSide(
                      color: isDark
                          ? AppColors.primary_900_dark
                          : AppColors.primary_900_light,
                      width: 2.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.radius_sm),
                      bottomLeft: Radius.circular(AppRadius.radius_sm),
                    ),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.5,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.radius_sm),
                      bottomLeft: Radius.circular(AppRadius.radius_sm),
                    ),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}