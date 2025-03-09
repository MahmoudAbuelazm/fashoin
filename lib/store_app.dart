import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'consts/global_colors.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class StoreApp extends StatelessWidget {
  final AppRouter appRouter;
  const StoreApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: cultured,
        primaryColor: white,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: flirt,
          ),
          backgroundColor: cultured,
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: charcoal, fontSize: 22, fontWeight: FontWeight.bold),
          elevation: 0,
        ),
        iconTheme: IconThemeData(
          color: flirt,
        ),

        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.blue,

          // selectionHandleColor: Colors.blue,
        ),

        // textTheme: TextTheme()
        // textTheme: Theme.of(context).textTheme.apply(
        //       bodyColor: Colors.black,
        //       displayColor: Colors.black,
        //     ),
        cardColor: white,
        brightness: Brightness.light,
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(
              secondary: flirt,
              brightness: Brightness.light,
            )
            .copyWith(surface: azureishWhite),
      ),
     initialRoute: Routes.homeScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
