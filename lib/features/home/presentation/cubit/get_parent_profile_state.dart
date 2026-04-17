import 'package:equatable/equatable.dart';
import '../../domain/entity/parent_entity.dart';

// parent_state.dart
abstract class ParentState {}

class ParentInitial extends ParentState {}

class ParentLoading extends ParentState {}

class ParentLoaded extends ParentState {
  final ParentEntity parent;
  ParentLoaded({required this.parent});
}

class ParentError extends ParentState {
  final String message;
  ParentError({required this.message});
}