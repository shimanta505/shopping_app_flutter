import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/pages/authentication/sign_up/sign_up_page.dart';
import 'package:shopping_app/utils/size_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.blue, //
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffecefe8), //
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SignUpPage(),
      );
    });
  }
}
