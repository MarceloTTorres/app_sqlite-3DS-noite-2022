import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final _databaseName = "Carros.db";
  static final _databaseVersion = 1;
  final sql;

  DatabaseProvider({required this.sql});

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }
  //inicializa o BD
  _initDatabase() async {
    Directory documentsDirectory = 
    await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path,
                       _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }
  //cria as tabelas
  Future _onCreate(Database db, int version) async {
    await db.execute(sql);
  }
}
