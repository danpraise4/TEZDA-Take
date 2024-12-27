// ignore_for_file: deprecated_member_use

import 'package:fetch/core/navigation/kroute.dart';
import 'package:fetch/core/theme/theme.dart';
import 'package:fetch/features/authentication/presentation/screens/setup.dart';
import 'package:fetch/features/authentication/presentation/screens/login.dart';
import 'package:fetch/features/authentication/presentation/screens/register.dart';
import 'package:fetch/features/checkout/data/models/product.model.dart';
import 'package:fetch/features/checkout/presentation/screens/product_preview.dart';
import 'package:fetch/features/introduction/app/pages/introduction.dart';
import 'package:fetch/features/introduction/app/pages/onboard.dart';
import 'package:fetch/features/introduction/app/pages/splash.dart';
import 'package:fetch/features/checkout/presentation/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


part 'routes.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  static final navKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  State<Checkout> createState() => _WeFetchState();
}

class _WeFetchState extends State<Checkout> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
 
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // App is going to background, show dialog
    }
  }

  MediaQueryData mediaQuery(height) {
    return MediaQuery.of(context).copyWith(
        textScaleFactor: height <= 620
            ? 0.8
            : height <= 820
                ? 0.9
                : 1.0);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    // Responsive design
    return ScreenUtilInit(
      ensureScreenSize: true,
      designSize: const Size(375, 810),
      builder: (context, child) {

        // Create the app
        return MaterialApp(
          navigatorKey: Checkout.navKey,
          scaffoldMessengerKey: Checkout.scaffoldMessengerKey,
          initialRoute: Splash.route,
          darkTheme: AppTheme(context).getDark(),
          theme: AppTheme(context).getLight(),
          debugShowCheckedModeBanner: false,
          
          builder: (context, child) {
            final height = MediaQuery.of(context).size.height;
            return MediaQuery(
              data: mediaQuery(height),
              child: Overlay(
                initialEntries: [
                  OverlayEntry(
                    builder: (context) => child ?? const Material(),
                  )
                ],
              ),
            );
          },

          // 
          onGenerateRoute: onGenerate,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}