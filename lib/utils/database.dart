import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:business_card_project/models/card.dart';


class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }


  init() async {
    return await openDatabase(
        join(await getDatabasesPath(), 'business_card_database.db'),
        onCreate: (db, version) async {
          await db.execute('''
          CREATE TABLE cards(
            id INTEGER PRIMARY KEY, 
            avatar TEXT, 
            name TEXT, 
            lastName TEXT, 
            company TEXT, 
            phone TEXT, 
            email TEXT, 
            description TEXT
          )
        ''');
        },
        version: 1
    );
  }

  // newCard(newCard) async {
  //   final db = await database;
  //
  //   var res = await db.rawInsert('''
  //     INSERT INTO cards (
  //       id, avatar, name, lastName, company, phone, email, description
  //     ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
  //   ''', [newCard.id, newCard.avatar, newCard.name, newCard.lastName, newCard.company, newCard.phone, newCard.email, newCard.description]
  //   );
  //
  //   return res;
  // }
  //
  //
  // Future<dynamic> getUser() async {
  //   final db = await database;
  //   var res = await db.query("card");
  //   if(res.length == 0) {
  //     return null;
  //   } else {
  //     var resMap = res[0];
  //     return resMap.isNotEmpty ? resMap : Null;
  //   }
  // }


  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
    final Future<Database> database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'business_card_database.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
            "CREATE TABLE cards("
                "id INTEGER PRIMARY KEY, "
                "avatar TEXT, "
                "name TEXT, "
                "lastName TEXT, "
                "company TEXT, "
                "phone TEXT, "
                "email TEXT, "
                "description TEXT)"
        );
      },
      version: 1,
    );

    // var fCard = Card(1, '', 'image/dress_for_day.jpg', 'Natalya', 'Skyba',
    //     'HandMade', 'nataly.skyba@gmail.com', 'My company is perfect. '
    //         'We are the first rental service for evening and cocktail '
    //         'dresses in Kyiv. Our main advantage is the best prices for '
    //         'the rental of branded dresses in Kyiv !!! ');
    //
    // // Insert a dog into the database.
    // await insertCard(fCard);
    //
    // // Print the list of dogs (only Fido for now).
    // print(await cards());
    //
    // // Update Fido's age and save it to the database.
    // fCard = Card(fCard.id, fCard.imageUrl, fCard.name, fCard.lastName, 'Weekly', fCard.phone, fCard.email, fCard.description);
    // await updateCard(fCard);
    //
    // // Print Fido's updated information.
    // print(await cards());
    //
    // // Delete Fido from the database.
    // await deleteCard(fCard.id);
    //
    // // Print the list of dogs (empty).
    // print(await cards());
  }

  Future<void> insertCard(Card card) async {
    // Get a reference to the database.
    final Database db = await database;

    await db.insert(
      'cards',
      card.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Card>> cards() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Cards.
    final List<Map<String, dynamic>> maps = await db.query('cards');

    // Convert the List<Map<String, dynamic> into a List<Card>.
    return List.generate(maps.length, (i) {
      return Card(
        maps[i]['id'],
        maps[i]['avatar'],
        maps[i]['name'],
        maps[i]['lastName'],
        maps[i]['company'],
        maps[i]['phone'],
        maps[i]['email'],
        maps[i]['description'],
      );
    });
  }

  Future<void> updateCard(Card card) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'cards',
      card.toMap(),
      // Ensure that the Card has a matching id.
      where: "id = ?",
      // Pass the Card's id as a whereArg to prevent SQL injection.
      whereArgs: [card.id],
    );
  }

  Future<void> deleteCard(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Cards from the Database.
    await db.delete(
      'cards',
      // Use a `where` clause to delete a specific card.
      where: "id = ?",
      // Pass the Card's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }



}