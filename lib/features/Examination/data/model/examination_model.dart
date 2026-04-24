import 'package:flutter/cupertino.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entity/option_entity.dart';
import '../../domain/entity/question_entity.dart';

enum ResponseOption { always, sometimes, rarely }

extension ResponseOptionLabel on ResponseOption {
  String label(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case ResponseOption.rarely:
        return l10n.responseRarely;
      case ResponseOption.sometimes:
        return l10n.responseSometimes;
      case ResponseOption.always:
        return l10n.responseAlways;
    }
  }

  int get value {
    switch (this) {
      case ResponseOption.always:
        return 3;
      case ResponseOption.sometimes:
        return 2;
      case ResponseOption.rarely:
        return 1;
    }
  }

  static ResponseOption fromValue(int value) {
    switch (value) {
      case 3:
        return ResponseOption.always;
      case 2:
        return ResponseOption.sometimes;
      default:
        return ResponseOption.rarely;
    }
  }
}

// ✅ wrapper حوالين QuestionEntity بيضيف selectedOption
class ExamQuestion {
  final QuestionEntity entity;
  ResponseOption? selectedOption;

  ExamQuestion({required this.entity, this.selectedOption});

  String get text => entity.text;
  String get category => entity.category;
  List<OptionEntity> get options => entity.options;
}

class ExamSection {
  final String title;
  final String? subtitle;
  final List<ExamQuestion> questions;

  ExamSection({
    required this.title,
    this.subtitle,
    required this.questions,
  });

  // ✅ تحويل من List<QuestionEntity> لـ List<ExamSection> تلقائياً
  static List<ExamSection> fromQuestions(List<QuestionEntity> questions) {
    final Map<String, List<ExamQuestion>> grouped = {};

    for (final q in questions) {
      grouped
          .putIfAbsent(q.category, () => [])
          .add(ExamQuestion(entity: q));
    }

    return grouped.entries.map((entry) {
      return ExamSection(
        title: entry.key,
        questions: entry.value,
      );
    }).toList();
  }
}