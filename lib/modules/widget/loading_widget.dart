import 'package:final_project_hcmute/modules/widget/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../core/utils/utils.dart';
class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //color: Colors.black.withOpacity(0.7),
        child: Theme(
            data: ThemeData(
                cupertinoOverrideTheme:
                CupertinoThemeData(brightness: Brightness.dark)),
            child: WillPopScope(
                child: CupertinoAlertDialog(
                  title: CupertinoActivityIndicator(),
                  content: Container(
                    margin: EdgeInsets.only(top: Utils.width(10)),
                    child: TextCustom(
                      "Đang tải dữ liệu",
                      style: TextStyle(
                          fontSize: Utils.width(20)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onWillPop: () async => false)));
  }
}
