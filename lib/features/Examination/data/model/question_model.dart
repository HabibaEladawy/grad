// data/model/question_model.dart
import 'dart:convert';
import '../../domain/entity/question_entity.dart';
import 'option_model.dart';

class QuestionModel extends QuestionEntity {
  const QuestionModel({
    super.id,
    super.mongoId,
    required super.text,
    required super.category,
    required super.options,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      mongoId: json['_id'],
      text: json['text'],
      category: json['category'],
      options: (json['options'] as List)
          .map((o) => OptionModel.fromJson(o))
          .toList(),
    );
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    final List<dynamic> optionsList = jsonDecode(map['options']);
    return QuestionModel(
      id: map['id'],
      text: map['text'],
      category: map['category'],
      options: optionsList.map((o) => OptionModel.fromMap(o)).toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        'text': text,
        'category': category,
        'options': jsonEncode(
          options.map((o) => (o as OptionModel).toMap()).toList(),
        ),
      };

  factory QuestionModel.fromEntity(QuestionEntity entity) {
    return QuestionModel(
      id: entity.id,
      mongoId: entity.mongoId,
      text: entity.text,
      category: entity.category,
      options: entity.options,
    );
  }
}