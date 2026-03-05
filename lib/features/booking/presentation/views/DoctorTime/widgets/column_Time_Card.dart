import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/DoctorTime/widgets/time_Card.dart';
import 'package:flutter/cupertino.dart';

//done
class ColumnTimeCard extends StatefulWidget {
  const ColumnTimeCard({super.key});

  @override
  State<ColumnTimeCard> createState() => _ColumnTimeCardState();
}

class _ColumnTimeCardState extends State<ColumnTimeCard> {
  int _selectedIndex = -1;

  final List<String> times = const [
    '11:30 AM', '11:00 AM', '10:30 AM', '10:00 AM',
    '01:30 AM', '01:00 AM', '12:30 AM', '12:00 AM',
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = (screenWidth - 32 - (8 * 3)) / 4;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Wrap(
        spacing: AppRadius.space_sm,
        runSpacing:  AppRadius.space_sm,
        children: List.generate(
          times.length,
              (index) => SizedBox(
            width: cardWidth,
            child: TimeCard(
              textTime: times[index],
              isSelected: _selectedIndex == index,
              onTap: () => setState(() => _selectedIndex = index),
            ),
          ),
        ),
      ),
    );
  }
}