import 'package:dana_graduation_project/core/widgets/custom_textForm.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

import '../../../../../../../login/presentation/cubit/sign_up_cubit.dart';

class PersonalInformationFormFields extends StatefulWidget {
  const PersonalInformationFormFields({super.key});

  @override
  State<PersonalInformationFormFields> createState() =>
      _PersonalInformationFormFieldsState();
}

class _PersonalInformationFormFieldsState
    extends State<PersonalInformationFormFields> {
  final _nameController = TextEditingController();
  final _governmentController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(
            () => context.read<SignUpCubit>().updateParentName(_nameController.text));
    _governmentController.addListener(
            () => context.read<SignUpCubit>().updateGovernment(_governmentController.text));
    _addressController.addListener(
            () => context.read<SignUpCubit>().updateAddress(_addressController.text));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _governmentController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextForm(
          text: AppLocalizations.of(context)!.fullNameLabel,
          hintText: AppLocalizations.of(context)!.fullNameHint,
          keyboardType: TextInputType.name,
          controller: _nameController,
        ),
        SizedBox(height: AppSizes.h8),
        CustomTextForm(
          text: AppLocalizations.of(context)!.governorateLabel,
          hintText: AppLocalizations.of(context)!.governorateHint,
          icon: Icons.keyboard_arrow_down,
          controller: _governmentController,
          readOnly: true,
          onTap: () {
            // TODO: Open governorate dropdown
          },
        ),
        SizedBox(height: AppSizes.h8),
        CustomTextForm(
          text: AppLocalizations.of(context)!.addressLabel,
          hintText: AppLocalizations.of(context)!.addressHint,
          keyboardType: TextInputType.streetAddress,
          controller: _addressController,
        ),
      ],
    );
  }
}