import 'package:hive_flutter/hive_flutter.dart';

class AppDatabase {
  
  /// Initialize Hive database 
  /// Open user box
  static Future<void> initializeDatabase() async {
    await Hive.initFlutter();
    await Hive.openBox('user');
  }
}