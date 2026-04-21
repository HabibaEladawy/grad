import 'package:dana/core/utils/app_colors.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

enum VaccineStatus { done, upcoming, delayed }

enum VaccineType { oral, injection }

enum LineStyle { none, solid, dashed }

class VaccineItem {
  final String? childId;
  final String? vaccinationId; // schedule item id
  final String title;
  final String description;
  final DateTime date;
  final DateTime? takenDate;
  VaccineStatus status;
  final VaccineType type;

  VaccineItem({
    this.childId,
    this.vaccinationId,
    required this.title,
    required this.description,
    required this.date,
    this.takenDate,
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

List<VaccineItem> getVaccines(BuildContext context) {
  final l10n = context.l10n;

  return [
    VaccineItem(
      title: l10n.vaccinePolioZeroDose,
      description: l10n.vaccineDescPolioZeroDose,
      date: DateTime(2026, 2, 3),
      status: VaccineStatus.done,
      type: VaccineType.oral,
    ),
    VaccineItem(
      title: l10n.vaccineHepBZeroDose,
      description: l10n.vaccineDescHepBZeroDose,
      date: DateTime(2026, 2, 3),
      status: VaccineStatus.done,
      type: VaccineType.injection,
    ),
    VaccineItem(
      title: l10n.vaccineBCG,
      description: l10n.vaccineDescBCG,
      date: DateTime(2026, 2, 3),
      status: VaccineStatus.delayed,
      type: VaccineType.injection,
    ),
    VaccineItem(
      title: l10n.vaccinePolioSabin,
      description: l10n.vaccineDescPolioTwoMonths,
      date: DateTime(2026, 2, 3),
      status: VaccineStatus.done,
      type: VaccineType.oral,
    ),
    VaccineItem(
      title: l10n.vaccinePolioSalk,
      description: l10n.vaccineDescSalk,
      date: DateTime(2026, 2, 3),
      status: VaccineStatus.delayed,
      type: VaccineType.oral,
    ),
    VaccineItem(
      title: l10n.vaccinePentavalent,
      description: l10n.vaccineDescPentavalent,
      date: DateTime(2026, 2, 3),
      status: VaccineStatus.upcoming,
      type: VaccineType.injection,
    ),
    VaccineItem(
      title: l10n.vaccinePolioNineMonths,
      description: l10n.vaccineDescNineMonths,
      date: DateTime(2026, 2, 3),
      status: VaccineStatus.upcoming,
      type: VaccineType.injection,
    ),
  ];
}
