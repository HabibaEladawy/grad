import 'package:dana_graduation_project/features/videos/presentation/screens/videos_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../providers/app_theme_provider.dart';

import '../cubit/video_cubit.dart';
import '../widgets/custom_indicator_video.dart';
import '../widgets/no_Results_Widget.dart';
import '../widgets/search_Bar_Widget.dart';
import '../widgets/search_Results.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'SearchScreen';
  final SearchType searchType;

  const SearchScreen({
    super.key,
    this.searchType = SearchType.videos,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

enum SearchType { videos, books }

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  void _search(String query) {
    final trimmed = query.trim();

    if (trimmed.isEmpty) {
      context.read<VideoCubit>().getAllVideos();
      return;
    }

    context.read<VideoCubit>().searchVideos(trimmed);
  }

  @override
  void initState() {
    super.initState();

    // optional: initial state
    context.read<VideoCubit>().getAllVideos();
  }

  @override
  void dispose() {
    _controller.dispose();

    // reset cubit state (optional but clean UX)
    context.read<VideoCubit>().reset();

    super.dispose();
  }

  Widget _buildBody() {
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        if (state is VideoInitial) {
          return const SizedBox.shrink();
        }

        if (state is VideoLoading || state is VideoSearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is VideoSearchEmpty) {
          return const NoResultsWidget();
        }

        if (state is VideoError) {
          return Center(child: Text(state.message));
        }

        if (state is VideoSearchLoaded) {
          return SearchResults(results: state.videos);
        }

        if (state is VideoLoaded) {
          return SearchResults(results: state.videos);
        }

        return const SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.bg_surface_default_dark
            : AppColors.bg_surface_default_light,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            SizedBox(height: 21.h),
            const CustomIndicatorVideo(),
            SizedBox(height: 32.h),

            SearchBarWidget(
              controller: _controller,
              onChanged: _search,
            ),

            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }
}