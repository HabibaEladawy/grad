// domain/entity/question_entity.dart
import 'option_entity.dart';

class QuestionEntity {
  final int? id;
  final String? mongoId;
  final String text;
  final String category;
  final List<OptionEntity> options;

  const QuestionEntity({
    this.id,
    this.mongoId,
    required this.text,
    required this.category,
    required this.options,
  });
}