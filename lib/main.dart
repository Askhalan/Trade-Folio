import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tradefolio/core/theme/theme.dart';
import 'package:tradefolio/model/company_model.dart';
import 'package:tradefolio/model/global_quote_model.dart';
import 'package:tradefolio/view/widgets/bottom_bar.dart';

bool _isHiveInitialized = false; 

Future<void> initHive() async {
  if (!_isHiveInitialized) {
    await Hive.initFlutter();

    // Register adapters only once
    Hive.registerAdapter(GlobalQuoteModelAdapter());
    Hive.registerAdapter(CompanyModelAdapter());

    _isHiveInitialized = true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await initHive(); // Initialize Hive and register adapters
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: JAppTheme.lightTheme,
      darkTheme: JAppTheme.darkTheme,
      home: const NavigationMenu(),
    );
  }
}
