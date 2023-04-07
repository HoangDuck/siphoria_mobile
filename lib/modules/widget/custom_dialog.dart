import 'package:final_project_hcmute/modules/widget/text_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';

showMessageDialogIOS(BuildContext context,
    { String title ='',
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
                      TextStyle(fontSize: Utils.width(34)))
                      : const CupertinoActivityIndicator(),
                  content: childContent ?? (description.isEmpty
                      ? Container()
                      : Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: TextCustom(
                      description,
                      style: TextStyle(fontSize: Utils.width(32)),
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