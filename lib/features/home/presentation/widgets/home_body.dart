import 'package:dana_graduation_project/features/home/presentation/widgets/quick_Access_Section.dart';
import 'package:dana_graduation_project/features/home/presentation/widgets/stats_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../cubit/get_parent_profile_cubit.dart';
import '../cubit/get_parent_profile_state.dart';
import 'doctors_Section.dart';



// class HomeBody extends StatelessWidget {
//   const HomeBody({super.key, required this.isDark});
//
//   final bool isDark;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           color: isDark ? AppColors.primary_600_dark : AppColors.primary_600_light,
//           height: 124.h,
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.w),
//           child: Directionality(
//             textDirection: TextDirection.rtl,
//             child: BlocBuilder<ParentCubit, ParentState>(
//               builder: (context, state) {
//                 return ListView(
//                   children: [
//                     StatsCard(state: state),
//                     QuickAccessSection(isDark: isDark),
//                     DoctorsSection(state: state),
//                     SizedBox(height: 38.h),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }