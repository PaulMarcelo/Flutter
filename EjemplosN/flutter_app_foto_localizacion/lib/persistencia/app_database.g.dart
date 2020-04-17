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

  ProductoDao _productoDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `producto` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `titulo` TEXT NOT NULL, `lat` TEXT NOT NULL, `log` TEXT NOT NULL, `pathFoto` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  ProductoDao get productoDao {
    return _productoDaoInstance ??= _$ProductoDao(database, changeListener);
  }
}

class _$ProductoDao extends ProductoDao {
  _$ProductoDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _productoInsertionAdapter = InsertionAdapter(
            database,
            'producto',
            (Producto item) => <String, dynamic>{
                  'id': item.id,
                  'titulo': item.titulo,
                  'lat': item.lat,
                  'log': item.log,
                  'pathFoto': item.pathFoto
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _productoMapper = (Map<String, dynamic> row) => Producto(
      row['id'] as int,
      row['titulo'] as String,
      row['lat'] as String,
      row['log'] as String,
      row['pathFoto'] as String);

  final InsertionAdapter<Producto> _productoInsertionAdapter;

  @override
  Future<List<Producto>> findAllProducto() async {
    return _queryAdapter.queryList('SELECT * FROM producto',
        mapper: _productoMapper);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM producto');
  }

  @override
  Future<void> insertProducto(Producto producto) async {
    await _productoInsertionAdapter.insert(
        producto, sqflite.ConflictAlgorithm.replace);
  }
}
