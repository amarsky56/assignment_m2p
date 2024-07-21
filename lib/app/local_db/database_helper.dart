import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2, // Increment the version number
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cards (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        url TEXT,
        cardAmount REAL,
        cardNumber TEXT,
        cardExpiryDate TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sender TEXT,
        image TEXT,
        amount REAL,
        date TEXT
      );
    ''');
  }

  Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        ALTER TABLE cards ADD COLUMN url TEXT;
      ''');
      await db.execute('''
        ALTER TABLE cards ADD COLUMN cardAmount REAL;
      ''');
      await db.execute('''
        ALTER TABLE cards ADD COLUMN cardNumber TEXT;
      ''');
      await db.execute('''
        ALTER TABLE cards ADD COLUMN cardExpiryDate TEXT;
      ''');
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

