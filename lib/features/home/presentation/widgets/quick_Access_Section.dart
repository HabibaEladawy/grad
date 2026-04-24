import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/widgets/Custom_Text_Frame.dart';

//
// class QuickAccessSection extends StatelessWidget {
//   const QuickAccessSection({super.key, required this.isDark});
//
//   final bool isDark;
//
//   Color get _iconBg =>
//       isDark ? AppColors.primary_50_dark : AppColors.primary_50_light;
//
//   Color get _iconColor =>
//       isDark
//           ? const Color.fromARGB(255, 63, 157, 168)
//           : AppColors.primary_default_light;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 16.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('الوصول السريع', style: AppTextStyle.medium16TextHeading(context)),
//           SizedBox(height: 12.h),
//           _QuickAccessRow(
//             items: [
//               _QuickAccessItem(
//                 label: 'افحص إبنك',
//                 iconSrc: 'assets/icons/home/check_icon.svg',
//                 route: AppRoutes.examination,
//                 iconBg: _iconBg,
//                 iconColor: _iconColor,
//               ),
//               _QuickAccessItem(
//                 label: 'الفديوهات',
//                 iconSrc: 'assets/icons/home/videos_icon.svg',
//                 route: AppRoutes.videos,
//                 iconBg: _iconBg,
//                 iconColor: _iconColor,
//               ),
//             ],
//           ),
//           SizedBox(height: 8.h),
//           _QuickAccessRow(
//             items: [
//               _QuickAccessItem(
//                 label: 'الكتب والمقالات',
//                 iconSrc: 'assets/icons/home/books_icon.svg',
//                 route: AppRoutes.books,
//                 iconBg: _iconBg,
//                 iconColor: _iconColor,
//               ),
//               _QuickAccessItem(
//                 label: 'التطعيمات',
//                 iconSrc: 'assets/icons/profile/vaccin_icon.svg',
//                 route: AppRoutes.vaccine,
//                 iconBg: _iconBg,
//                 iconColor: _iconColor,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _QuickAccessRow extends StatelessWidget {
//   const _QuickAccessRow({required this.items});
//
//   final List<_QuickAccessItem> items;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: items
//           .map(
//             (item) => CustomTextFrame(
//           width: 192.w,
//           text: item.label,
//           preIconSrc: item.iconSrc,
//           preIconBackgroundColor: item.iconBg,
//           preIconColor: item.iconColor,
//           onTap: () => Navigator.of(context).pushNamed(item.route),
//         ),
//       )
//           .toList(),
//     );
//   }
// }
//
// class _QuickAccessItem {
//   const _QuickAccessItem({
//     required this.label,
//     required this.iconSrc,
//     required this.route,
//     required this.iconBg,
//     required this.iconColor,
//   });
//
//   final String label;
//   final String iconSrc;
//   final String route;
//   final Color iconBg;
//   final Color iconColor;
// }