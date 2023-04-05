// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  int? maxLines;
  TextOverflow overflow;
  bool visible;
  Function(String value)? callBack;
  IconData? icon;

  TextCustom(this.text,
      {super.key,
      this.textAlign = TextAlign.left,
      this.maxLines,
      this.overflow = TextOverflow.clip,
      this.style = const TextStyle(),
      this.visible = true,
      this.callBack,this.icon});

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
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text,
                      textAlign: textAlign,
                      maxLines: maxLines,
                      overflow: overflow,
                      style: style.copyWith()),
                  if (icon != null)
                    SizedBox(
                      width: Utils.width(5),
                    ),
                  if (icon != null) Icon(icon)
                ],
              )
            : Text(
                text,
                textAlign: textAlign,
                maxLines: maxLines,
                overflow: overflow,
                style: style.copyWith(),
              ),
      ),
    );
  }
}
