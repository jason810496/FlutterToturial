# Flutter SQLflite Tutorial

In this tutorial, we will learn how to use `sqlflite` package in Flutter to perform CRUD operations on a SQLite database.

## Sqlflite

[`Sqflite`](https://pub.dev/packages/sqflite) is a DAO for [`sqlite`](https://sqlite.org/index.html) database in flutter framework .

## Example App

[Todo App github repository](https://github.com/abdelMohsen571/todo_sqlflite)

The example app use `sqlflite` + `bloc` ( a state manager in flutter ) packages .

## Step 1: Add Dependencies


To use `sqlflite` package, we need to add the following dependencies in our `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.0.0+3
  path_provider: ^2.0.2
```

- `sqflite`: The SQLite plugin for Flutter.
- `path_provider`: Provides access to the device's file system.

Once we have added the dependencies, run `flutter pub get` command to install them.

## Step 2: Create Database Helper Class

Create a database helper class that will handle all the database related operations. We will create a class `DatabaseHelper` in a new file `database_helper.dart`.

```dart
import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "myDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'my_table';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnAge INTEGER NOT NULL
          )
          ''');
  }

  // Database helper methods:

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
```

In the above code, we have created a singleton class DatabaseHelper that handles all the database related operations. We have defined the database name and version, table name and column names. 

## Step 3: Use the Database Helper

In this step, we will use the `DatabaseHelper` class to perform CRUD operations on the SQLite database.

### Insert Data
To insert data into the database, we can call the insert method of the DatabaseHelper class. Here's an example:

```dart
Map<String, dynamic> row = {
  DatabaseHelper.columnName: 'Bob',
  DatabaseHelper.columnAge: 25,
};
int id = await DatabaseHelper.instance.insert(row);
```

In the above code, we have created a map `row` that contains the values to be inserted into the database. We have called the `insert` method of the `DatabaseHelper` class and passed the `row` map as an argument. The method returns the id of the newly inserted row.

### Query Data
To query data from the database, we can call the `queryAllRows` method of the `DatabaseHelper` class. Here's an example:

```dart
List<Map<String, dynamic>> rows = await DatabaseHelper.instance.queryAllRows();
```

In the above code, we have called the `queryAllRows` method of the `DatabaseHelper` class. The method returns a list of maps, where each map represents a row in the database.


### Update Data
To update data in the database, we can call the update method of the DatabaseHelper class. Here's an example:

```dart
Map<String, dynamic> row = {
  DatabaseHelper.columnId: 1,
  DatabaseHelper.columnName: 'Bob',
  DatabaseHelper.columnAge: 26,
};
int count = await DatabaseHelper.instance.update(row);
```

In the above code, we have created a map `row` that contains the values to be updated in the database. We have called the `update` method of the `DatabaseHelper` class and passed the row map as an argument. The method returns the number of rows that were affected by the update.

### Delete Data
To delete data from the database, we can call the `delete` method of the `DatabaseHelper` class. Here's an example:


```dart
int id = 1;
int count = await DatabaseHelper.instance.delete(id);
```

In the above code, we have passed the id of the row to be deleted to the delete method of the DatabaseHelper class. The method returns the number of rows that were affected by the delete operation.

### More Example : 

### Inserting Multiple Rows

To insert multiple rows into the database, we can use the `batch` method of the `DatabaseHelper` class. Here's an example:

```dart
List<Map<String, dynamic>> rows = [
  {
    DatabaseHelper.columnName: 'Alice',
    DatabaseHelper.columnAge: 23,
  },
  {
    DatabaseHelper.columnName: 'Charlie',
    DatabaseHelper.columnAge: 28,
  },
];
await DatabaseHelper.instance.batchInsert(rows);
```

In the above code, we have created a list `rows` that contains the values to be inserted into the database. We have called the `batchInsert` method of the `DatabaseHelper` class and passed the rows list as an argument. The method inserts all the rows in a single transaction.


### Querying Rows with Conditions

To query rows from the database that match certain conditions, we can use the `queryRows` method of the `DatabaseHelper` class. Here's an example:

```dart
String name = 'Bob';
List<Map<String, dynamic>> rows = await DatabaseHelper.instance.queryRows(
  where: '${DatabaseHelper.columnName} = ?',
  whereArgs: [name],
);
```

In the above code, we have passed a `where` clause and `whereArgs` to the `queryRows` method of the DatabaseHelper class. The `where` clause specifies the condition to be matched, and the `whereArgs` specifies the values to be used in the condition. The method returns a list of maps, where each map represents a row in the database that matches the condition.


### Updating Rows with Conditions
To update rows in the database that match certain conditions, we can use the `updateRows` method of the `DatabaseHelper` class. Here's an example:


```dart
String name = 'Bob';
Map<String, dynamic> values = {
  DatabaseHelper.columnAge: 27,
};
int count = await DatabaseHelper.instance.updateRows(
  values,
  where: '${DatabaseHelper.columnName} = ?',
  whereArgs: [name],
);
```

In the above code, we have passed a `values` map, a `where` clause, and `whereArgs` to the `updateRows` method of the `DatabaseHelper` class. The `values` map specifies the columns to be updated and their new values, the `where` clause specifies the condition to be matched, and the `whereArgs` specifies the values to be used in the condition. The method returns the number of rows that were affected by the update.


### Deleting Rows with Conditions
To delete rows from the database that match certain conditions, we can use the `deleteRows` method of the `DatabaseHelper` class. Here's an example:


```dart
String name = 'Bob';
int count = await DatabaseHelper.instance.deleteRows(
  where: '${DatabaseHelper.columnName} = ?',
  whereArgs: [name],
);
```

In the above code, we have passed a `where` clause and `whereArgs` to the `deleteRows` method of the `DatabaseHelper` class. The `where` clause specifies the condition to be matched, and the `whereArgs` specifies the values to be used in the condition. The method returns the number of rows that were affected by the delete operation.

## Conclusion

In this tutorial, we have learned how to use the `sqlflite` package in Flutter to perform CRUD operations on a SQLite database. We created a database helper class that handled all the database related operations, and we used the class to insert, query, update and delete data from the database.