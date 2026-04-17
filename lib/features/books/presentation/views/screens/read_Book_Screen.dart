// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../../core/utils/app_colors.dart';
// import '../../../../../core/utils/app_raduis.dart';
// import '../../../../../core/utils/app_text_style.dart';
// import '../../../../../providers/app_theme_provider.dart';
// import '../../../data/model/book_Model_ui.dart';
// import '../../cubit/books_cubit.dart';
// import '../widgets/book_Divider.dart';
// import '../widgets/book_info_card.dart';
//
// import '../widgets/read_book_app.dart';
//
// class ReadBookScreen extends StatefulWidget {
//   final String bookId;
//
//   const ReadBookScreen({
//     super.key,
//     required this.bookId,
//   });
//
//   @override
//   State<ReadBookScreen> createState() => _ReadBookScreenState();
// }
//
// class _ReadBookScreenState extends State<ReadBookScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<BookCubit>().getBookById(widget.bookId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final isDark =
//         context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
//     final isRtl = Localizations.localeOf(context).languageCode == 'ar';
//
//     return Scaffold(
//       backgroundColor: isDark
//           ? AppColors.bg_surface_default_dark
//           : AppColors.bg_surface_default_light,
//       appBar: const ReadBookAppBar(),
//
//       body: BlocBuilder<BookCubit, BookState>(
//         builder: (context, state) {
//           if (state is BookDetailsLoaded) {
//             final book = state.book;
//
//             return ListView(
//               padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
//               children: [
//                 BookInfoCard(book: book),
//
//                 SizedBox(height: 16.h),
//
//                 Container(
//                   decoration: BoxDecoration(
//                     color: isDark
//                         ? AppColors.bg_card_default_dark
//                         : AppColors.bg_card_default_light,
//                     borderRadius: BorderRadius.circular(AppRadius.radius_sm),
//                   ),
//                   padding: EdgeInsets.all(16.w),
//                   child: Column(
//                     crossAxisAlignment: isRtl
//                         ? CrossAxisAlignment.end
//                         : CrossAxisAlignment.start,
//                     children: [
//                       ...(book.chapters ?? []).asMap().entries.map((entry) {
//                         final index = entry.key;
//                         final chapter = entry.value;
//
//                         return Column(
//                           crossAxisAlignment: isRtl
//                               ? CrossAxisAlignment.end
//                               : CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               chapter.title,
//                               textAlign:
//                               isRtl ? TextAlign.right : TextAlign.left,
//                               textDirection: isRtl
//                                   ? TextDirection.rtl
//                                   : TextDirection.ltr,
//                               style: AppTextStyle.semibold16TextHeading(context),
//                             ),
//
//                             SizedBox(height: 16.h),
//
//                             Text(
//                               chapter.body,
//                               textAlign:
//                               isRtl ? TextAlign.right : TextAlign.left,
//                               textDirection: isRtl
//                                   ? TextDirection.rtl
//                                   : TextDirection.ltr,
//                               style: AppTextStyle.regular12TextBody(context),
//                             ),
//
//                             SizedBox(height: 32.h),
//
//                             BookDivider(pageNumber: index + 1),
//
//                             SizedBox(height: 32.h),
//                           ],
//                         );
//                       }),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }