import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Util {
  static ProgressDialog showDialogDownload(
      BuildContext context, String mensaje, double percentage) {
    ProgressDialog dialog =
        ProgressDialog(context, type: ProgressDialogType.Download);
    dialog.style(message: mensaje);
    dialog.show();
    dialog.update(progress: percentage, maxProgress: 100.0);
    return dialog;
  }

  static void hideDialogAndShowToast(
      ProgressDialog dialog, String mensaje, double percentage) {
    Future.delayed(Duration(seconds: 1)).then((value) {
      dialog.hide().whenComplete(() {
        Fluttertoast.showToast(msg: mensaje);
      });
      percentage = 0.0;
    });
  }

  static void updatePercentageDialog(
      ProgressDialog dialog, double percentage, aumentar) {
    percentage = percentage + aumentar;
    dialog.update(progress: percentage);
  }

  static ProgressDialog showDialogWait(BuildContext context, String mensaje) {
    ProgressDialog dialog =
        ProgressDialog(context, type: ProgressDialogType.Normal);
    dialog.style(message: mensaje);
    dialog.show();
    return dialog;
  }
}
