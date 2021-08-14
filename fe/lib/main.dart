import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:queshi/ui/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('pt', 'BR'), Locale('en', 'US')],
        path: 'assets/translations',
        fallbackLocale: Locale('pt', 'BR'),
        child: QueshiApp()),
  );
}

class QueshiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFF005C),
        accentColor: Color(0xFFFF005C),
        fontFamily: 'Montserrat',
        backgroundColor: Color(0xFFF5E8C7),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.dark().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Righteous',
                  fontSize: 40,
                ),
              ),
        ),
      ),
    );
  }
}
