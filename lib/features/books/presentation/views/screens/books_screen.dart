
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../../videos/presentation/widgets/custom_appbar.dart';
import '../../../../videos/presentation/widgets/videos_TabBar.dart';
import '../../cubit/books_cubit.dart';
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

    print(' getBooks called');
    context.read<BookCubit>().getBooks();
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
            CustomAppbar(
              title: l10n.books,
            ),

            SizedBox(height: 12.h),

            VideosTabBar(
              activeTab: _activeTab,
              onTabChanged: (t) => setState(() => _activeTab = t),
            ),

            Expanded(
              child: BlocBuilder<BookCubit, BookState>(
                builder: (context, state) {
                  print(' state: $state');

                  if (state is BookLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is BookError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }

                  if (state is BookLoaded) {
                    if (state.books.isEmpty) {
                      return const Center(
                        child: Text('No books available'),
                      );
                    }

                    final featuredBooks = state.books.take(6).toList();
                    final guideBooks = state.books.skip(6).toList();

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 16.h),


                          BooksSectionHeader(
                            title: l10n.featuredBooks,
                            onViewAll: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AllBooksScreen(
                                    sectionTitle: l10n.featuredBooks,
                                  ),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 12.h),

                          BooksHorizontalList(books: featuredBooks),

                          SizedBox(height: 24.h),


                          BooksSectionHeader(
                            title: l10n.guideBooks,
                            onViewAll: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AllBooksScreen(
                                    sectionTitle: l10n.guideBooks,
                                  ),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 12.h),

                          BooksVerticalList(books: guideBooks),

                          SizedBox(height: 24.h),
                        ],
                      ),
                    );
                  }

                  return Center(
                    child: Text('state: $state'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}