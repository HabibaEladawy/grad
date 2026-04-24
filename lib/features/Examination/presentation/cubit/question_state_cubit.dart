import 'package:bloc/bloc.dart';
import 'package:dana_graduation_project/features/Examination/presentation/cubit/question_state_state.dart';
import '../../../../core/usecases/usecases.dart';
import '../../domain/usecase/get_questions_use_case.dart';


class QuestionCubit extends Cubit<QuestionState> {
  final GetQuestionsUseCase getQuestionsUseCase;

  QuestionCubit({
    required this.getQuestionsUseCase,
  }) : super(const QuestionInitial());

  Future<void> getQuestions() async {
    emit(const QuestionLoading());

    final result = await getQuestionsUseCase(NoParams());

    result.fold(
      (failure) => emit(QuestionError(message: failure.message)),
      (questions) => emit(QuestionLoaded(questions: questions)),
    );
  }
}