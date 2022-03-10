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
  CarroProvider() : super(table);
}
