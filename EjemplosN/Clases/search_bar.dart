import 'package:flutter/material.dart';
import 'package:flutter_app_pos/constant/constants_color.dart';
import 'package:flutter_app_pos/constant/constants_string.dart';
import 'package:flutter_app_pos/util/size_config.dart';


// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  String _textToSearch;
  final Function onClickAction;

  SearchBar({@required this.onClickAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 1.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 25.0,
            width: SizeConfig.safeBlockHorizontal * 84,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            color: Color(ConstantsColor.colorBlue),
            child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ConstantsString.label_busqueda,
                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.white),
                ),
                onChanged: (texto) {
                  this._textToSearch = texto;
                }),
          ),
          Container(
            height: 25.0,
            color: Color(ConstantsColor.colorGray),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.search),
              onPressed: () {
                onClickAction(this._textToSearch);
              },
            ),
          )
        ],
      ),
    );
  }
}
