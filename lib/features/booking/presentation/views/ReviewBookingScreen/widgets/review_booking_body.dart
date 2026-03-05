import 'package:dana_graduation_project/features/booking/presentation/views/ReviewBookingScreen/widgets/doctor_Card_Widget.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/ReviewBookingScreen/widgets/patient_card_widget.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/ReviewBookingScreen/widgets/payment_card_widget.dart';
import 'package:flutter/cupertino.dart';

class ReviewBookingBody extends StatelessWidget {
  const ReviewBookingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          DoctorCardWidget(),
          SizedBox(height: 16),
          PatientCardWidget(),
          SizedBox(height: 16),
          PaymentCardWidget(),
        ],
      ),
    );
  }
}