
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../../videos/presentation/screens/search_Screen.dart';
import '../../../../videos/presentation/widgets/custom_appbar.dart';
import '../../../../videos/presentation/widgets/videos_TabBar.dart';
import '../../../data/model/book_Model.dart';
import '../widgets/books_horizontal_list.dart';
import '../widgets/books_section_header.dart';
import '../widgets/books_vertical_list.dart';
import 'all_Books_Screen.dart';

class BooksScreen extends StatefulWidget {
  static const String routeName = 'BooksScreen';
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  late String _activeTab;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;
    _activeTab = AppLocalizations.of(context)!.books;
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
              title: l10n.books,
              searchType: SearchType.books,
            ),
            SizedBox(height: 12.h),
            VideosTabBar(
              activeTab: _activeTab,
              onTabChanged: (t) => setState(() => _activeTab = t),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    BooksSectionHeader(
                      title: l10n.featuredBooks,
                      onViewAll: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AllBooksScreen(
                            books: getFeaturedBooks(context),
                            sectionTitle: l10n.featuredBooks,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    BooksHorizontalList(books: getFeaturedBooks(context)),
                    SizedBox(height: 24.h),
                    BooksSectionHeader(
                      title: l10n.guideBooks,
                      onViewAll: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AllBooksScreen(
                            books: getGuideBooks(context),
                            sectionTitle: l10n.guideBooks,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    BooksVerticalList(books: getGuideBooks(context)),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}