import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/home_temp.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:componentes/src/routes/routes.dart';
// import 'package:componentes/src/pages/home_temp.dart';
import 'package:flutter/material.dart';

void main() => runApp(Wcomponentes());

class Wcomponentes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('en', 'US'), const Locale('es', 'ES')],
      //home: WHomePageTemp(),
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      /* onGenerateRoute: (RouteSettings settings){
        print("Ruta llamada: ${settings.name}");
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
          );
      }, */
    );
  }
}
