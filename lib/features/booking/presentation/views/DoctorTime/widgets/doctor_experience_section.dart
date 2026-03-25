
import 'package:dana_graduation_project/core/utils/app_assets.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/DoctorTime/widgets/experience_Card.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
///done
// class DoctorExperienceSection extends StatelessWidget {
//   const DoctorExperienceSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 19),
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Row(
//
//
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ExperienceCard(
//               textOne:
//         '${AppLocalizations.of(context)!.seven} ${AppLocalizations.of(context)!.years}',
//               textTwo: AppLocalizations.of(context)!.yearsExperience,
//               imageAsset: AppAssets.star,
//             ),
//             ExperienceCard(
//     textOne:
//     '${AppLocalizations.of(context)!.fourPointFive} ${AppLocalizations.of(context)!.thousand}',
//               textTwo:  AppLocalizations.of(context)!.patients,
//               imageAsset: AppAssets.people,
//             ),
//             ExperienceCard(
//     textOne:
//     '${AppLocalizations.of(context)!.threePointFive} ${AppLocalizations.of(context)!.thousand}',
//               textTwo: AppLocalizations.of(context)!.reviews,
//               imageAsset: AppAssets.ranking,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }