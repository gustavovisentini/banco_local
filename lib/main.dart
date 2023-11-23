import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //
  _recuperarBD() async {
    print("object");
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");

    String sql =
        'CREATE TABLE usuarios(id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)';
    var db = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, version) => {db.execute(sql)},
    );

    //print("aberto: " + retorno.isOpen.toString());
    return db;
  }

  _salvar() async {
    //abrir o db
    Database db = await _recuperarBD();
    int id = await db
        .insert("usuarios", {"nome": "Serjão dos Foguete", "idade": 540});
    print("Id Inserido: $id");
  }

  _recuperarDados() async {
    Database db = await _recuperarBD();
    List usuarios = await db.rawQuery('SELECT * FROM usuarios');
    for (var usuario in usuarios) {
      print(" id: " +
          usuario["id"].toString() +
          " nome: " +
          usuario["nome"].toString() +
          " idade: " +
          usuario["idade"].toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    //chamar as funcoes
    //_recuperarBD();
    //_salvar();
    _recuperarDados();
    return const Placeholder();
  }
}
