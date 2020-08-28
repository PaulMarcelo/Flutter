import 'package:flutter/services.dart';

class NativeText {
  final _platform = MethodChannel('ec.paul/native_text');

  Future<String> getText(String text) async {
    String result =
        await _platform.invokeMethod('get', {"text": text, "age": 32});
    return result;
  }

  Future<String> addText(String text) async {
    String result = await _platform.invokeMethod('add');
    return result;
  }
}
