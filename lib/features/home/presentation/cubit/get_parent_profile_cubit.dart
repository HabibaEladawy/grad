
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/get_parent_profile_usecase.dart';
import 'get_parent_profile_state.dart';

// parent_cubit.dart
class ParentCubit extends Cubit<ParentState> {
  final GetParentProfileUseCase getParentProfileUseCase;

  ParentCubit({required this.getParentProfileUseCase}) : super(ParentInitial());

  Future<void> getParentProfile(String parentId) async {
    emit(ParentLoading());

    final result = await getParentProfileUseCase(parentId);

    result.fold(
          (failure) => emit(ParentError(message: failure.message)),
          (parent) => emit(ParentLoaded(parent: parent)),
    );
  }
}