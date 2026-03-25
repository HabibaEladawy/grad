import 'package:dana_graduation_project/features/Examination/presentation/views/widgets/response_Chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/examination_model.dart';

class ResponseSelector extends StatelessWidget {
  final ResponseOption? selectedOption;
  final ValueChanged<ResponseOption> onSelected;

  const ResponseSelector({
    super.key,
    required this.selectedOption,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    return Row(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      children: ResponseOption.values.map((option) {
        final isLast = option == ResponseOption.values.last;
        return Flexible( // ✅ بدل Expanded عشان متعملش overflow
          child: Padding(
            padding: EdgeInsets.only(
              left: isRtl ? (isLast ? 0 : 8.w) : 0,
              right: isRtl ? 0 : (isLast ? 0 : 8.w),
            ),
            child: ResponseChip(
              label: option.label(context),
              isSelected: selectedOption == option,
              onTap: () => onSelected(option),
            ),
          ),
        );
      }).toList(),
    );
  }
}