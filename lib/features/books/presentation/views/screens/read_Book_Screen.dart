import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../../../../core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../cubit/books_cubit.dart';
import '../widgets/book_info_card.dart';

import '../widgets/read_book_app.dart';

class ReadBookScreen extends StatefulWidget {
  final String bookId;

  const ReadBookScreen({
    super.key,
    required this.bookId,
  });

  @override
  State<ReadBookScreen> createState() => _ReadBookScreenState();
}

class _ReadBookScreenState extends State<ReadBookScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookCubit>().getBookById(widget.bookId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    final isRtl =
        Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      appBar: const ReadBookAppBar(),

      body:
        BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          if (state is BookLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is BookError) {
            return Center(

              child: Text(state.message
              ),
            );

          }

          if (state is BookDetailsLoaded) {
            final book = state.book;

            return ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 16.h,
              ),
              children: [
                BookInfoCard(book: book),

                SizedBox(height: 16.h),

                if (book.description.isNotEmpty) ...[
                  Text(
                    book.description,
                    textAlign: isRtl
                        ? TextAlign.right
                        : TextAlign.left,
                    style: AppTextStyle.regular12TextBody(context),
                  ),
                  SizedBox(height: 24.h),
                ],

                ElevatedButton(
                  onPressed: () async {
                    final uri = Uri.parse(book.link);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                  child: const Text("Open Book"),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}