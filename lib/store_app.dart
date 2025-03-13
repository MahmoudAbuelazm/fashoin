import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/colors.dart';
import 'core/theme/styles.dart';

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
        scaffoldBackgroundColor: ColorsManagers.cultured,
        primaryColor: ColorsManagers.white,
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: ColorsManagers.darkSkyBlue,
          ),
          backgroundColor: ColorsManagers.cultured,
          centerTitle: true,
          titleTextStyle: TextStyles.font22Charcoalw700(context),
          elevation: 0,
        ),
        iconTheme: const IconThemeData(
          color: ColorsManagers.darkSkyBlue,
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
        cardColor: ColorsManagers.white,
        brightness: Brightness.light,
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(
              secondary: ColorsManagers.darkSkyBlue,
              brightness: Brightness.light,
            )
            .copyWith(surface: ColorsManagers.azureishWhite),
      ),
      initialRoute: Routes.homeScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
