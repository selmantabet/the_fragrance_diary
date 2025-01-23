import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:the_fragrance_diary/models/fragrance.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  final String _tableName = 'fragrances';
  final String _columnId = 'id';
  final String _columnName = 'name';
  final String _columnDescription = 'description';
  final String _columnImagePath = 'image_path';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'fragrance_diary.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $_columnName TEXT NOT NULL,
        $_columnDescription TEXT NOT NULL,
        $_columnImagePath TEXT NOT NULL
      )
    ''');
  }

  Future<Fragrance> queryFragranceById(int id) async {
    final Database db = await _instance.database;
    final List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
    if (results.isEmpty) {
      throw Exception('Fragrance not found');
    }
    return Fragrance(
      id: results[0][_columnId] as int,
      name: results[0][_columnName] as String,
      description: results[0][_columnDescription] as String,
      imagePath: results[0][_columnImagePath] as String,
    );
  }

  Future<int> insertFragrance(Map<String, String> newFragrance) async {
    final Database db = await _instance.database;
    return await db.insert(
        _tableName,
        {
          _columnName: newFragrance['name']!,
          _columnDescription: newFragrance['description']!,
          _columnImagePath: newFragrance['imagePath']!,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Fragrance>> queryAllRows() async {
    final Database db = await _instance.database;
    final List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((row) {
      return Fragrance(
        id: row[_columnId] as int,
        name: row[_columnName] as String,
        description: row[_columnDescription] as String,
        imagePath: row[_columnImagePath] as String,
      );
    }).toList();
  }

  void updateFragrance(Fragrance fragrance) async {
    final Database db = await _instance.database;
    await db.update(
      _tableName,
      {
        _columnId: fragrance.id,
        _columnName: fragrance.name,
        _columnDescription: fragrance.description,
        _columnImagePath: fragrance.imagePath,
      },
      where: '$_columnId = ?',
      whereArgs: [fragrance.id],
    );
  }

  void deleteFragrance(int id) async {
    final Database db = await _instance.database;
    await db.delete(
      _tableName,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
  }
}
