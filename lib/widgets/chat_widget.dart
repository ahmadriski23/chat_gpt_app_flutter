import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatgpt_course/services/assets_manager.dart';
import 'package:chatgpt_course/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                    chatIndex == 0
                        ? AssetsManager.userImage
                        : AssetsManager.botImage,
                    height: 30,
                    width: 30),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: chatIndex == 0
                      ? TextWidget(label: msg)
                      : DefaultTextStyle(
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          child: AnimatedTextKit(
                            isRepeatingAnimation: false,
                            repeatForever: false,
                            displayFullTextOnTap: true,
                            totalRepeatCount: 1,
                            animatedTexts: [TyperAnimatedText(msg.trim())],
                          ),
                        ),
                ),
                chatIndex == 0 ? SizedBox.shrink() : SizedBox.shrink()
                // Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //         Icon(
                //           Icons.thumb_up_alt_outlined,
                //           color: Colors.white,
                //         ),
                //         SizedBox(width: 5),
                //         Icon(
                //           Icons.thumb_down_alt_outlined,
                //           color: Colors.white,
                //         ),
                //       ])
              ],
            ),
          ),
        ),
      ],
    );
  }
}
