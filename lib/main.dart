import 'package:fetch/app.dart';
import 'package:fetch/core/apis/api_base.dart';
import 'package:fetch/core/config/config.dart';
import 'package:fetch/core/firebase/core.dart';
import 'package:fetch/core/helper/enums.dart';
import 'package:fetch/core/storage/storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init firebase
  await FirebaseCore.create();

  // init config
  await AppConfig.instance.init();

  // init storage
  await initStorage();

  // init API
  initApi(Environment.development);

  runApp(const ProviderScope(child: Checkout()));
}
