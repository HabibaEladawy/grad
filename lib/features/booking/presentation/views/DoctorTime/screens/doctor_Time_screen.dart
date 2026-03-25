
import 'package:dana_graduation_project/core/utils/app_assets.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/DoctorTime/widgets/doctor_booking_sheet.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

///done
// class DoctorTimeScreen extends StatelessWidget {
//   static const String routeName = 'DoctorTimeScreen';
//
//   const DoctorTimeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             height: screenHeight * 0.5,
//             child: InkWell(
//               onTap: () => _showBookingSheet(context),
//               child: Image.asset(
//                 AppAssets.doctor,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//
//           Positioned(
//             top: 50,
//             left: 20,
//             child: const CircleAvatar(  // ❌ شيلنا الـ InkWell من هنا
//               backgroundColor: AppColors.whiteColor,
//               child: Icon(
//                 Icons.arrow_forward_ios,
//                 size: 16,
//                 color: AppColors.icon_onLight_light,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   //
//   // void _showBookingSheet(BuildContext context) {
//   //   showModalBottomSheet(
//   //     context: context,
//   //     isScrollControlled: true,
//   //     useSafeArea: true,
//   //     backgroundColor: Colors.transparent,
//   //     builder: (context) => const DoctorBookingSheet(),
//   //   );
//   // }
//   void _showBookingSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       useSafeArea: true,
//       backgroundColor: Colors.transparent,
//       isDismissible: false,      // ✅ مش بيتقفل لما تضغط برا
//       enableDrag: false,         // ✅ مش بيتقفل لما تسحب لتحت
//       builder: (context) => const DoctorBookingSheet(),
//     );
//   }
// }
/////////////////////////////////////////////////////////////////
// class DoctorTimeScreen extends StatefulWidget {
//   static const String routeName = 'DoctorTimeScreen';
//
//   const DoctorTimeScreen({super.key});
//
//   @override
//   State<DoctorTimeScreen> createState() => _DoctorTimeScreenState();
// }
//
// class _DoctorTimeScreenState extends State<DoctorTimeScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _showBookingSheet(context);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             height: screenHeight * 0.5,
//             child: Image.asset(AppAssets.doctor, fit: BoxFit.cover),
//           ),
//
//           Positioned(
//             top: 50,
//             left: 20,
//             child: const CircleAvatar(
//               backgroundColor: AppColors.whiteColor,
//               child: Icon(
//                 Icons.arrow_forward_ios,
//                 size: 16,
//                 color: AppColors.icon_onLight_light,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showBookingSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       useSafeArea: true,
//       backgroundColor: Colors.transparent,
//       isDismissible: false,
//       enableDrag: false,
//       builder: (context) => const DoctorBookingSheet(),
//     );
//   }
// }
