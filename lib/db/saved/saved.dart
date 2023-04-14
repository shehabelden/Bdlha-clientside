import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../../models/saved/saved_model.dart';
class SavedDb{
  static late dynamic database;
  static List getData=[];
  static init() async{
    database = openDatabase(
      join(await getDatabasesPath(), 'Cart.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return  db.execute(
          'CREATE TABLE Cart('
              'id INTEGER PRIMARY KEY, '
              'name TEXT, '
              'image TEXT, '
              'pio TEXT, '
              'rate INTEGER,'
              'EXCHANGE TEXT '
          ')',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }
  static insert(SavedModel data)async{
    final Database db=await database;
    print(data);
    await db.insert(
        "Cart",
        data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  static get()async{
    final Database db=await database!;
    List <Map<String,dynamic>>gettiket= await db.query("Cart");
    getData=gettiket;
    print(gettiket);
    return List.generate(gettiket.length, (index){
      return SavedModel(
        name : gettiket[index]["name"],
        EXCHANGE : gettiket[index]["EXCHANGE"],
        image : gettiket[index]["image"],
        rate : gettiket[index]["rate"],
        pio : gettiket[index]["pio"],
      );
    });
  }
  static delete(id)async{
    final Database db=await database;
    db.delete(
        "Cart",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}