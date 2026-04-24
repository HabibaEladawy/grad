

import 'package:dana_graduation_project/features/Examination/domain/entity/question_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


@immutable
abstract class QuestionState extends Equatable {
  const QuestionState();

  @override
  List<Object?> get props => [];
}

class QuestionInitial extends QuestionState {
  const QuestionInitial();
}

class QuestionLoading extends QuestionState {
  const QuestionLoading();
}

class QuestionLoaded extends QuestionState {
  final List<QuestionEntity> questions;

  const QuestionLoaded({required this.questions});

  @override
  List<Object?> get props => [questions];
}

class QuestionError extends QuestionState {
  final String message;

  const QuestionError({required this.message});

  @override
  List<Object?> get props => [message];
}