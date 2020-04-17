// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? join(await sqflite.getDatabasesPath(), name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ClienteDao _clienteDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cliente` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `codcli` TEXT NOT NULL, `nombrecli` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  ClienteDao get clienteDao {
    return _clienteDaoInstance ??= _$ClienteDao(database, changeListener);
  }
}

class _$ClienteDao extends ClienteDao {
  _$ClienteDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _clienteInsertionAdapter = InsertionAdapter(
            database,
            'cliente',
            (Cliente item) => <String, dynamic>{
                  'id': item.id,
                  'codcli': item.codcli,
                  'nombrecli': item.nombrecli
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _clienteMapper = (Map<String, dynamic> row) =>
      Cliente(row['codcli'] as String, row['nombrecli'] as String);

  final InsertionAdapter<Cliente> _clienteInsertionAdapter;

  @override
  Future<List<Cliente>> findAllCliente() async {
    return _queryAdapter.queryList('SELECT * FROM cliente',
        mapper: _clienteMapper);
  }

  @override
  Future<Cliente> findClienteById(int id) async {
    return _queryAdapter.query('SELECT * FROM cliente WHERE id = ?',
        arguments: <dynamic>[id], mapper: _clienteMapper);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM cliente');
  }

  @override
  Future<void> insertCliente(Cliente cliente) async {
    await _clienteInsertionAdapter.insert(
        cliente, sqflite.ConflictAlgorithm.replace);
  }

  @override
  Future<void> insertClienteAll(List<Cliente> cliente) async {
    await _clienteInsertionAdapter.insertList(
        cliente, sqflite.ConflictAlgorithm.replace);
  }
}
