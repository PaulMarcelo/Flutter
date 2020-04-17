import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Util {
  static bool showDialogOpenSetting(BuildContext context, String mensaje) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Información'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Los permisos para $mensaje fueron negados permanenteme '
                    '¿Desea habilitar desde configuración del dispositivo?'),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('SI'),
                onPressed: () {
                  openAppSettings();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  static Future<String> getOrcreateFolderInAppDocDir(String folderName) async {
//    final Directory baseDir = await getExternalStorageDirectory();//only for Android
    Directory baseDir =
        await getApplicationDocumentsDirectory(); //works for both iOS and Android
    String finalDir = join(baseDir.path, folderName);
    final Directory dir = Directory(finalDir);
    if (await dir.exists()) {
      //if folder already exists return path
      return dir.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder = await dir.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }


//  static Future<void> createFile(File folderName) async {
////    final Directory baseDir = await getExternalStorageDirectory();//only for Android
//    Directory baseDir =
//    await getApplicationDocumentsDirectory(); //works for both iOS and Android
//    String finalDir = join(baseDir.path, folderName);
//    final Directory dir = Directory(finalDir);
//    if (await dir.exists()) {
//      //if folder already exists return path
//      return dir.path;
//    } else {
//      //if folder not exists create folder and then return its path
//      final Directory _appDocDirNewFolder = await dir.create(recursive: true);
//      return _appDocDirNewFolder.path;
//    }
//  }
}
