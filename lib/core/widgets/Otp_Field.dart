import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class OtpField extends StatefulWidget {
  const OtpField({super.key, this.onCompleted});

  final int length = 5;
  final void Function()? onCompleted;

  @override
  State<OtpField> createState() => OtpFieldState();
}

class OtpFieldState extends State<OtpField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_focusNodes.isNotEmpty) {
        _focusNodes.first.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void clearFields() {
    setState(() {
      for (var c in _controllers) {
        c.clear();
      }
      if (_focusNodes.isNotEmpty) {
        _focusNodes.first.requestFocus();
      }
    });
  }

  void _onChanged(String value, int index) {
    setState(() {});
    if (value.length > 1) {
      final pasted = value;
      int pasteIndex = index;
      for (int i = 0; i < pasted.length && pasteIndex < widget.length; i++) {
        final ch = pasted[i];
        if (RegExp(r'\d').hasMatch(ch)) {
          _controllers[pasteIndex].text = ch;
          pasteIndex++;
        }
      }
      if (pasteIndex < widget.length) {
        _focusNodes[pasteIndex].requestFocus();
      } else {
        _focusNodes.last.unfocus();
      }
      _notifyIfComplete();
      return;
    }

    if (value.isNotEmpty) {
      if (index + 1 < widget.length) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    } else {
      if (index - 1 >= 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }

    _notifyIfComplete();
  }

  void _notifyIfComplete() {
    final code = _controllers.map((c) => c.text).join();
    if (code.length == widget.length &&
        !_controllers.any((c) => c.text.isEmpty)) {
      widget.onCompleted?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.length, (index) {
        final hasValue = _controllers[index].text.isNotEmpty;
        return SizedBox(
          width: 66.w,
          child: TextField(
            cursorColor: const Color.fromARGB(255, 66, 182, 197),
            cursorWidth: 1.5.w,
            textAlign: TextAlign.center,
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.text_heading_light,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(1),
            ],
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                  color: hasValue
                      ? AppColors.primary_default_light
                      : AppColors.border_card_default_light,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: AppColors.primary_default_light),
              ),
              counterText: '',
              contentPadding: EdgeInsets.symmetric(vertical: 16.h),
            ),
            onChanged: (val) => _onChanged(val, index),
          ),
        );
      }),
    );
  }
}