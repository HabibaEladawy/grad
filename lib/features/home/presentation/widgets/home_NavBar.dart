import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../../../core/theming/app_text_styles.dart';

//
// class HomeNavBar extends StatelessWidget {
//   const HomeNavBar({
//     super.key,
//     required this.navKey,
//     required this.selectedIndex,
//     required this.isDark,
//     required this.icons,
//     required this.outlinedIcons,
//     required this.labels,
//     required this.onTap,
//   });
//
//   final GlobalKey<CurvedNavigationBarState> navKey;
//   final int selectedIndex;
//   final bool isDark;
//   final List<String> icons;
//   final List<String> outlinedIcons;
//   final List<String> labels;
//   final ValueChanged<int> onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return CurvedNavigationBar(
//       key: navKey,
//       index: selectedIndex,
//       color: isDark
//           ? AppColors.bg_card_default_dark
//           : AppColors.bg_card_default_light,
//       backgroundColor: Colors.transparent,
//       buttonBackgroundColor: isDark
//           ? AppColors.button_primary_default_dark
//           : AppColors.button_primary_default_light,
//       items: List.generate(
//         icons.length,
//             (index) => _NavBarItem(
//           isSelected: selectedIndex == index,
//           iconSrc: icons[index],
//           outlinedIconSrc: outlinedIcons[index],
//           label: labels[index],
//         ),
//       ),
//       onTap: onTap,
//     );
//   }
// }
//
// class _NavBarItem extends StatelessWidget {
//   const _NavBarItem({
//     required this.isSelected,
//     required this.iconSrc,
//     required this.outlinedIconSrc,
//     required this.label,
//   });
//
//   final bool isSelected;
//   final String iconSrc;
//   final String outlinedIconSrc;
//   final String label;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         if (isSelected)
//           Padding(
//             padding: EdgeInsets.all(8.r),
//             child: SvgPicture.asset(iconSrc, height: 24.r),
//           )
//         else ...[
//           SizedBox(height: 8.h),
//           SvgPicture.asset(outlinedIconSrc, height: 24.r),
//           Text(
//             label,
//             style: AppTextStyle.medium12TextBody(context),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ],
//     );
//   }
// }