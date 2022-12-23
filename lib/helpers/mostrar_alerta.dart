import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

MostrarAlerta(BuildContext context, String title, String subtitle) {
  if (Platform.isIOS) {
    return showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(subtitle),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text('Ok'),
                  isDefaultAction: true,
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ));
  }

  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(subtitle),
          actions: <Widget>[
            MaterialButton(
              child: Text('Ok'),
              elevation: 5,
              textColor: Colors.blue,
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      });
}
