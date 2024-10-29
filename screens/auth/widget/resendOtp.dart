import 'dart:async';

import 'package:doctor/core/style/appColors.dart';
import 'package:flutter/material.dart';

class ResendOtpView extends StatefulWidget {
  const ResendOtpView({required this.onOtpSend});

  final VoidCallback onOtpSend;

  @override
  State<ResendOtpView> createState() => _ResendOtpViewState();
}

class _ResendOtpViewState extends State<ResendOtpView> {
  Timer? _timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft < 1) {
        _timer?.cancel();
        return;
      }

      timeLeft -= 1;

      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  int timeLeft = 30;
  int totalTime = 30;

  @override
  Widget build(BuildContext context) {
    final isTimerCompleted = timeLeft == 0;

    return Center(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              if (!isTimerCompleted) return;

              _reset();
            },
            style: TextButton.styleFrom(
              foregroundColor: isTimerCompleted
                  ? AppColors.primaryColor
                  : Colors.grey.shade700,
            ),
            child: isTimerCompleted
                ? const Text("Resend Otp")
                : Text("Resend Otp in $timeLeft s"),
          ),
        ],
      ),
    );
  }

  void _reset() {
    timeLeft = totalTime;
    setState(() {});
    _startTimer();
    widget.onOtpSend();
  }
}
