// domain/entity/option_entity.dart

class OptionEntity {
  final String? mongoId;
  final String label;
  final int value;

  const OptionEntity({
    this.mongoId,
    required this.label,
    required this.value,
  });
}