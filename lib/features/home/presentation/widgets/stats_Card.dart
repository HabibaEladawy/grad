import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constant/custom_buttom.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/Custom_Frame.dart';
import '../cubit/get_parent_profile_state.dart';


// class StatsCard extends StatelessWidget {
//   const StatsCard({super.key, required this.state});
//
//   final ParentState state;
//
//   @override
//   Widget build(BuildContext context) {
//     final parent = state is ParentLoaded ? (state as ParentLoaded).parent : null;
//     final child =
//     parent != null && parent.children.isNotEmpty
//         ? parent.children.first
//         : null;
//
//     return CustomFrame(
//       child: Column(
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.asset('assets/Images/boy_child_photo.png', width: 48.w),
//               SizedBox(width: 12.w),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 3.5.h),
//                 child: state is ParentLoading
//                     ? const CircularProgressIndicator()
//                     : state is ParentError
//                     ? Text((state as ParentError).message)
//                     : Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           child?.childName ?? '',
//                           style:
//                           AppTextStyle.semibold16TextHeading(context),
//                         ),
//                         SizedBox(width: 2.w),
//                         SvgPicture.asset(
//                           'assets/icons/arrow_drop_icon.svg',
//                           width: 16.w,
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 4.h),
//                     Text(
//                       '${child?.age ?? ''} سنوات',
//                       style: AppTextStyle.medium12TextBody(context),
//                     ),
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               CustomButton(
//                 borderRadius: AppRadius.radius_full,
//                 height: 32.w,
//                 width: 32.w,
//                 icon: Icons.arrow_forward_ios_rounded,
//                 iconSize: 14.w,
//                 onTap: () {
//                   Navigator.of(context).pushNamed(AppRoutes.childProfile);
//                 },
//               ),
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 12.h),
//             child: StatisticsChart(),
//           ),
//           _ChartLegend(),
//         ],
//       ),
//     );
//   }
// }
//
// class _ChartLegend extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         _LegendItem(
//           color: AppColors.secondary_default_light,
//           label: 'الطول (سم)',
//         ),
//         SizedBox(width: 16.w),
//         _LegendItem(
//           color: AppColors.icon_onLight_light,
//           label: 'محيط الرأس(سم)',
//         ),
//         SizedBox(width: 16.w),
//         _LegendItem(
//           color: AppColors.primary_default_light,
//           label: 'الوزن (كجم)',
//         ),
//       ],
//     );
//   }
// }
//
// class _LegendItem extends StatelessWidget {
//   const _LegendItem({required this.color, required this.label});
//
//   final Color color;
//   final String label;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           margin: EdgeInsets.only(left: 8.w),
//           width: 12.w,
//           height: 4.w,
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(AppRadius.radius_full),
//           ),
//         ),
//         Text(label, style: AppTextStyle.regular12TextBody(context)),
//       ],
//     );
//   }
// }