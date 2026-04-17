
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Custom_BackButton.dart';
import '../../../core/widgets/Custom_Frame.dart';
import '../../../providers/app_theme_provider.dart';
import '../bottom_sheets/data_bottom_sheet.dart';

class _SkillCardData {
  final String title;
  final String subtitle;
  final String count;
  final String bottomSheetTitle;
  final String bottomSheetDescription;
  final List<String> bottomSheetItems;

  const _SkillCardData({
    required this.title,
    required this.subtitle,
    required this.count,
    required this.bottomSheetTitle,
    required this.bottomSheetDescription,
    required this.bottomSheetItems,
  });
}

const List<_SkillCardData> _skillCards = [
  _SkillCardData(
    title: 'حركته ونشاطه',
    subtitle: 'خطواته وتطوره الجسدي يوم ورا يوم',
    count: '10/08',
    bottomSheetTitle: 'تطور حركته',
    bottomSheetDescription: '''طمنا، إيه الحاجات اللي طفلك بدأ يعملها مؤخراً؟ 
(تقدر تختار أكتر من مهارة.. وكل طفل بياخد وقته براحته).''',
    bottomSheetItems: [
      'بيمشي ويجري بثبات من غير ما يقع.',
      'بيعرف يطلع السلم وينزل لوحده.',
      'بيقدر ينط في مكانه على رجليه الاتنين.',
      'بيمسك القلم وبيحاول يشخبط بوضوح.',
    ],
  ),
  _SkillCardData(
    title: 'كلامه وتعبيره',
    subtitle: 'كلماته الجديدة وطريقة تواصله',
    count: '10/07',
    bottomSheetTitle: 'صوته وحكاياته',
    bottomSheetDescription: '''كل كلمة جديدة بينطقها إنجاز.. شاركونا تطور كلامه
(تقدر تختار أكتر من مهارة.. وكل طفل بياخد وقته براحته).''',
    bottomSheetItems: [
      'بيعرف يقول اسمه الأول وسنه لما حد يسأله.',
      'بيقدر يكوّن جملة بسيطة من ٣ لـ ٤ كلمات.',
      'الناس الغريبة بتقدر تفهم أغلب كلامه.',
      'بدأ يسأل أسئلة كتير زي "ليه؟" و"إيه ده؟".',
    ],
  ),
  _SkillCardData(
    title: 'فهمه وإدراكه',
    subtitle: 'استيعابه واكتشافه للعالم حواليه',
    count: '10/05',
    bottomSheetTitle: 'بيكتشف العالم',
    bottomSheetDescription:
        '''عقله بيكبر وبيفهم أكتر.. إيه المهارات اللي لاحظتوها عليه دلوقتي؟
(تقدر تختار أكتر من مهارة.. وكل طفل بياخد وقته براحته).''',
    bottomSheetItems: [
      'بيقدر يطابق الأشكال والألوان ببعضها.',
      'بيقدر يركب بازل بسيط (من ٣ لـ ٤ قطع).',
      'بيفتكر أماكن ألعابه وحاجاته المفضلة في البيت.',
      'يفهم الأوامر المركبة مثل "هات الكورة".',
    ],
  ),
  _SkillCardData(
    title: 'مشاعره واجتماعياته',
    subtitle: 'تعامله وتفاعله مع اللي حواليه',
    count: '10/08',
    bottomSheetTitle: 'مشاعره وتعامله',
    bottomSheetDescription:
        '''شخصيته بتبان وتكبر.. إيه التطورات اللي لاحظتوها في تفاعله؟
(تقدر تختار أكتر من مهارة.. وكل طفل بياخد وقته براحته).''',
    bottomSheetItems: [
      'بيحب يلعب مع أطفال تانيين (مش بيلعب لوحده بس).',
      'بدأ يفهم فكرة "الدور" (أنا ألعب شوية وأنت شوية).',
      'بيبان عليه التعاطف لما يشوف طفل تاني زعلان.',
      'بيحاول يعتمد على نفسه (زي إنه ياكل لوحده).',
    ],
  ),
];

class SkillsHorizontalList extends StatelessWidget {
  const SkillsHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          children: [
            for (int i = 0; i < _skillCards.length; i++) ...[
              _SkillCard(data: _skillCards[i]),
              if (i < _skillCards.length - 1) SizedBox(width: 8.w),
            ],
          ],
        ),
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final _SkillCardData data;

  const _SkillCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return CustomFrame(
      width: 192.w,
      vPadding: 12.h,
      hPadding: 12.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.secondary_50_dark
                  : AppColors.secondary_50_light,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 4.h),
            child: Text(
              data.title,
              style: AppTextStyle.semibold16TextHeading(context),
            ),
          ),
          Text(data.subtitle, style: AppTextStyle.medium12TextBody(context)),

          const Spacer(),
          SizedBox(height: 12.h),

          Row(
            children: [
              Text(
                data.count,
                style: AppTextStyle.semibold16Secondary(context),
              ),
              SizedBox(width: 4.w),
              Text('مهارة', style: AppTextStyle.regular12TextBody(context)),
              const Spacer(),
              CustomBackButton(
                width: 24.w,
                height: 24.w,
                borderColor: isDark
                    ? AppColors.secondary_50_dark
                    : AppColors.secondary_50_light,
                color: isDark
                    ? AppColors.secondary_50_dark
                    : AppColors.secondary_50_light,
                iconPadding: 4.w,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: isDark
                        ? AppColors.bg_surface_default_dark
                        : AppColors.bg_surface_default_light,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                    ),
                    builder: (_) => DataBottomSheet(
                      title: data.bottomSheetTitle,
                      description: data.bottomSheetDescription,
                      items: data.bottomSheetItems,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
