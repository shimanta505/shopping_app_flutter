import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping_app/admin/add_product_admin.dart';
import 'package:shopping_app/utils/size_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.bottom]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarContrastEnforced: false,
  ));
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Shopping Demo',
        debugShowCheckedModeBanner: false,
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
        home: const AddProductAdmin(),
      );
    });
  }
}
