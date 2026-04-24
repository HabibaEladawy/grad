// data/model/option_model.dart
import '../../domain/entity/option_entity.dart';

class OptionModel extends OptionEntity {
  const OptionModel({
    super.mongoId,
    required super.label,
    required super.value,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      mongoId: json['_id'],
      label: json['label'],
      value: json['value'],
    );
  }

  factory OptionModel.fromMap(Map<String, dynamic> map) {
    return OptionModel(
      label: map['label'],
      value: map['value'],
    );
  }

  Map<String, dynamic> toMap() => {
        'label': label,
        'value': value,
      };
}