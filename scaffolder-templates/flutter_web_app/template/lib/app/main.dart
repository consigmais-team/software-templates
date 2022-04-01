import 'package:flutter_web_app/app/app_module.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_app/app/config/environment.dart';
import 'package:jedi_app_base/jedi_app_base.dart';

void main() async {
  await JdLocalStorageService.init();

  // SystemChrome.setApplicationSwitcherDescription(description)

  final theme = JdThemePallete(
    primaryColor: const Color(0xff1d1ab5),
    secondaryColor: const Color(0xff081f47),
    accentColor: const Color(0xff5acc7d),
    bodyColor: Colors.grey[50],
    cardColor: Colors.white,
    errorColor: const Color(0xffe26f4b),
    linkColor: Colors.blue[600],
    pageColor: Colors.grey[50],
    textColor: Colors.black54,
  );

  final dtheme = JdThemePallete(
    primaryColor: const Color(0xff1d1ab5),
    secondaryColor: const Color(0xff081f47),
    accentColor: const Color(0xff5acc7d),
    bodyColor: Colors.grey[50],
    cardColor: Colors.white,
    errorColor: const Color(0xffe26f4b),
    linkColor: Colors.blue[600],
    pageColor: Colors.grey[50],
    textColor: Color.fromARGB(255, 238, 238, 238),
  );

  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.DEV,
  );

  Environment().initConfig(environment);

  runApp(ModularApp(
      module: AppModule(
        JdAppConfig(
          apiHost: Environment().config.apiHost,
          appLogo: 'assets/app_logo/logo.png',
          appName: 'Crédito Consignado INSS',
          apiPath: Environment().config.apiPath,
          applicationId: 3,
          brandedUrl: false,
          initialRoute: '/sign-up',
          idiom: 'pt-BR',
          connectivityEndpoint: Environment().config.pingEndpoint,
          appStyle: JdAppStyle(),
          darkPallete: dtheme,
          lightPallete: theme,
        ),
      ),
      child: JdAppWidget()));
}
