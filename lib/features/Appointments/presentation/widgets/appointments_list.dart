import 'package:dana/features/Appointments/data/models/appointment_model.dart';
import 'package:dana/features/Appointments/presentation/widgets/appointment_card.dart';
import 'package:dana/features/Appointments/presentation/widgets/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../booking/presentation/cubit/booking_cubit.dart';

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
  @override
  Widget build(BuildContext context) {
    final filtered = widget.appointments
        .where((e) => e.status == widget.status)
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
            final childId = filtered[index].childId;
            if (childId == null || childId.isEmpty) return;
            context.read<BookingCubit>().cancelByChildId(childId: childId);
          },
        );
      },
    );
  }
}
