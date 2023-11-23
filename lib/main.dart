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
    var retorno = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, version) => {db.execute(sql)},
    );

    print("aberto: " + retorno.isOpen.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recuperarBD();
    print("adasdasda");
  }

  @override
  Widget build(BuildContext context) {
    //chamar as funcoes
    _recuperarBD();
    print("adasdasda");
    return const Placeholder();
  }
}
