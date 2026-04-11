import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

enum VaccineStatus { done, upcoming, delayed }

enum VaccineType { oral, injection }

enum LineStyle { none, solid, dashed }

class VaccineItem {
  final String title;
  final String description;
  final String date;
  VaccineStatus status;
  final VaccineType type;

  VaccineItem({
    required this.title,
    required this.description,
    required this.date,
    required this.type,
    required this.status,
  });
}

class VaccineUIConfig {
  final Color color;
  final LineStyle lineStyle;
  final bool showButtons;

  VaccineUIConfig({
    required this.color,
    required this.lineStyle,
    required this.showButtons,
  });
}

VaccineUIConfig getUI(VaccineStatus status, bool isDark) {
  switch (status) {
    case VaccineStatus.done:
      return VaccineUIConfig(
        color: isDark
            ? AppColors.success_default_dark
            : AppColors.success_default_light,
        lineStyle: LineStyle.solid,
        showButtons: false,
      );

    case VaccineStatus.upcoming:
      return VaccineUIConfig(
        color: isDark
            ? AppColors.warning_default_dark
            : AppColors.warning_default_light,
        lineStyle: LineStyle.dashed,
        showButtons: true,
      );

    case VaccineStatus.delayed:
      return VaccineUIConfig(
        color: isDark
            ? AppColors.error_default_dark
            : AppColors.error_default_light,
        lineStyle: LineStyle.dashed,
        showButtons: true,
      );
  }
}

String getIconPath(VaccineType type) {
  switch (type) {
    case VaccineType.oral:
      return 'assets/Icons/vaccine/oral_icon.svg';

    case VaccineType.injection:
      return 'assets/Icons/vaccine/injection_icon.svg';
  }
}

final List<VaccineItem> vaccines = [
  VaccineItem(
    title: 'تطعيم شلل الأطفال (الجرعة الصغرية)',
    description:
    'درع حماية يدري أجهزته العصبي في أول ٢٤ ساعة من ولادته، بيتاخد نقط بالفم.',
    date: '24 يناير 2025',
    status: VaccineStatus.done,
    type: VaccineType.oral,
  ),
  VaccineItem(
    title: 'تطعيم الالتهاب الكبدي (ب) - الجرعة الصغرية',
    description:
    'حماية أساسية من السل خلال أول ٤٠ يوم، بيتاخد حقنة في الكتف وبتسبب علامة صغيرة تطمنكم.',
    date: '03 فبراير 2025 ',
    status: VaccineStatus.done,
    type: VaccineType.injection,
  ),
  VaccineItem(
    title: 'تطعيم الدرن (BCG)',
    description:
    'حماية أساسية من السل خلال أول ٤٠ يوم، بيتاخد حقنة في الكتف وبتسبب علامة صغيرة تطمنكم.',
    date: '03 مارس 2025',
    status: VaccineStatus.delayed,
    type: VaccineType.injection,
  ),
  VaccineItem(
    title: 'تطعيم شلل الأطفال (سايبن)',
    description:
    'جرعة أساسية عند إتمام شهرين لاستمرار حمايته، بيتاخد نقط بالفم.',
    date: '22 مارس 2025',
    status: VaccineStatus.done,
    type: VaccineType.oral,
  ),
  VaccineItem(
    title: 'تطعيم شلل الأطفال (سولك)',
    description:
    'إضافة أمان جديدة ومهمة في الشهر الثاني في تعزيز مناعته، بيتاخد حقنة في الفخذ.',
    date: '24 مارس 2025',
    status: VaccineStatus.delayed,
    type: VaccineType.oral,
  ),
  VaccineItem(
    title: 'التطعيم الخماسي',
    description:
    'حقنة بطولة بتحمي من ٥ أمراض مرة واحدة في شهره الثاني، بيتاخد حقنة في الفخذ.',
    date: '24 مارس 2025',
    status: VaccineStatus.upcoming,
    type: VaccineType.injection,
  ),
  VaccineItem(
    title: 'تطعيم شلل الأطفال (جرعة ٩ شهور)',
    description:
    'جرعة منشطة سريعة عند إتمام ٩ شهور عشان تفضل مناعته قوية، بيتاخد نقط بالفم.',
    date: '24 نوفمبر 2025',
    status: VaccineStatus.upcoming,
    type: VaccineType.injection,
  ),
];