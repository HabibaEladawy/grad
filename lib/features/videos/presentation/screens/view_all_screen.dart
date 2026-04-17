import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../cubit/video_cubit.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/videos_TabBar.dart';
import '../widgets/view_all_widget.dart';

class ViewAllScreen extends StatefulWidget {
  static const String routeName = 'ViewAllScreen';

  final String sectionTitle;

  const ViewAllScreen({
    super.key,
    required this.sectionTitle,
  });

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  late String _activeTab;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;
    _initialized = true;

    _activeTab = AppLocalizations.of(context)!.videos;

    // ✅ أول ما الشاشة تفتح نجيب الفيديوهات
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
            SizedBox(height: 12.h),

            // AppBar
            CustomAppbar(title: widget.sectionTitle),

            SizedBox(height: 12.h),

            // Tabs
            VideosTabBar(
              activeTab: _activeTab,
              onTabChanged: (t) {
                setState(() => _activeTab = t);

                // لو عندك tabs مستقبلًا
                if (t == l10n.videos) {
                  context.read<VideoCubit>().getAllVideos();
                }
              },
            ),

            SizedBox(height: 16.h),

            // Content
            Expanded(
              child: BlocBuilder<VideoCubit, VideoState>(
                builder: (context, state) {
                  if (state is VideoLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is VideoError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }

                  if (state is VideoLoaded) {
                    return SingleChildScrollView(
                      child: ViewAllWidget(
                        videos: state.videos,
                        sectionTitle: widget.sectionTitle,
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