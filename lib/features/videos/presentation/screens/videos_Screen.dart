import 'package:dana_graduation_project/features/videos/presentation/screens/search_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../cubit/video_cubit.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/section_Row.dart';
import '../widgets/videos_TabBar.dart';

class VideosScreen extends StatefulWidget {
  static const String routeName = 'VideosScreen';

  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  late String _activeTab;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;

    _activeTab = AppLocalizations.of(context)!.videos;

    context.read<VideoCubit>().getAllVideos();
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      body: SafeArea(
        child: Column(
          children: [
            // CustomAppbar(
            //   title: l10n.videos,
            //   // 👇 لو عندك search فعلًا اربطه هنا
            //   onSearchChanged: (value) {
            //     context.read<VideoCubit>().searchVideos(value);
            //   },
            // ),
            CustomAppbar(
              title: l10n.videos,
              onSearchTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => const SearchScreen(),
                );
              },
            ),
            SizedBox(height: 12.h),
            VideosTabBar(
              activeTab: _activeTab,
              onTabChanged: (t) => setState(() => _activeTab = t),
            ),
            SizedBox(height: 12.h),

            Expanded(
              child: BlocBuilder<VideoCubit, VideoState>(
                builder: (context, state) {
                  ///  Loading (get all)
                  if (state is VideoLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  ///  Loading (search)
                  if (state is VideoSearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  ///  Error
                  if (state is VideoError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }

                  ///  Search Empty
                  if (state is VideoSearchEmpty) {
                    return const Center(
                      child: Text("No results found"),
                    );
                  }

                  ///  Search Loaded
                  if (state is VideoSearchLoaded) {
                    final videos = state.videos;

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SectionRow(
                            title: l10n.videos,
                            videos: videos,
                          ),
                        ],
                      ),
                    );
                  }

                  ///  Get All Loaded
                  if (state is VideoLoaded) {
                    final videos = state.videos;

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SectionRow(
                            title: l10n.videos,
                            videos: videos,
                          ),
                        ],
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}