import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/features/books/presentation/views/screens/read_Book_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../../videos/presentation/cubit/video_cubit.dart';
import '../../../../videos/presentation/widgets/custom_appbar.dart';
import '../../../../videos/presentation/widgets/videos_TabBar.dart';
import '../../cubit/books_cubit.dart';
import '../widgets/book_card_horizontal.dart';

class AllBooksScreen extends StatefulWidget {
  static const String routeName = 'AllBooksScreen';

  final String sectionTitle;

  const AllBooksScreen({super.key, required this.sectionTitle});

  @override
  State<AllBooksScreen> createState() => _AllBooksScreenState();
}

class _AllBooksScreenState extends State<AllBooksScreen> {
  String _activeTab = 'books';

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    final isRtl =
        Localizations.localeOf(context).languageCode == 'ar';

    final l10n = AppLocalizations.of(context)!;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<BookCubit>()..getBooks()),
        BlocProvider(create: (context) => sl<VideoCubit>()),
      ],
      child: Scaffold(
        backgroundColor: isDark
            ? AppColors.bg_surface_default_dark
            : AppColors.bg_surface_default_light,
        body: Column(
          crossAxisAlignment:
          isRtl ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            SafeArea(
              child: CustomAppbar(
                title: l10n.books,
                onSearchTap: () => Navigator.pop(context),
              ),
            ),

            /// 🔥 TAB BAR
            VideosTabBar(
              activeTab: _activeTab,
              onTabChanged: (t) {
                setState(() => _activeTab = t);

                if (t == 'videos') {
                  context.read<VideoCubit>().getAllVideos();
                } else {
                  context.read<BookCubit>().getBooks();
                }
              },
            ),

            SizedBox(height: 12.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                widget.sectionTitle,
                textAlign: isRtl ? TextAlign.right : TextAlign.left,
                style: AppTextStyle.medium16TextHeading(context),
              ),
            ),

            SizedBox(height: 12.h),

            ///  CONTENT
            Expanded(
              child: _activeTab == 'videos'
                  ? BlocBuilder<VideoCubit, VideoState>(
                builder: (context, state) {
                  if (state is VideoLoading) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }

                  if (state is VideoError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is VideoLoaded) {
                    final videos = state.videos;

                    if (videos.isEmpty) {
                      return const Center(
                          child: Text('لا يوجد فيديوهات'));
                    }

                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      itemCount: videos.length,
                      itemBuilder: (_, i) {
                        final video = videos[i];

                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: Text(video.title),
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              )
                  : BlocBuilder<BookCubit, BookState>(
                builder: (context, state) {
                  if (state is BookLoading) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }

                  if (state is BookError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is BookLoaded) {
                    final books = state.books;

                    if (books.isEmpty) {
                      return const Center(child: Text('لا يوجد كتب'));
                    }

                    return GridView.builder(
                      padding:
                      EdgeInsets.symmetric(horizontal: 24.w),
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 8.h,
                        mainAxisExtent: 230.h,
                      ),
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        final book = books[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ReadBookScreen(
                                  bookId: book.id,
                                ),
                              ),
                            );
                          },
                          child: BookCardHorizontal(book: book),
                        );
                      },
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