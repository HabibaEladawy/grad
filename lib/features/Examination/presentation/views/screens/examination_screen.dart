
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';

import '../../../../videos/presentation/widgets/videos_TabBar.dart';
import '../../../data/model/examination_model.dart';
import '../widgets/examination_Body.dart';
import '../widgets/examination_Header.dart';
import '../widgets/examination_Section_Header.dart';
import '../widgets/show_Result_Button.dart';
import '../widgets/warning_Banner.dart';

class ExaminationScreen extends StatefulWidget {
  static const String routeName = 'ExaminationScreen';

  const ExaminationScreen({super.key});

  @override
  State<ExaminationScreen> createState() => _ExaminationScreenState();
}

class _ExaminationScreenState extends State<ExaminationScreen> {
  late String _activeTab;
  late List<ExamSection> _sections;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;

    final l10n = AppLocalizations.of(context)!;
    _activeTab = l10n.examination;

    _sections = [
      ExamSection(
        title: l10n.touchAndSoundTitle,
        subtitle: l10n.touchAndSoundSubtitle,
        questions: [
          ExamQuestion(text: l10n.question1),
          ExamQuestion(text: l10n.question2),
        ],
      ),
      ExamSection(
        title: l10n.motorInteractionTitle,
        subtitle: l10n.motorInteractionSubtitle,
        questions: [
          ExamQuestion(text: l10n.question3),
          ExamQuestion(text: l10n.question4),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ExaminationHeader(),
            SizedBox(height: 12.h),
            VideosTabBar(
              activeTab: _activeTab,
              onTabChanged: (t) => setState(() => _activeTab = t),
            ),
            SizedBox(height: 12.h),
            const WarningBanner(),
            SizedBox(height: 24.h),
            const ExaminationSectionHeader(),
            SizedBox(height: 16.h),
            Expanded(
              child: ExaminationBody(
                sections: _sections,
                onAnswerChanged: (sectionIndex, questionIndex, option) {
                  setState(() {
                    _sections[sectionIndex]
                        .questions[questionIndex]
                        .selectedOption = option;
                  });
                },
              ),
            ),
            ShowResultButton(
              isEnabled: _allAnswered(),
              label: l10n.showResult,
            ),
          ],
        ),
      ),
    );
  }

  bool _allAnswered() {
    return _sections.every(
          (s) => s.questions.every((q) => q.selectedOption != null),
    );
  }
}




