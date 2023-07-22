import 'package:flutter/material.dart';
import 'package:invoice_generator/Views/screens/Invoice_Generator.dart';
import 'package:invoice_generator/utils/MyRoutes.dart';
import 'package:invoice_generator/utils/color_utils.dart';

import 'Views/screens/Home_Page.dart';
import 'Views/screens/Splash_Screen.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

        theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: theme_1,
        ),
      initialRoute: MyRoutes.SplashScreen,
      routes: {
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.SplashScreen: (context) => const SplashScreen(),
        MyRoutes.InvoiceGenerator: (context) => const Invoice_Generator(),
      },
    );
  }
}
