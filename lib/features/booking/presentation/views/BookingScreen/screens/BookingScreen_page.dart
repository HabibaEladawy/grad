///خطوة أخيرة... علشان نطمن على ابنك'
import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/core/widgets/custom_screen_header.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/BookingScreen/widgets/doctor_note_field.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/BookingScreen/widgets/patient_dropdown.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/BookingScreen/widgets/payment_option_card.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/BookingScreen/widgets/review_booking.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/BookingScreen/widgets/visit_type_selector.dart';

import 'package:flutter/material.dart';
///done
// class BookingScreen extends StatefulWidget {
//   const BookingScreen({super.key});
//
//   @override
//   State<BookingScreen> createState() => _BookingScreenState();
// }
//
// class _BookingScreenState extends State<BookingScreen> {
//   int _selectedPayment = 1;
//   int _selectedVisitType = 0;
//   final List<String> visitTypes = ['كشف', 'إعاده'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: AppColors.bg_surface_default_light,
//         appBar: AppBar(
//           backgroundColor:AppColors.bg_surface_default_light,
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               CustomScreenHeader(title:  'خطوة أخيرة... علشان نطمن على ابنك',
//
//                   subtitle:'اختار المريض وطريقة الدفع... وخلاص تكفل الحجز.')
//
//             ],
//           ),
//           actions: [
//             Container(
//               decoration: BoxDecoration(
//                 color: AppColors.bg_card_default_light,
//                 borderRadius: BorderRadius.circular(22)
//               ),
//
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_back_ios,size: 16, color: AppColors.icon_onLight_light),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ),
//           ],
//         ),
//         bottomNavigationBar: Builder(
//           builder: (builderContext) =>
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
//                 child: ElevatedButton(
//                               onPressed: () {
//                 showModalBottomSheet(
//                   context: builderContext,
//                   isScrollControlled: true,
//                   backgroundColor: Colors.white,
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//                   ),
//                   builder: (_) => ReviewBooking(parentContext: builderContext),
//                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.primary_default_light,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 minimumSize: const Size(double.infinity, 52),
//                               ),
//                               child: Text(
//                 'أحجز زيارتك',
//                 style: AppTextStyle.semibold16TextHeading.copyWith(color: Colors.white),
//                               ),
//                             ),
//               ),
//         ),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 8),
//               const PatientDropdown(),
//               const SizedBox(height: 16),
//               VisitTypeSelector(
//                 selectedIndex: _selectedVisitType,
//                 visitTypes: visitTypes,
//                 onSelect: (index) => setState(() => _selectedVisitType = index),
//               ),
//               const SizedBox(height: 16),
//               const DoctorNoteField(),
//               const SizedBox(height: 24),
//               Text('اختر طريقة الدفع', style: AppTextStyle.medium16TextDisplay(context)),
//               const SizedBox(height: 12),
//               PaymentOptionCard(
//                 value: 0,
//                 groupValue: _selectedPayment,
//                 label: 'الدفع عند الزيارة',
//                 icon: Icons.wallet,
//                 iconColor: Colors.green,
//                 onChanged: (val) => setState(() => _selectedPayment = val!),
//               ),
//               const SizedBox(height: 12),
//               PaymentOptionCard(
//                 value: 1,
//                 groupValue: _selectedPayment,
//                 label: 'الدفع عن طريق الفيزا',
//
//                 icon: Icons.credit_card,
//                 iconColor: Colors.blue,
//                 onChanged: (val) => setState(() => _selectedPayment = val!),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
