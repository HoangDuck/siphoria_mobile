import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';
class TextFieldCustom extends StatefulWidget {
  final TextEditingController controller;
  Function(String text)? callBack;
  String? hintText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  TextStyle? hintTextStyle;
  bool isSecureText;

  TextFieldCustom(
      {Key? key,
      required this.controller,
      this.callBack,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.hintTextStyle,
      this.isSecureText = false})
      : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      textAlignVertical: TextAlignVertical.center,
      onChanged: (text){
        if(widget.callBack != null){
          widget.callBack!(text);
        }
      },
      onEditingComplete: () {
        Utils.closeKeyboard(context);
      },
      onSubmitted: (text){
        if(widget.callBack != null){
          widget.callBack!(text);
        }

      },
      obscureText: widget.isSecureText,
      decoration: InputDecoration(
        hintText: widget.hintText??'Nhập vào',
        hintStyle: widget.hintTextStyle,
        border: InputBorder.none,
        suffixIcon: widget.suffixIcon,
        contentPadding: EdgeInsets.all(Utils.width(10)),
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}
