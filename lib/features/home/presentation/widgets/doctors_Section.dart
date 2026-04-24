import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_routes.dart';
import '../cubit/get_parent_profile_state.dart';
import 'doctor_card_home.dart';


// class DoctorsSection extends StatelessWidget {
//   const DoctorsSection({super.key, required this.state});
//
//   final ParentState state;
//
//   @override
//   Widget build(BuildContext context) {
//     final parent = state is ParentLoaded ? (state as ParentLoaded).parent : null;
//
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'الأفضل دايمًا لرعاية طفلك',
//               style: AppTextStyle.medium16TextHeading(context),
//             ),
//             GestureDetector(
//               onTap: () => Navigator.of(context).pushNamed(AppRoutes.doctors),
//               child: Text(
//                 'عرض الكل',
//                 style: AppTextStyle.regular12TextBody(context),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 12.h),
//         state is ParentLoading
//             ? const CircularProgressIndicator()
//             : SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: List.generate(
//               parent?.children.length ?? 0,
//                   (index) => Container(
//                 margin: EdgeInsets.only(
//                   right: index == 0 ? 0 : 4,
//                   left:
//                   index == (parent?.children.length ?? 0) - 1 ? 0 : 4,
//                 ),
//                 child: DoctorCardHome(
//                   doctorName: parent!.children[index].childName,
//                   imageSrc: 'assets/Images/home/doctor1.png',
//                   rate: 4.9,
//                   width: 137.w,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }