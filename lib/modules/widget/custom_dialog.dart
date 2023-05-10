import 'package:final_project_hcmute/modules/widget/text_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/utils/utils.dart';
import '../view/constant/app_colors.dart';
import 'loading_widget.dart';

showLoadingDialog(BuildContext context,{int timeout=10}) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 60), () {
        try {
          Navigator.of(context).pop(true);
        } catch (e) {
          print(e.toString());
        }
      });
      return WillPopScope(onWillPop: () async => false, child: LoadingWidget());
    });


showMessageDialogIOS(BuildContext context,
    { String title ='Thông báo',
      String description = '',
      Function()? onPress,
      Function? onPressX,
      Widget? childContent,
      bool enableButton = true,
      bool enableCancel = false,
      String buttonText = "OK"}) =>
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return Theme(
            data: ThemeData(
              cupertinoOverrideTheme: const CupertinoThemeData(brightness: Brightness.light),
            ),
            child: WillPopScope(
                child: CupertinoAlertDialog(
                  title: enableButton
                      ? TextCustom(title,
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontSize: Utils.width(15)))
                      : const CupertinoActivityIndicator(),
                  content: childContent ?? (description.isEmpty
                      ? Container()
                      : Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: TextCustom(
                      description,
                      style: TextStyle(fontSize: Utils.width(17)),
                      textAlign: TextAlign.center,
                    ),
                  )),
                  actions: <Widget>[
                    if (enableButton)
                      CupertinoDialogAction(
                        onPressed: onPress,
                        child: Text(buttonText),
                      ),
                    if (enableCancel)
                      CupertinoDialogAction(
                        child: const Text("Hủy", style: TextStyle(color: Colors.red),),
                        onPressed: () => Navigator.pop(context),
                      ),
                  ],
                ),
                onWillPop: () async => false),
          );
        });


Widget actionChooseImageSheet({Function? chooseImageGallery}) {
  return CupertinoActionSheet(
    title: TextCustom(
      "Chọn hình ảnh",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: Utils.width(19), color: colorBorderVNPay),
    ),
    message: TextCustom(
      "Chọn hành động bất kỳ",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: Utils.width(15), color: colorBorderVNPay),
    ),
    actions: <Widget>[
      CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: () {
          Get.back();
        },
        child: TextCustom("Máy ảnh",
            style: TextStyle(
                fontSize: Utils.width(17),
                color: colorBorderVNPay)),
      ),
      CupertinoActionSheetAction(
        isDestructiveAction: true,
        onPressed: () {
          chooseImageGallery!();
        },
        child: TextCustom("Thư viện",
            style: TextStyle(
                fontSize: Utils.width(17),
                color: appBarColor)),
      )
    ],
    cancelButton: CupertinoActionSheetAction(
      child: TextCustom("Huỷ",
          style: TextStyle(
              fontSize: Utils.width(17),
              color: colorBorderVNPay)),
      onPressed: () {
        Get.back();
      },
    ),
  );
}