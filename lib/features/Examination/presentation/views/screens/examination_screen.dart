import 'package:dana_graduation_project/features/Examination/presentation/cubit/question_state_cubit.dart';
import 'package:dana_graduation_project/features/Examination/presentation/cubit/question_state_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../../videos/presentation/widgets/videos_TabBar.dart';
import '../../../data/model/examination_model.dart';
import '../../../domain/entity/question_entity.dart';

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

  // ✅ sections بتتبني من الـ API مش hardcoded
  List<ExamSection> _sections = [];

  // ✅ لتتبع إجابات اليوزر
  final Map<int, ResponseOption> _answers = {};

  @override
  void initState() {
    super.initState();
    // ✅ جيب الأسئلة من الـ Cubit
    context.read<QuestionCubit>().getQuestions();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final l10n = AppLocalizations.of(context)!;
    _activeTab = l10n.examination;
  }

  // ✅ تحويل QuestionEntity[] → ExamSection[]
  void _buildSections(List<QuestionEntity> questions) {
    setState(() {
      _sections = ExamSection.fromQuestions(questions);
    });
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
        child: BlocConsumer<QuestionCubit, QuestionState>(
          listener: (context, state) {
            if (state is QuestionLoaded) {
              // ✅ لما البيانات تيجي حوّلها لـ sections
              _buildSections(state.questions);
            }
          },
          builder: (context, state) {
            return Column(
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

                // ✅ Handle states
                if (state is QuestionLoading)
                  const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (state is QuestionError)
                  Expanded(
                    child: Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  )
                else
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
            );
          },
        ),
      ),
    );
  }

  bool _allAnswered() {
    return _sections.isNotEmpty &&
        _sections.every(
          (s) => s.questions.every((q) => q.selectedOption != null),
        );
  }
}