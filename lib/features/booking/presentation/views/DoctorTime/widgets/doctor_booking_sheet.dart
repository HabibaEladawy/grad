
import 'package:dana_graduation_project/core/constant/homeIndicator.dart';
import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/BookingScreen/screens/BookingScreen_page.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/DoctorTime/widgets/available_Time.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/DoctorTime/widgets/column_Time_Card.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/DoctorTime/widgets/doctor_Card.dart';

import 'package:dana_graduation_project/features/booking/presentation/views/DoctorTime/widgets/doctor_date_section.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/DoctorTime/widgets/doctor_experience_section.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/DoctorTime/widgets/next_Button.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

import 'package:flutter/material.dart';

class DoctorBookingSheet extends StatelessWidget {
  const DoctorBookingSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.87,
      decoration: const BoxDecoration(
        color: AppColors.bg_surface_default_light,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            // padding: const EdgeInsets.only(bottom: 80),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                HomeIndicator(),

                    const SizedBox(height: 24),

                    const DoctorCard(),

                    const SizedBox(height: 8),

                    const DoctorExperienceSection(),

                    const SizedBox(height: 24),

                    const DoctorDateSection(),

                    const SizedBox(height: 24),

                    const AvailableTime(),

                    const SizedBox(height: 12),

                    const ColumnTimeCard(),

                    const SizedBox(height: 68),
                  ],
                ),
              ),
            ),
          ),

          // ✅ زرار التالي ثابت في الأسفل
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              // color: const Color(0xffF9FAFA),
              padding: const EdgeInsets.all(16),
              child: SafeArea(
                child: NextButton(
                  textButtom: AppLocalizations.of(context)!.next,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookingScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
