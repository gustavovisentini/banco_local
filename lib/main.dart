import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MaterialApp());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //
  _recuperarBD() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");

    String sql =
        'CREATE TABLE usuarios(id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)';
    var retorno = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, version) => {db.execute(sql)},
    );

    print("aberto: " + retorno.isOpen.toString());
  }

  @override
  Widget build(BuildContext context) {
    //chamar as funcoes
    return const Placeholder();
  }
}
