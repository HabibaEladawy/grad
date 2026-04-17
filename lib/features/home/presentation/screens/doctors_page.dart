
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/Custom_BackButton.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../../core/di/injection_container.dart';
import '../cubit/doctor_cubit.dart';
import '../cubit/doctor_state.dart';
import '../widgets/doctor_card_home.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  static const String routeName = 'DoctorsScreen';

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
            (themeProvider.appTheme == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

    return BlocProvider(
      create: (_) => sl<DoctorCubit>()..getAllDoctors(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: isDark
                ? AppColors.bg_card_default_dark
                : AppColors.bg_card_default_light,
            elevation: 0,
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: 56.w,
            titleSpacing: 0,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الدكاترة',
                    style: AppTextStyle.medium16TextHeading(context),
                  ),
                  CustomBackButton(
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: BlocBuilder<DoctorCubit, DoctorState>(
              builder: (context, state) {
                if (state is DoctorLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is DoctorError) {
                  print("oopssssssssssssssssss");
                  return Center(

                    child: Text(
                      state.message,
                      style: AppTextStyle.medium16TextHeading(context),
                    ),
                  );
                }

                if (state is DoctorLoaded) {
                  print("الصور تماااااااااااااااام");
                  final doctors = state.doctors;

                  if (doctors.isEmpty) {
                    return Center(
                      child: Text(
                        'لا يوجد دكاترة',
                        style: AppTextStyle.medium16TextHeading(context),
                      ),
                    );
                  }

                  return GridView.builder(
                    itemCount: doctors.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.w,
                      mainAxisSpacing: 8.h,
                      childAspectRatio: 192.w / 230.h,
                    ),
                    itemBuilder: (context, index) {
                      final doctor = doctors[index];
                      return DoctorCardHome(
                        doctorName: doctor.doctorName,
                        imageSrc: doctor.profileImage ??  'assets/Images/home/doctor2.png',
                        rate: doctor.ratingAverage,
                        specialty: doctor.specialty, // ✅
                      );
                    },
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}