import 'dart:async';
import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';

class TimerWidget extends StatefulWidget {
  final VoidCallback? onTimerFinished;

  const TimerWidget({super.key, this.onTimerFinished});

  @override
  TimerWidgetState createState() => TimerWidgetState();
}

class TimerWidgetState extends State<TimerWidget> {
  int _seconds = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _seconds = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        timer.cancel();
        widget.onTimerFinished?.call();
      }
    });
  }

  void restartTimer() {
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _seconds > 9 ? '00:$_seconds' : '00:0$_seconds',
      style: AppTextStyle.regular12TextBody(context),
    );
  }
}