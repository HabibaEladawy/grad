import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/features/books/presentation/views/screens/read_Book_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../../videos/presentation/widgets/custom_appbar.dart';
import '../../cubit/books_cubit.dart';
import '../widgets/book_card_horizontal.dart';

// class AllBooksScreen extends StatelessWidget {
//   static const String routeName = 'AllBooksScreen';
//
//   final String sectionTitle;
//
//   const AllBooksScreen({
//     super.key,
//     required this.sectionTitle,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final isDark =
//         context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
//     final isRtl = Localizations.localeOf(context).languageCode == 'ar';
//     final l10n = AppLocalizations.of(context)!;
//
//     return BlocProvider(
//       create: (context) => BookCubit(context.read())..getBooks(),
//       child: Scaffold(
//         backgroundColor: isDark
//             ? AppColors.bg_surface_default_dark
//             : AppColors.bg_surface_default_light,
//         body: Column(
//           crossAxisAlignment:
//           isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: [
//             SafeArea(
//               child: CustomAppbar(
//                 title: l10n.books,
//                 onSearchTap: () => Navigator.pop(context),
//               ),
//             ),
//             SizedBox(height: 12.h),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24.w),
//               child: Text(
//                 l10n.featuredBooks,
//                 textAlign: isRtl ? TextAlign.right : TextAlign.left,
//                 style: AppTextStyle.medium16TextHeading(context),
//               ),
//             ),
//             SizedBox(height: 12.h),
//
//             /// 🔥 هنا الربط الحقيقي
//             Expanded(
//               child: BlocBuilder<BookCubit, BookState>(
//                 builder: (context, state) {
//                   if (state is BookLoading) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//
//                   if (state is BookError) {
//                     return Center(
//                       child: Text(state.message),
//                     );
//                   }
//
//                   if (state is BookLoaded) {
//                     final books = state.books;
//
//                     return GridView.builder(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 24.w, vertical: 8.h),
//                       gridDelegate:
//                       SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 8.w,
//                         mainAxisSpacing: 8.h,
//                         childAspectRatio: 0.75,
//                       ),
//                       itemCount: books.length,
//                       itemBuilder: (context, index) {
//                         final book = books[index];
//
//                         return GestureDetector(
//                           onTap: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => ReadBookScreen(book: book),
//                             ),
//                           ),
//                           child: BookCardHorizontal(book: book),
//                         );
//                       },
//                     );
//                   }
//
//                   return const SizedBox();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }