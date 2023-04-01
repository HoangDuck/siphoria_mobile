import 'package:final_project_hcmute/core/utils/utils.dart';
import 'package:flutter/material.dart';
class ButtonCustom extends StatelessWidget {
  Color? color;
  Color? borderColor;
  String text;
  Function(String value) onPress;
  double borderRadius;
  TextStyle? style;
  dynamic dataTranfer;

  ButtonCustom(
      {Key? key,
      this.color,
      required this.text,
      required this.onPress,
      this.style,
      this.borderColor,
      this.borderRadius = 10.0,
      this.dataTranfer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPress(dataTranfer.toString());
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor??Colors.grey),
          borderRadius:
              BorderRadius.circular(Utils.width(borderRadius)),
          color: color??Colors.blue,
        ),
        child: Center(
          child: Text(
            text,
            style: style,
          ),
        ),
      ),
    );
  }
}
