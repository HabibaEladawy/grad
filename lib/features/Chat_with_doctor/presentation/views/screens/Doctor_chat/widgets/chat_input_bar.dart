import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

// class ChatInputBar extends StatelessWidget {
//   const ChatInputBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//       decoration: const BoxDecoration(
//         color: AppColors.bg_card_default_light,
//         border: Border(top: BorderSide(color:AppColors.bg_card_default_light)),
//
//       ),
//       child: SafeArea(
//         top: false,
//         child: Row(
//           children: [
//
//             IconButton(
//               icon: const Icon(Icons.add, color: AppColors.icon_onLight_light, size: 24),
//               onPressed: () {},
//               padding: EdgeInsets.zero,
//               // constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//             ),
//             const SizedBox(width: 9),
//
//             Expanded(
//               child: Directionality(
//                 textDirection: TextDirection.rtl,
//                 child: SizedBox(
//                   width: 392,
//                   height: 36,
//                   child: TextField(
//                     textDirection: TextDirection.rtl,
//                     decoration: InputDecoration(
//                       hintText: 'اكتب رسالة للدكتور',
//                       hintStyle: AppTextStyle.regular12TextBody,
//                       filled: true,
//                       fillColor: AppColors.bg_surface_default_light,
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 10,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(24),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 9),
//
//             IconButton(
//               icon: const Icon(Icons.mic_none_rounded,
//                   color: AppColors.icon_onLight_light, size: 18),
//               onPressed: () {},
//               padding: EdgeInsets.zero,
//               // constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//             ),
//
//             IconButton(
//               icon: const Icon(Icons.camera_alt_outlined,
//                   color: AppColors.icon_onLight_light, size: 24),
//               onPressed: () {},
//               padding: EdgeInsets.zero,
//               constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

// class ChatInputBar extends StatelessWidget {
//   final TextEditingController? controller;
//   final VoidCallback? onSend;
//   final VoidCallback? onAdd;
//   final VoidCallback? onMic;
//   final VoidCallback? onCamera;
//
//   const ChatInputBar({
//     super.key,
//     this.controller,
//     this.onSend,
//     this.onAdd,
//     this.onMic,
//     this.onCamera,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//       decoration: const BoxDecoration(
//         color: AppColors.bg_card_default_light,
//         border: Border(
//           top: BorderSide(color: AppColors.bg_card_default_light),
//         ),
//       ),
//       child: SafeArea(
//         top: false,
//         child: Row(
//           children: [
//             // ➕ زر Add على الشمال
//             IconButton(
//               icon: const Icon(
//                 Icons.add,
//                 color: AppColors.icon_onLight_light,
//                 size: 24,
//               ),
//               onPressed: onAdd ?? () {},
//               padding: EdgeInsets.zero,
//             ),
//
//             const SizedBox(width: 9),
//
//             // 📝 TextField
//             Expanded(
//               child: Directionality(
//                 textDirection: TextDirection.rtl,
//                 child: SizedBox(
//                   height: 36,
//                   child: TextField(
//                     controller: controller,
//                     textDirection: TextDirection.rtl,
//                     decoration: InputDecoration(
//                       hintText: 'اكتب رسالة للدكتور',
//                       hintStyle: AppTextStyle.regular12TextBody,
//                       filled: true,
//                       fillColor: AppColors.bg_surface_default_light,
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 10,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(24),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     onSubmitted: onSend != null ? (_) => onSend!() : null,
//                   ),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 9),
//
//             // 🎤 زر Mic
//             IconButton(
//               icon: const Icon(
//                 Icons.mic_none_rounded,
//                 color: AppColors.icon_onLight_light,
//                 size: 18,
//               ),
//               onPressed: onMic ?? () {},
//               padding: EdgeInsets.zero,
//             ),
//
//             // 📷 زر Camera
//             IconButton(
//               icon: const Icon(
//                 Icons.camera_alt_outlined,
//                 color: AppColors.icon_onLight_light,
//                 size: 24,
//               ),
//               onPressed: onCamera ?? () {},
//               padding: EdgeInsets.zero,
//               constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//             ),
//
//             // ✅ زر Send — بيظهر بس لو في controller أو onSend
//             if (controller != null || onSend != null)
//               Padding(
//                 padding: const EdgeInsets.only(right: 6),
//                 child: GestureDetector(
//                   onTap: onSend,
//                   child: Container(
//                     width: 36,
//                     height: 36,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Color(0xFF4A90D9),
//                     ),
//                     child: const Icon(
//                       Icons.send_rounded,
//                       color: Colors.white,
//                       size: 18,
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class ChatInputBar extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final VoidCallback? onSend;
  final VoidCallback? onAdd;
  final VoidCallback? onMic;
  final VoidCallback? onCamera;

  const ChatInputBar({
    super.key,
    this.controller,
    this.focusNode,
    this.onSend,
    this.onAdd,
    this.onMic,
    this.onCamera,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.bg_card_default_light,
        border: Border(
          top: BorderSide(color: AppColors.bg_card_default_light),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // ➕ Add
            IconButton(
              icon: const Icon(Icons.add,
                  color: AppColors.icon_onLight_light, size: 24),
              onPressed: onAdd ?? () {},
              padding: EdgeInsets.zero,
            ),

            const SizedBox(width: 9),

            // 📝 TextField
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: 36,
                  child: TextField(
                    controller: controller,
                    focusNode: focusNode, // ✅
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'اكتب رسالة للدكتور',
                      hintStyle: AppTextStyle.regular12TextBody,
                      filled: true,
                      fillColor: AppColors.bg_surface_default_light,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: onSend != null ? (_) => onSend!() : null,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 9),

            // 🎤 Mic
            IconButton(
              icon: const Icon(Icons.mic_none_rounded,
                  color: AppColors.icon_onLight_light, size: 18),
              onPressed: onMic ?? () {},
              padding: EdgeInsets.zero,
            ),

            // 📷 Camera
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined,
                  color: AppColors.icon_onLight_light, size: 24),
              onPressed: onCamera ?? () {},
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            ),

            // ✅ Send — بيظهر بس لو في controller أو onSend
            if (controller != null || onSend != null)
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: GestureDetector(
                  onTap: onSend,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      ///
                      color: AppColors.whiteColor,
                    ),
                    child: const Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}