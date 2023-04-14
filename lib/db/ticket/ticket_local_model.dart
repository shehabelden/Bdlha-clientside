import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../../models/ticket/ticket_model.dart';
class TicketDb{
   static late final dynamic database;
   static List getData=[];
  static init() async{
      database = openDatabase(
        join(await getDatabasesPath(), 'Ticket_database.db'),
    // When the database is first created, create a table to store dogs.
        onCreate: (db, version) {
    // Run the CREATE TABLE statement on the database.
    return  db.execute(
      'CREATE TABLE Ticket('
          'id INTEGER PRIMARY KEY, '
          'name TEXT,image TEXT, '
          'gender TEXT'
          ')',
    );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
    );
  }
  static insert(TicketModel data)async{
    final Database db=await database;
    db.insert("Ticket",
        data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  static get()async{
     final Database db=await database;
     List <Map<String,dynamic>>gettiket= await db.query("Ticket");
     getData=gettiket;
     // print(gettiket);
     return List.generate(gettiket.length, (index){
       return TicketModel(
           name : gettiket[index]["name"],
           gender : gettiket[index]["gender"],
           image : gettiket[index]["image"],
       );
     });
  }
}