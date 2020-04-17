import 'package:flutter/material.dart';
import 'package:flutter_app_chopper/ui/cliente_page.dart';
import 'package:flutter_app_chopper/data/persistence/app_base.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'data/api/service/cliente_service.dart';
import 'data/persistence/app_database.dart';

Future<void> main() async {
  Stetho.initialize();
  _setupLogging();
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder(AppBase.nameDB).build();
  AppBase.dataBase = database;
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: initWsServices(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ClientePage(),
        ));
  }

  List<SingleChildCloneableWidget> initWsServices() {
    return [
      Provider(
        dispose: (_, ClienteService service) => service.client.dispose(),
        create: (_) => ClienteService.create(),
      ),
    ];
  }
}
