

import 'package:flutter/cupertino.dart';

import '../screens/Appointments_Screen.dart';
import 'Appointment_Card.dart';
import 'Empty_State_Widget.dart';

class AppointmentsList extends StatefulWidget {
  final List<Appointment> appointments;
  final Status status;

  const AppointmentsList({
    super.key,
    required this.appointments,
    required this.status,
  });

  @override
  State<AppointmentsList> createState() => _AppointmentsListState();
}

class _AppointmentsListState extends State<AppointmentsList> {
  void removeItem(Appointment appointment) {
    setState(() {
      widget.appointments.remove(appointment);
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtered = widget.appointments
        .where((e) => e?.status == widget.status)
        .toList();

    if (filtered.isEmpty) {
      return const EmptyStateWidget();
    }

    return ListView.builder(
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        return AppointmentCard(
          appointment: filtered[index],
          onCancel: () {
            removeItem(filtered[index]);
          },
        );
      },
    );
  }
}