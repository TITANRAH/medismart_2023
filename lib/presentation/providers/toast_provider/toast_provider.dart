import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toast_provider.g.dart';

@riverpod
class ToastCustom extends _$ToastCustom {
  final customToast = FToast();
  @override
  Fluttertoast build() {
    return Fluttertoast();
  }

  showToastMessage(String message, Color backgroundColor, BuildContext context, IconData icon, Color iconColor, ToastGravity position) {
    customToast.init(context);

    return customToast.showToast(
      child: Container(
        width: 350,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 40,
            ),
            Text(
              message,
              style:  TextStyle(color: iconColor, fontSize: 15),
            ),
          ],
        ),
      ),
      gravity: position,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
