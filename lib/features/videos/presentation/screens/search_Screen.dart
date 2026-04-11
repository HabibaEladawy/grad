import 'package:dana_graduation_project/features/videos/presentation/screens/videos_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../providers/app_theme_provider.dart';

import '../../../books/data/model/book_Model.dart';
import '../../../books/presentation/views/screens/read_Book_Screen.dart';
import '../../../books/presentation/views/widgets/book_card_vertical.dart';
import '../../data/model/video_Model.dart';
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
  List<VideoModel> _videoResults = [];
  List<BookModel> _bookResults = [];
  bool _hasSearched = false;

  void _search(String query) {
    setState(() {
      _hasSearched = query.trim().isNotEmpty;

      if (widget.searchType == SearchType.videos) {
        final allVideos = getVideoSections(context).expand((s) => s.videos).toList();
        _videoResults = query.trim().isEmpty
            ? []
            : allVideos.where((v) => v.title.trim().contains(query.trim())).toList();
      } else {
        final allBooks = [...getFeaturedBooks(context), ...getGuideBooks(context)];
        _bookResults = query.trim().isEmpty
            ? []
            : allBooks.where((b) => b.title.trim().contains(query.trim())).toList();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    if (!_hasSearched) return const SizedBox.shrink();

    if (widget.searchType == SearchType.videos) {
      if (_videoResults.isEmpty) return const NoResultsWidget();
      return SearchResults(results: _videoResults);
    } else {
      if (_bookResults.isEmpty) return const NoResultsWidget();
      return BooksSearchResults(results: _bookResults);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return SizedBox(
      height: 956.h,
      child: Container(
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.bg_surface_default_dark
              : AppColors.bg_surface_default_light,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
      ),
    );
  }
}

class BooksSearchResults extends StatelessWidget {
  final List<BookModel> results;

  const BooksSearchResults({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    if (results.isEmpty) return const NoResultsWidget();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ReadBookScreen(book: results[index]),
              ),
            );
          },
          child: BookCardVertical(book: results[index]),
        ),
      ),
    );
  }
}