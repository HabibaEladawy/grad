import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String doctorName;
  final String specialty;

  const ChatAppBar({
    super.key,
    required this.doctorName,
    required this.specialty,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
     return SizedBox(

       child: Container(
         color: AppColors.bg_card_default_light,
         width: 440,

         child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: const AssetImage('assets/Images/doctor_circle.png'),
              ),
            ),
            Column(


              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  doctorName,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyle.medium16TextHeading,
                ),
                SizedBox(width:AppSizes.w12),
                Text(
                  specialty,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyle.regular12TextBody,
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: const Icon(Icons.chevron_right, color: AppColors.text_heading_light,size: 24,),
              onPressed: () => Navigator.maybePop(context),
            ),


          ],
             ),
       ),
     );
  }
}