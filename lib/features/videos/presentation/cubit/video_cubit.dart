import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecases/usecases.dart';
import '../../domain/entity/Video_Entity.dart';

import '../../domain/usecase/Get_All_Videos_UseCase.dart';
import '../../domain/usecase/Get_Video_By_Id.dart';
import '../../domain/usecase/Search_VideosUseCase.dart';

part 'video_state.dart';


class VideoCubit extends Cubit<VideoState> {
  final GetAllVideosUseCase getAllVideosUseCase;
  final GetVideoByIdUseCase getVideoByIdUseCase;
  final SearchVideosUseCase searchVideosUseCase;

  VideoCubit({
    required this.getAllVideosUseCase,
    required this.getVideoByIdUseCase,
    required this.searchVideosUseCase,
  }) : super(VideoInitial());

  /// 🔹 Get All Videos
  Future<void> getAllVideos() async {
    emit(VideoLoading());

    final result = await getAllVideosUseCase(NoParams());

    result.fold(
          (failure) => emit(VideoError(failure.message)),
          (videos) => emit(VideoLoaded(videos)),
    );
  }

  /// 🔹 Search Videos
  Future<void> searchVideos(String query) async {
    final trimmed = query.trim();

    if (trimmed.isEmpty) {
      await getAllVideos();
      return;
    }

    emit(VideoSearchLoading());

    final result = await searchVideosUseCase(trimmed);

    result.fold(
          (failure) => emit(VideoError(failure.message)),
          (videos) => emit(VideoSearchLoaded(videos)),
    );
  }
  /// 🔹 Reset state (important for UI)
  void reset() {
    emit(VideoInitial());
  }
}