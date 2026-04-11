import 'package:dana_graduation_project/core/widgets/custom_textForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

import '../../../../../../../login/presentation/cubit/sign_up_cubit.dart';

class ChildInfoFormFields extends StatefulWidget {
  const ChildInfoFormFields({super.key});

  @override
  State<ChildInfoFormFields> createState() => _ChildInfoFormFieldsState();
}

class _ChildInfoFormFieldsState extends State<ChildInfoFormFields> {
  final _childNameController = TextEditingController();
  final _birthDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _childNameController.addListener(() =>
        context.read<SignUpCubit>().updateChildName(_childNameController.text));
    _birthDateController.addListener(() =>
        context.read<SignUpCubit>().updateChildBirthDate(_birthDateController.text));
  }

  @override
  void dispose() {
    _childNameController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextForm(
          text: AppLocalizations.of(context)!.childNameLabel,
          hintText: AppLocalizations.of(context)!.childNameHint,
          keyboardType: TextInputType.name,
          controller: _childNameController,
        ),
        SizedBox(height: AppSizes.h16),
        CustomTextForm(
          text: AppLocalizations.of(context)!.birthDateLabel,
          hintText: AppLocalizations.of(context)!.birthDateHint,
          icon: Icons.calendar_month_rounded,
          controller: _birthDateController,
        ),
      ],
    );
  }
}
 