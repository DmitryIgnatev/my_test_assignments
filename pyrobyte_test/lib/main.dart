import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pyrobyte_test/UI/pages/vending_machines/vending_machines_page.dart';
import 'package:pyrobyte_test/l10n/l10n.dart';
import 'package:pyrobyte_test/utils/di.dart';
import 'package:pyrobyte_test/utils/theme/theme.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      supportedLocales: L10n.all,
      locale: const Locale('ru'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: const VendingMachinesPage(),
    );
  }
}
