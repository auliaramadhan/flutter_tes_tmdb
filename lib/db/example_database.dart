import 'package:flutter_starter_private/db/database_type.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';

const table = 'table';

class ExampleDatabase {
  static final ExampleDatabase instance = ExampleDatabase._init();

  static Database? _database;

  ExampleDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('$table.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table ( 
          ${ExampleField.id} $dbPrimaryIncrementType ,
          ${ExampleField.float} $dbRealType $dbTypeNonNull,
          ${ExampleField.integer} $dbIntegerType $dbTypeNonNull,
          ${ExampleField.name} $dbTextType $dbTypeNonNull,
          ${ExampleField.date} $dbTextType $dbTypeNonNull ,
          ${ExampleField.boolean} $dbBoolType $dbTypeNonNull,
          ${ExampleField.unique} $dbTextType $dbTypeUnique 
        )
      ''');
  }

  Future<ExampleData> create(ExampleData data) async {
    final db = await instance.database;
    final id = await db.insert(table, data.toJson());
    return data;
  }

  Future<bool> createAll(List<ExampleData> data) async {
    final db = await instance.database;
    final batch = db.batch();
    for (var store in data) {
      batch.insert(table, store.toJson());
    }
    await batch.commit(noResult: true);
    return true;
  }

  Future<ExampleData> readData(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      table,
      columns: ExampleField.values,
      where: '${ExampleField.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ExampleData.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<ExampleData>> readAllData() async {
    final db = await instance.database;

    final result = await db.query(table);

    return result.map((json) => ExampleData.fromJson(json)).toList();
  }

  Future<int> update(ExampleData data) async {
    final db = await instance.database;

    return db.update(
      table,
      data.toJson(),
      where: '${ExampleField.id} = ?',
      whereArgs: [data.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      table,
      where: '${ExampleField.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAll() async {
    final db = await instance.database;

    return await db.delete(table);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}

abstract class ExampleField {
  static const values = [id, integer, float, name, date, boolean, unique];

  static const id = 'id ';
  static const integer = 'integer ';
  static const float = 'float ';
  static const name = 'name ';
  static const date = 'date ';
  static const boolean = 'boolean ';
  static const unique = 'unique ';
}

class ExampleData {
  ExampleData({
    required this.id,
    required this.float,
    required this.integer,
    required this.name,
    required this.date,
    required this.boolean,
    required this.unique,
  });

  final int id;
  final double float;
  final double integer;
  final String name;
  final DateTime date;
  final bool boolean;
  final String unique;

  factory ExampleData.fromJson(Map<String, dynamic> json) => ExampleData(
        id: json["id"],
        integer: json["integer"].toInt(),
        float: json["float"].toDouble(),
        name: json["name"],
        date: DateTime.parse(json["date"]),
        boolean: json["bool"],
        unique: json["unique"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "float": float,
        "integer": integer,
        "name": name,
        "date": date.toIso8601String(),
        "bool": boolean,
        "unique": unique,
      };
}
