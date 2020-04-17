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

  PersonDao _personDaoInstance;

  UserDao _userDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `person` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `edad` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  PersonDao get personDao {
    return _personDaoInstance ??= _$PersonDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$PersonDao extends PersonDao {
  _$PersonDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _personInsertionAdapter = InsertionAdapter(
            database,
            'person',
            (Person item) =>
                <String, dynamic>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _personMapper =
      (Map<String, dynamic> row) => Person(row['name'] as String);

  final InsertionAdapter<Person> _personInsertionAdapter;

  @override
  Future<List<Person>> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM Person',
        mapper: _personMapper);
  }

  @override
  Future<Person> findPersonById(int id) async {
    return _queryAdapter.query('SELECT * FROM Person WHERE id = ?',
        arguments: <dynamic>[id], mapper: _personMapper);
  }

  @override
  Future<void> insertPerson(Person person) async {
    await _personInsertionAdapter.insert(
        person, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> replaceUsers(List<Person> users) async {
    if (database is sqflite.Transaction) {
      await super.replaceUsers(users);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.personDao.replaceUsers(users);
      });
    }
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'user',
            (User item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'edad': item.edad
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _userMapper = (Map<String, dynamic> row) =>
      User(row['name'] as String, row['edad'] as int);

  final InsertionAdapter<User> _userInsertionAdapter;

  @override
  Future<List<User>> findAllUser() async {
    return _queryAdapter.queryList('SELECT * FROM user', mapper: _userMapper);
  }

  @override
  Future<User> findUserById(int id) async {
    return _queryAdapter.query('SELECT * FROM user WHERE id = ?',
        arguments: <dynamic>[id], mapper: _userMapper);
  }

  @override
  Future<void> insertUser(User person) async {
    await _userInsertionAdapter.insert(person, sqflite.ConflictAlgorithm.abort);
  }
}
