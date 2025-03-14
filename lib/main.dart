import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/helpers/pre_app_config.dart';
import 'core/routing/app_router.dart';
import 'store_app.dart';

void main() async {
  await preAppConfig();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => StoreApp(
          appRouter: AppRouter(),
        ),
      ),
    );
  });
}
