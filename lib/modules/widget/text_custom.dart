// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  int? maxLines;
  TextOverflow overflow;
  bool visible;
  Function(String value)? callBack;

  TextCustom(this.text,
      {super.key,
      this.textAlign = TextAlign.left,
      this.maxLines,
      this.overflow = TextOverflow.clip,
      this.style = const TextStyle(),
      this.visible = true,
      this.callBack});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: GestureDetector(
        onTap: () {
          if (callBack != null) {
            callBack!(text);
          }
        },
        child: Text(text,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: overflow,
            style: style.copyWith()),
      ),
    );
  }
}
