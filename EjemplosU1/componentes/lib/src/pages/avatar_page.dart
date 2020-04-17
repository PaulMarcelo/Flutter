import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  static final pageName = 'avatar';∫
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AvatarPage"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(6.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8F_pGhz0au9OtR8lDwipo8MMLxGaOUbV5kWdPu5PZpK9KnHmstg'),
              radius: 22.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
          child: FadeInImage(
        image: NetworkImage(
            'https://www-cinemascomics-com.exactdn.com/wp-content/uploads/2019/08/stan-lee-spider-man.jpg?strip=all&lossy=1&resize=640%2C375&ssl=1'),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
      )),
    );
  }
}
