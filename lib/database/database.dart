
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppConst {
  static const String databaseName = "erase_objects.db";

  static const String imagesTable = "images";
  static const String savedImagesTable = "savedImages";
  static const String id = "id";
  static const String filename = "filename";
  static const String filePath = "filepath";
}

class DbHelper {
  static final DbHelper instance = DbHelper._init();

  DbHelper._init();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB(AppConst.databaseName);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path,
        version: 1, onCreate: _createDB, onUpgrade: _deleteDB);
  }

  Future<void> _deleteDB(Database db, int i, int? j) async {
    await db.execute("DROP DATABASE ${AppConst.databaseName}");
  }

  Future _createDB(Database db, int version) async {

    await db.execute('''create table IF NOT EXISTS ${AppConst.imagesTable} (
        ${AppConst.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${AppConst.filename} text,
        ${AppConst.filePath} text)''');

    await db.execute('''create table IF NOT EXISTS ${AppConst.savedImagesTable} (
        ${AppConst.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${AppConst.filename} text,
        ${AppConst.filePath} text)''');

  }

  // Future<List<ImageModel>> getAllImages({required bool saved}){
  //   if(saved){
  //     return getAllSavedImages();
  //   }else{
  //     return getAllGalleryImages();
  //   }
  // }
  //
  // Future<List<ImageModel>> getGalleyAndSavedImages() async {
  //   List<ImageModel> newList = [];
  //   newList.addAll(await getAllSavedImages()) ;
  //   newList.addAll(await getAllGalleryImages()) ;
  //
  //   return newList;
  // }
  //
  // Future<List<ImageModel>> getAllGalleryImages() async {
  //   List<Map<String,dynamic>> result = [];
  //   List<ImageModel> result1 = [];
  //   try {
  //     final db = await database;
  //     result = await db.query(AppConst.imagesTable,);
  //     if (result.isNotEmpty) {
  //
  //       result1 = result.map((map) => ImageModel.fromJson(map)).toList();
  //       print("AllImage Retrieval Successful");
  //       print("File Path From Database : ${result1[0].filename}");
  //       // print("${result1[0].id}");
  //     } else {
  //       print("Failed to Retrieve All Images");
  //     }
  //     return result1;
  //   } catch (e) {
  //     print("Exception while retriving images: ${e.toString()}");
  //
  //     return [];
  //
  //   }
  //
  // }
  //
  // Future<List<ImageModel>> getAllSavedImages() async {
  //   List<Map<String,dynamic>> result = [];
  //   List<ImageModel> result1 = [];
  //   try {
  //     final db = await database;
  //     result = await db.query(AppConst.savedImagesTable,);
  //     if (result.isNotEmpty) {
  //
  //       result1 = result.map((map) => ImageModel.fromJson(map)).toList();
  //       print("AllImage Retrieval Successful");
  //       print("File Path From Database : ${result1[0].filename}");
  //       // print("${result1[0].id}");
  //     } else {
  //       print("Failed to Retrieve All Images");
  //     }
  //     return result1;
  //   } catch (e) {
  //     print("Exception while retriving images: ${e.toString()}");
  //
  //     return [];
  //
  //   }
  //
  // }
  //
  // Future<ImageModel?> getSingleImage({required int id,required bool saved}) async {
  //   if(saved){
  //     return getSingleSavedImage(id);
  //   }else{
  //     return getSingleGalleryImage(id);
  //   }
  // }
  //
  // Future<ImageModel?> getSingleGalleryImage(int id) async {
  //   List<Map<String,dynamic>> result = [];
  //   late ImageModel? result1 = null;
  //   try {
  //     final db = await database;
  //     result = await db.query(AppConst.imagesTable,
  //         where: "${AppConst.imagesTable}.${AppConst.id} = ?",
  //         whereArgs: [id]);
  //     if (result.isNotEmpty) {
  //       result1 = ImageModel.fromJson(result.first);
  //       print("Intro Retrieval Successful");
  //       print("${result1.id}");
  //       return result1;
  //     } else {
  //       print("Failed to Retrieve intro");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return result1;
  // }
  //
  // Future<ImageModel?> getSingleSavedImage(int id) async {
  //   List<Map<String,dynamic>> result = [];
  //   late ImageModel? result1 = null;
  //   try {
  //     final db = await database;
  //     result = await db.query(AppConst.savedImagesTable,
  //         where: "${AppConst.id} = ?",
  //         whereArgs: [id]);
  //     if (result.isNotEmpty) {
  //       result1 = ImageModel.fromJson(result.first);
  //       print("Intro Retrieval Successful");
  //       print("${result1.id}");
  //       return result1;
  //     } else {
  //       print("Failed to Retrieve intro");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return result1;
  // }
  //
  // Future<void> insertNewImage({required ImageModel model}) async {
  //   try {
  //     final db = await database;
  //     // ImageModel? imageModel = await getSingleImage(model.id);
  //     if(model.id == null){
  //       int result = await db.insert(AppConst.imagesTable, model.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  //       if (result == 0) {
  //         print("Image Saved To The Table");
  //       } else {
  //         print("Failed to save Image");
  //       }
  //     }else{
  //
  //       int result = await db.update(AppConst.imagesTable,
  //           model.toMap(),where: '${AppConst.imagesTable}.${AppConst.id} = ?',
  //           whereArgs: [model.id]);
  //       if (result == 0) {
  //         print("Image Updated To The Table");
  //       } else {
  //         print("Failed to Update Image");
  //       }
  //     }
  //
  //
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  //
  // Future<void> insertNewSavedImage({required ImageModel model}) async {
  //   try {
  //     final db = await database;
  //     // ImageModel? imageModel = await getSingleImage(model.id);
  //     if(model.id == null){
  //       int result = await db.insert(AppConst.savedImagesTable, model.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  //       if (result == 0) {
  //         print("Image Saved To The Table");
  //       } else {
  //         print("Failed to save Image");
  //       }
  //     }else{
  //
  //       int result = await db.update(AppConst.savedImagesTable,
  //           model.toMap(),where: '${AppConst.savedImagesTable}.${AppConst.id} = ?',
  //           whereArgs: [model.id]);
  //       if (result == 0) {
  //         print("Image Updated To The Table");
  //       } else {
  //         print("Failed to Update Image");
  //       }
  //     }
  //
  //
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  //
  // Future<void> removeSingleImage({required int id}) async {
  //   try {
  //     final db = await database;
  //     int result = await db.delete(AppConst.imagesTable, where: '${AppConst.id} = ?',whereArgs: [id]);
  //
  //     if (result == 1) {
  //       print("${id}Image Deleted Successsfully");
  //     } else {
  //       print("Failed to Delete Image");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  //
  // Future<void> removeSingleSavedImage({required int id}) async {
  //   try {
  //     final db = await database;
  //     int result = await db.delete(AppConst.savedImagesTable, where: '${AppConst.id} = ?',whereArgs: [id]);
  //
  //     if (result == 1) {
  //       print("${id}Image Deleted Successsfully");
  //     } else {
  //       print("Failed to Delete Image");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }


}
