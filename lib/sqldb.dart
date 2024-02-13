import 'dart:ui';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'spendwise.db');
    Database mydb = await openDatabase(path, onCreate: _oncreate ,version:3 ,onUpgrade: _onupgrade);
    return mydb;
  }
_onupgrade(Database db ,int oldversion ,newversion)async{
//   await db.execute('''
// ALTER TABLE debtTb DROP COLUMN totaldebt

// ''');

//   await db.execute('''
// ALTER TABLE creditTb DROP COLUMN totalcredit

// ''');


}
//create all table............
  _oncreate(Database db, int version) async {

//create table login...................

    await db.execute('''
CREATE TABLE "loginTb"(
  "username" TEXT NOT NULL ,
  "password" INTEGER NOT NULL
)

''');
//create table debt...................
    await db.execute('''
CREATE TABLE "debtTb"(
  "descrption" TEXT NOT NULL ,
  "amount" INTEGER NOT NULL,
    "totalcredit" INTEGER NULL


)

''');
//create table credit...................

    await db.execute('''
CREATE TABLE "creditTb"(
  "descrption" TEXT NOT NULL ,
  "amount" INTEGER NOT NULL,
  "totalcredit" INTEGER NULL
)

''');

//create table wallet...................

    await db.execute('''
CREATE TABLE "walletTb"(
  "totalwallet" INTEGER NOT NULL

)

''');


    print("create database and table .................");
  }

 Future<List<Map<String, dynamic>>> selectData(String query) async {
  Database? mydb=await db;
  List<Map<String, dynamic>> result = await mydb!.rawQuery(query);
  return result;
}
    selectAccount(String sql)async{
Database? mydb=await db;
List response =await mydb!.rawQuery(sql);
return response;

  }


    insertData(String sql)async{
Database? mydb=await db;
int response =await mydb!.rawInsert(sql);
return response;

  }


    updateData(String sql)async{
Database? mydb=await db;
int response =await mydb!.rawUpdate(sql);
return response;

  }

    deleteData(String sql)async{
Database? mydb=await db;
int response =await mydb!.rawDelete(sql);
return response;

  }

 
  
mydeleteDatabase()async
{

  String databasepath = await getDatabasesPath();
    String path = join( databasepath , 'spendwise.db');
    await  deleteDatabase(path);

print("delete database done");
 }
}