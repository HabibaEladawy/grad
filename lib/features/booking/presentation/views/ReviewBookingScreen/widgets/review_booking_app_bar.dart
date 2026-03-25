
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class ReviewBookingAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const ReviewBookingAppBar({super.key});
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 0,
//       automaticallyImplyLeading: false,
//       title: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Text('مراجعة الحجز', style: AppTextStyle.medium20TextDisplay),
//           const SizedBox(height: 8),
//           Text('تأكد من التفاصيل قبل إكمال الحجز.', style: AppTextStyle.regular16TextBody),
//         ],
//       ),
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ],
//     );
//   }
// }