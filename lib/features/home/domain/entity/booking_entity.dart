import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {
  final String id;

  const BookingEntity({required this.id});

  @override
  List<Object?> get props => [id];
}