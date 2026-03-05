import 'package:flutter/material.dart';

class DoctorChatHeader extends StatelessWidget {
  const DoctorChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        bottom: 12,
        left: 16,
        right: 16,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          _DoctorAvatar(),
          const SizedBox(width: 12),
          const _DoctorInfo(),
          const SizedBox(width: 12),
          _BackButton(context),
        ],
      ),
    );
  }

  Widget _DoctorAvatar() {
    return Container(
      width: 46,
      height: 46,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFF4A90D9), Color(0xFF2C6FAD)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Text('👨‍⚕️', style: TextStyle(fontSize: 22)),
      ),
    );
  }

  Widget _BackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.maybePop(context),
      child: const Icon(
        Icons.chevron_right,
        color: Color(0xFF4A90D9),
        size: 28,
      ),
    );
  }
}

class _DoctorInfo extends StatelessWidget {
  const _DoctorInfo();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'د.إسلام غنيم',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A2E),
            ),
          ),
          SizedBox(height: 2),
          Text(
            'أخصائي علاج طبيعي',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF999999),
            ),
          ),
        ],
      ),
    );
  }
}