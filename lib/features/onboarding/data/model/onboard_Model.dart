import 'package:dana/core/utils/app_assets.dart';
import 'package:dana/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

// class OnboardModel {
//   final String mainImage;
//   final double topOffset;
//   final String headingText;
//   final String textLg;
//
//   OnboardModel({
//     required this.mainImage,
//     required this.headingText,
//     required this.textLg,
//     this.topOffset = -40,
//   });
//
//
//   static List<OnboardModel> getOnboardingData(BuildContext context) {
//     return [
//       OnboardModel(
//         mainImage: AppAssets.onboardChild,
//         headingText: AppLocalizations.of(context)!.onboarding1Title,
//         textLg: AppLocalizations.of(context)!.onboarding1Desc,
//       ),
//       OnboardModel(
//         mainImage: AppAssets.onboardDoctor,
//         headingText: AppLocalizations.of(context)!.onboarding2Title,
//         textLg: AppLocalizations.of(context)!.onboarding2Desc,
//       ),
//       OnboardModel(
//         mainImage: AppAssets.onboardAi,
//         headingText: AppLocalizations.of(context)!.onboarding3Title,
//         textLg: AppLocalizations.of(context)!.onboarding3Desc,
//       ),
//     ];
//   }
//
//   static OnboardModel getOnboardingItem(BuildContext context, int index) {
//     return getOnboardingData(context)[index];
//   }
// }
class OnboardModel {
  final String mainImage;
  final double topOffset;
  final String headingText;
  final String textLg;

  const OnboardModel({
    required this.mainImage,
    required this.headingText,
    required this.textLg,
    this.topOffset = -40,
  });

  static List<OnboardModel> getOnboardingData(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return [
      OnboardModel(
        mainImage: AppAssets.onboardChild,
        headingText: locale.onboarding1Title,
        textLg: locale.onboarding1Desc,
      ),
      OnboardModel(
        mainImage: AppAssets.onboardDoctor,
        headingText: locale.onboarding2Title,
        textLg: locale.onboarding2Desc,
      ),
      OnboardModel(
        mainImage: AppAssets.onboardAi,
        headingText: locale.onboarding3Title,
        textLg: locale.onboarding3Desc,
      ),
    ];
  }

  static OnboardModel getOnboardingItem(BuildContext context, int index) {
    final list = getOnboardingData(context);

    if (index < 0 || index >= list.length) {
      return list.first; // حماية من crash
    }

    return list[index];
  }
}