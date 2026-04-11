import 'package:dana_graduation_project/features/videos/presentation/screens/search_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../data/model/video_Model.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/section_Row.dart';
import '../widgets/videos_TabBar.dart';

List<VideoSection> getVideoSections(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  return [
    VideoSection(
      title: l10n.understandSPD,
      videos: [
        VideoModel(title: l10n.sensoryActivities, duration: '24:00', imageUrl: AppAssets.image_v3),
        VideoModel(title: l10n.angerManagement, duration: '24:00', imageUrl: AppAssets.image_v2),
        VideoModel(title: l10n.sensoryDisorder, duration: '24:00', imageUrl: AppAssets.image_v1),
      ],
    ),
    VideoSection(
      title: l10n.babyGrowth,
      videos: [
        VideoModel(title: l10n.motorDevelopment, duration: '24:00', imageUrl: AppAssets.image_v6),
        VideoModel(title: l10n.firstWords, duration: '24:00', imageUrl: AppAssets.image_v5),
        VideoModel(title: l10n.motorDevelopment, duration: '24:00', imageUrl: AppAssets.image_v4),
      ],
    ),
    VideoSection(
      title: l10n.healthCapsules,
      videos: [
        VideoModel(title: l10n.sleepCapsule, duration: '24:00', imageUrl: AppAssets.image_v2),
        VideoModel(title: l10n.nutritionCapsule, duration: '24:00', imageUrl: AppAssets.image_v8),
        VideoModel(title: l10n.nutritionCapsule, duration: '24:00', imageUrl: AppAssets.image_v2),

      ],
    ),
  ];
}

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
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              title: l10n.videos,
              searchType: SearchType.videos,
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  VideosTabBar(
                    activeTab: _activeTab,
                    onTabChanged: (t) => setState(() => _activeTab = t),
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: getVideoSections(context)
                            .map((section) => SectionRow(section: section))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}