
import 'package:dana_graduation_project/features/booking/presentation/views/DoctorTime/widgets/date_Card.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/DoctorTime/widgets/month_Selector_Row.dart';
import 'package:flutter/material.dart';
//done
// class DoctorDateSection extends StatefulWidget {
//   const DoctorDateSection({super.key});
//
//   @override
//   State<DoctorDateSection> createState() => _DoctorDateSectionState();
// }
//
// class _DoctorDateSectionState extends State<DoctorDateSection> {
//   int _selectedIndex = -1;
//
//   final List<Map<String, dynamic>> dates = const [
//     {'number': 20, 'day': 'السبت'},
//     {'number': 19, 'day': 'الجمعة'},
//     {'number': 18, 'day': 'الخميس'},
//     {'number': 17, 'day': 'الأربع'},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       // crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         const MonthSelectorRow(),
//
//         Row(
//           // spacing: 3,
//           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: List.generate(
//             dates.length,
//                 (index) => DateCard(
//
//
//               number: dates[index]['number'] as int,
//               day: dates[index]['day'] as String,
//               isSelected: _selectedIndex == index,
//               onTap: () => setState(() => _selectedIndex = index),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
