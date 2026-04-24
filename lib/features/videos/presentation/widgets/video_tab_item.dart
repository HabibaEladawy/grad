import 'package:dana_graduation_project/features/videos/presentation/widgets/video_tab_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_routes.dart';

// class VideoTabItem extends StatelessWidget {
//   const VideoTabItem({
//     super.key,
//     required this.tab,
//     required this.isActive,
//     required this.isDark,
//     required this.isRtl,
//     required this.isLast,
//     required this.onTabChanged,
//   });
//
//   final Map<String, Object> tab;
//   final bool isActive;
//   final bool isDark;
//   final bool isRtl;
//   final bool isLast;
//   final void Function(String) onTabChanged;
//
//   @override
//   Widget build(BuildContext context) {
//
//     final color = isActive
//         ? (isDark
//         ? AppColors.primary_default_dark
//         : AppColors.primary_default_light)
//         : (isDark
//         ? AppColors.icon_onLight_dark
//         : AppColors.icon_onLight_light);
//
//     final textStyle = isActive
//         ? AppTextStyle.medium12TextButton(context)
//         : AppTextStyle.medium12TextBody(context);
//
//     return Expanded(
//       child: Padding(
//         padding: EdgeInsets.only(
//           left: isRtl ? (isLast ? 0 : 8.w) : 0,
//           right: isRtl ? 0 : (isLast ? 0 : 8.w),
//         ),
//         child: GestureDetector(
//           onTap: () {
//             onTabChanged(tab['label'] as String);
//
//             switch (tab['key']) {
//               case 'books':
//                 Navigator.pushReplacementNamed(context, AppRoutes.books);
//                 break;
//               case 'videos':
//                 Navigator.pushReplacementNamed(context, AppRoutes.videos);
//                 break;
//               case 'examination':
//                 Navigator.pushReplacementNamed(context, AppRoutes.examination);
//                 break;
//             }
//           },
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 180),
//             padding: EdgeInsets.all(10.w),
//             decoration: BoxDecoration(
//               color: isActive
//                   ? (isDark
//                   ? AppColors.primary_50_dark
//                   : AppColors.primary_50_light)
//                   : (isDark
//                   ? AppColors.bg_card_default_dark
//                   : AppColors.bg_card_default_light),
//               border: Border.all(
//                 width: 0.6,
//                 color: isActive
//                     ? (isDark
//                     ? AppColors.primary_default_dark
//                     : AppColors.primary_default_light)
//                     : (isDark
//                     ? AppColors.border_card_default_dark
//                     : AppColors.border_card_default_light),
//               ),
//               borderRadius: BorderRadius.circular(AppRadius.radius_sm),
//             ),
//             child: VideoTabContent(
//               icon: tab['icon'] as String,
//               label: tab['label'] as String,
//               color: color,
//               style: textStyle,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }