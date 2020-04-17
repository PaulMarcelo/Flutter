import 'package:flutter/material.dart';
import 'package:flutter_app_floor/dao/person_dao.dart';
import 'package:flutter_app_floor/model/person.dart';

import 'app_database.dart';

//void main() => runApp(MyApp());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database =
      await $FloorAppDatabase.databaseBuilder('flutter_database.db').build();
  final dao = database.personDao;

  runApp(MyApp(dao));
}

class MyApp extends StatelessWidget {
  final PersonDao dao;

  const MyApp(this.dao);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(dao: this.dao, title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final PersonDao dao;

  MyHomePage({Key key, @required this.dao, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(dao);
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final PersonDao dao;

  _MyHomePageState(this.dao);

  void _incrementCounter() {
    setState(() {
      _counter++;
      insertar(this.dao, _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              child: Text("Lista"),
              onPressed: () {
                allPerson();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void insertar(PersonDao dao, int counter) async {
    final task = Person("message $counter");
    await dao.insertPerson(task);


  }

  void allPerson() async {
    List<Person> fPersonList = await dao.findAllPersons();
    for (Person item in fPersonList) {
      print("${item.name}\n");
    }
  }
}
