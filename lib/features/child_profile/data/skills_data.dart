import 'package:dana/extensions/localization_extension.dart';
import 'package:dana/features/child_profile/data/model/skill_card_model.dart';
import 'package:flutter/material.dart';

List<SkillCardData> getSkillCards(BuildContext context) {
  final l10n = context.l10n;

  return [
    SkillCardData(
      title: l10n.skillMotor,
      subtitle: l10n.skillMotorDesc,
      iconSrc: 'assets/Icons/child_profile/motor_skill_icon.svg',
      count: '10/08',
      bottomSheetTitle: l10n.motorBottomTitle,
      bottomSheetDescription: l10n.motorBottomDesc,
      bottomSheetItems: [
        l10n.motorItem1,
        l10n.motorItem2,
        l10n.motorItem3,
        l10n.motorItem4,
      ],
    ),
    SkillCardData(
      title: l10n.skillSpeech,
      subtitle: l10n.skillSpeechDesc,
      iconSrc: 'assets/Icons/child_profile/speech_skill_icon.svg',
      count: '10/07',
      bottomSheetTitle: l10n.speechBottomTitle,
      bottomSheetDescription: l10n.speechBottomDesc,
      bottomSheetItems: [
        l10n.speechItem1,
        l10n.speechItem2,
        l10n.speechItem3,
        l10n.speechItem4,
      ],
    ),
    SkillCardData(
      title: l10n.skillCognition,
      subtitle: l10n.skillCognitionDesc,
      iconSrc: 'assets/Icons/child_profile/cognition_skill_icon.svg',
      count: '10/05',
      bottomSheetTitle: l10n.cognitionBottomTitle,
      bottomSheetDescription: l10n.cognitionBottomDesc,
      bottomSheetItems: [
        l10n.cognitionItem1,
        l10n.cognitionItem2,
        l10n.cognitionItem3,
        l10n.cognitionItem4,
      ],
    ),
    SkillCardData(
      title: l10n.skillSocial,
      subtitle: l10n.skillSocialDesc,
      iconSrc: 'assets/Icons/child_profile/social_skill_icon.svg',
      count: '10/08',
      bottomSheetTitle: l10n.socialBottomTitle,
      bottomSheetDescription: l10n.socialBottomDesc,
      bottomSheetItems: [
        l10n.socialItem1,
        l10n.socialItem2,
        l10n.socialItem3,
        l10n.socialItem4,
      ],
    ),
  ];
}
