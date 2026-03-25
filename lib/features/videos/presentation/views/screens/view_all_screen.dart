import 'package:dana_graduation_project/features/videos/presentation/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../data/model/video_Model.dart';
import '../widgets/videos_TabBar.dart';
import '../widgets/view_all_widget.dart';

class ViewAllScreen extends StatefulWidget {
  static const String routeName = 'ViewAllScreen';
  final List<VideoModel> videos;
  final String sectionTitle;

  const ViewAllScreen({
    super.key,
    required this.videos,
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
            SizedBox(height: 12.h),
            CustomAppbar(title: l10n.videos),
            SizedBox(height: 12.h),
            VideosTabBar(
              activeTab: _activeTab, // ✅ state مش ثابت
              onTabChanged: (t) => setState(() => _activeTab = t), // ✅
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: SingleChildScrollView(
                child: ViewAllWidget(
                  videos: widget.videos,
                  sectionTitle: widget.sectionTitle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}