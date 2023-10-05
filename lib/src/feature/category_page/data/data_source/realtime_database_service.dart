import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';
import 'package:untitled9/src/feature/category_page/domain/entities/category_model.dart';
import 'package:untitled9/src/feature/category_page/domain/entities/password_model.dart';

abstract interface class IRealtimeDatabaseServ {
  Future<bool> writeNewPassword(PasswordModel passwordModel);
  Stream<List<PasswordModel>> listenData(String user);
  Future<bool> writeNewCategory(CategoryModel category);
}

@injectable
class RealtimeDatabaseServ implements IRealtimeDatabaseServ {
  FirebaseDatabase ref = FirebaseDatabase.instance;

  @override
  Future<bool> writeNewPassword(PasswordModel passwordModel) async {
    try {
      await ref
          .ref('users/${passwordModel.userID}/${passwordModel.namePassword}')
          .set(passwordModel.toRealtimeDatabase());
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

// чтение данный стримом
  @override
  Stream<List<PasswordModel>> listenData(String userID) {
    final StreamController<List<PasswordModel>> controller =
        StreamController<List<PasswordModel>>();

    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('users/$userID');

    starCountRef.onValue.listen(
      (DatabaseEvent event) {
        if (event.snapshot.value != null) {
          try {
            if (event.snapshot.value is Map) {
              final data =
                  Map<String, dynamic>.from(event.snapshot.value as Map);
              final passwords = data.entries.map((entry) {
                if (entry.value is Map) {
                  final passwordData =
                      Map<String, dynamic>.from(entry.value as Map);
                  return PasswordModel.fromRealtimeDatabase(passwordData);
                } else {
                  throw FormatException(
                      'Expected a Map, but got ${entry.value.runtimeType}');
                }
              }).toList();
              controller.add(passwords);
            } else {
              throw FormatException(
                  'Expected a Map, but got ${event.snapshot.value.runtimeType}');
            }
          } catch (e) {
            debugPrint('Error parsing data: $e');
            controller.addError(e);
          }
        } else {
          debugPrint('No data found or data is null');
          controller.addError('No data found or data is null');
        }
      },
      // Handle error
      onError: (error) {
        debugPrint('Stream error: $error');
        controller.addError(error);
      },
      // Cancel subscription on controller close
      onDone: controller.close,
      // Use cancelOnError to true if you want to close the controller when an error occurred
      cancelOnError: false,
    );

    return controller.stream;
  }

  @override
  Future<bool> writeNewCategory(CategoryModel category) async {
    try {
      await ref
          .ref('users/${category.userID}/${category.nameCategory}')
          .set(category.toRealtimeDatabase());
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
