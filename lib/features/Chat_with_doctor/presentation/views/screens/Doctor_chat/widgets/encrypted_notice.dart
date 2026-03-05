import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class EncryptedNotice extends StatelessWidget {
  const EncryptedNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 392,
      height: 62,
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color:AppColors.bg_success_subtle_light,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(height: AppSizes.h8,),
                Image.asset('assets/Images/Icon_chat_doctor.png'),
                const SizedBox(width: 4),
                 Text(
                  'مشفّرة من البداية إلى النهاية.',
                  textDirection: TextDirection.rtl,
                  style: AppTextStyle.medium16TextSuccess,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
           Text(
            'الرسائل مؤمنة بتشفير من البداية إلى النهاية.',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: AppTextStyle.regular12TextBody,
          ),

        ],
      ),
    );
  }
}
