import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MydbSqlFlite {
  intialDb() async {
    //first put your db in path
    String dataBaseBath =
        await getDatabasesPath(); //the default datbase location
    //database Name
    String path = join(dataBaseBath, 'dataBaseName.db');
    //or
    String path2 = dataBaseBath + "/" + "dataBaseName.db";
    // create dataBase
    Database myDb = await openDatabase(path, onCreate: _onCreate);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    //make tables
    await db.execute('''
    CREATE TABLE "NOTE"(
   ID INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY ,
   NOTES TEXT NOT NULL
    )
    ''');
  }
}
