import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quikka/core/constants/route_paths.dart';
import 'package:quikka/core/providers_setup.dart';
import 'package:quikka/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
          title: 'Quikka',
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: RoutePaths.HomeRoute,
          onGenerateRoute: Router.generateRoute),
    );
  }
}
