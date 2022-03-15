import 'package:app_sqlite/provider/DatabaseProvider.dart';
import 'package:sqflite/sqflite.dart';

class CarroProvider extends DatabaseProvider {
  static final table = "carro";
  static final columnId = "id";
  static final columnMarca = "marca";
  static final columnModelo = "modelo";
  static final columnAno = "ano";
  static final columnPlaca = "placa";
  static final columnCor = "cor";

  //metodo construtor
  CarroProvider()
      : super(
            sql: "CREATE TABLE $table ("
                "$columnId INTEGER PRIMARY KEY,"
                "$columnMarca TEXT,"
                "$columnModelo TEXT,"
                "$columnAno TEXT,"
                "$columnPlaca TEXT,"
                "$columnCor TEXT"
                ")");
  //CRUD
  Future<int> insert(Map<String, dynamic> carro) async {
    Database? db = await super.database;
    return await db!.insert(table, carro);
  }

  Future<List<Map<String, dynamic>>> selectAll() async {
    Database? db = await super.database;
    return await db!.query(table);
  }

  Future<int> update(Map<String, dynamic> carro) async {
    Database? db = await super.database;
    return await db!.update(table, carro,
        where: "$columnId = ?", whereArgs: [carro[columnId]]);
  }

  Future<int> delete(int id) async {
    Database? db = await super.database;
    return await db!.delete(table, where: "$columnId = ?", 
                            whereArgs: [id]);
  }

  //comandos personalizados no BD
  Future<List<Map<String, dynamic>>> selectByMarca(String marca) async {
    Database? db = await super.database;
    return await db!.query(table, where: "$columnMarca = ?", 
                           whereArgs: [marca]);
  }
  //count all
  Future<int?> count() async {
    Database? db = await super.database;
    return Sqflite.firstIntValue(
        await db!.rawQuery("SELECT COUNT($columnId) FROM $table"));
  }
}
