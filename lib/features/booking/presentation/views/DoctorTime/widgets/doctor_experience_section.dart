
import 'package:dana_graduation_project/features/booking/presentation/views/DoctorTime/widgets/experience_Card.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

import 'package:flutter/material.dart';
///done
class DoctorExperienceSection extends StatelessWidget {
  const DoctorExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(


          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ExperienceCard(
              textOne: '7 سنين',
              textTwo: AppLocalizations.of(context)!.yearsExperience,
              imageAsset: 'assets/Images/star.png',
            ),
            ExperienceCard(
              textOne: '4.5 الف',
              textTwo:  AppLocalizations.of(context)!.patients,
              imageAsset: 'assets/Images/people.png',
            ),
            ExperienceCard(
              textOne: '3.5 الف',
              textTwo: AppLocalizations.of(context)!.reviews,
              imageAsset: 'assets/Images/ranking.png',
            ),
          ],
        ),
      ),
    );
  }
}