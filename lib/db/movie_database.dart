import 'package:flutter_starter_private/db/database_type.dart';
import 'package:flutter_starter_private/model/movie_list_response.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const popularMovieTable = 'popular_movie';

class MovieFavoriteDatabase {
  static final MovieFavoriteDatabase instance = MovieFavoriteDatabase._init();

  static Database? _database;

  MovieFavoriteDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('$popularMovieTable.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {

    await db.execute('''
      CREATE TABLE $popularMovieTable ( 
          ${MovieField.backdropPath} $dbTextType $dbTypeNonNull ,
          ${MovieField.id} $dbIntegerType $dbTypeNonNull,
          ${MovieField.originalLanguage} $dbTextType $dbTypeNonNull,
          ${MovieField.originalTitle} $dbTextType $dbTypeNonNull,
          ${MovieField.overview} $dbTextType $dbTypeNonNull ,
          ${MovieField.popularity} $dbTextType $dbTypeNonNull,
          ${MovieField.posterPath} $dbTextType $dbTypeNonNull ,
          ${MovieField.releaseDate} $dbTextType $dbTypeNonNull ,
          ${MovieField.title} $dbTextType $dbTypeNonNull ,
          ${MovieField.voteAverage} $dbIntegerType $dbTypeNonNull ,
          ${MovieField.voteCount} $dbIntegerType $dbTypeNonNull 
        )
      ''');
  }

  Future<MovieData> create(MovieData data) async {
    final db = await instance.database;
    final id = await db.insert(popularMovieTable, data.toJson());
    return data;
  }

  Future<bool> createAll(List<MovieData> data) async {
    final db = await instance.database;
    final batch = db.batch();
    for (var store in data) {
      batch.insert(popularMovieTable, store.toJson());
    }
    await batch.commit(noResult: true);
    return true;
  }

  Future<MovieData> readMovie(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      popularMovieTable,
      columns: MovieField.values,
      where: '${MovieField.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return MovieData.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<MovieData>> readAllMovie() async {
    final db = await instance.database;

    final result = await db.query(popularMovieTable);

    return result.map((json) => MovieData.fromJson(json)).toList();
  }

  Future<int> update(MovieData data) async {
    final db = await instance.database;

    return db.update(
      popularMovieTable,
      data.toJson(),
      where: '${MovieField.id} = ?',
      whereArgs: [data.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      popularMovieTable,
      where: '${MovieField.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAll() async {
    final db = await instance.database;

    return await db.delete(popularMovieTable);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
