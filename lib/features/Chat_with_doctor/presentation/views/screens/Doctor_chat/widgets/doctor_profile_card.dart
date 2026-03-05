import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/core/widgets/custom_elevetedButton.dart';
import 'package:dana_graduation_project/features/Chat_with_doctor/presentation/views/screens/Doctor_chat/widgets/doctor_avatar.dart';
import 'package:dana_graduation_project/features/Chat_with_doctor/presentation/views/screens/Doctor_chat/widgets/encrypted_notice.dart';
import 'package:flutter/material.dart';


class DoctorProfileCard extends StatelessWidget {
  const DoctorProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DoctorAvatar(),
            const SizedBox(height: 16),
            Text(
              'د.إسلام غنيم',
              textDirection: TextDirection.rtl,
              style: AppTextStyle.semibold20TextHeading,
            ),
            const SizedBox(height: 8),
            Text(
              'أخصائي علاج طبيعي',
              textDirection: TextDirection.rtl,
              style: AppTextStyle.medium12TextBody,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 16,
                  color: AppColors.icon_onLight_dark,
                ),
                const SizedBox(width: 2),
                Text(
                  'القاهرة - مصر الجديدة',
                  textDirection: TextDirection.rtl,
                  style: AppTextStyle.regular12TextBody,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomElevatedButton(
                text: 'عرض اللف الشخصي',
                onTap: () {},
                borderColor: AppColors.button_primary_default_light,
                height: 48,
                width: 294,
              ),
            ),
            const SizedBox(height: 32),
            const EncryptedNotice(),
          ],
        ),
      ),
    );
  }
}
