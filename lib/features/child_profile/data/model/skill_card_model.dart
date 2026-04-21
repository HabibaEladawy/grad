class SkillCardData {
  final String title;
  final String subtitle;
  final String count;
  final String iconSrc;
  final String bottomSheetTitle;
  final String bottomSheetDescription;
  final List<String> bottomSheetItems;

  const SkillCardData({
    required this.title,
    required this.subtitle,
    required this.count,
    required this.iconSrc,
    required this.bottomSheetTitle,
    required this.bottomSheetDescription,
    required this.bottomSheetItems,
  });
}
