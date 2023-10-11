// import 'package:hive_flutter/hive_flutter.dart';
// 
// 
// class HiveClient {
//   HiveClient._internal();
//   static final _singleton = HiveClient._internal();
//   factory HiveClient() => _singleton;
// 
//   Future<Box<Auth>> openAuthBox() async {
//     return _openBox(HiveBoxName.auth, HiveAdapterType.auth, HiveAdapter.auth);
//   }
// 
// 
//   Future<Box<T>> _openBox<T>(
//     String name,
//     int typeId,
//     TypeAdapter<T> adapter,
//   ) async {
//     if (!Hive.isAdapterRegistered(typeId)) {
//       Hive.registerAdapter(adapter);
//     }
//     return Hive.openBox<T>(name);
//   }
// }
// 