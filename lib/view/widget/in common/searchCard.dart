import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../core/constant/color.dart';

class SearchCard extends StatelessWidget {
  const SearchCard(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.speechEnabled,
      required this.speechToText,
      required this.onPressedSuffixIcon,
      required this.onTapSearch,
      required this.onChanged,
      required this.focusNode});
  final TextEditingController controller;
  final String hintText;
  final bool speechEnabled;
  final SpeechToText speechToText;
  final void Function() onPressedSuffixIcon;
  final void Function() onTapSearch;
  final void Function(String) onChanged;
  final focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
      child: Card(
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.sp),
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: InkWell(
                borderRadius: BorderRadius.circular(360),
                onTap: onTapSearch,
                child: Icon(
                  Icons.search,
                  color: AppColor.secondryColor,
                  size: 15.sp,
                ),
              ),
              suffixIcon: IconButton(
                  onPressed: onPressedSuffixIcon,
                  icon: Icon(
                    Icons.mic,
                    size: 15.sp,
                    color: speechEnabled
                        ? speechToText.isListening
                            ? Colors.red
                            : AppColor.secondryColor
                        : Colors.grey,
                  )),
              hintText: hintText,
            ),
            cursorColor: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
