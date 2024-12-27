// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fetch/core/storage/database.dart';
import 'package:fetch/core/storage/storage.dart';
import 'package:fetch/features/authentication/data/model/user.model.dart';

bool isFirstTime() {
  final isFirst = getSettings(path: DB.FIRST_TIME);
  if (isFirst == null) {
    setSettings(key: DB.FIRST_TIME, value: true);
    return true;
  }
  return false;
}

String? get getToken {
  final token = getStorage(path: DB.TOKEN);
  if (token != null) {
    return token["accessToken"];
  }

  return null;
}

UserModel? get getUser {
  final user = getStorage(path: DB.USER);
  if (user != null) {
    return UserModel.fromMap(user);
  }
  return null;
}
