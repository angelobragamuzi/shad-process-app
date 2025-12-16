import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadprocess/src/modules/splash/screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(milliseconds: 200));
  await SharedPreferences.getInstance();
  // await dotenv.load(fileName: ".env");
  runApp(const ShadFinancyInitializer());
}

class ShadFinancyInitializer extends StatelessWidget {
  const ShadFinancyInitializer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      debugShowCheckedModeBanner: false,
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: ShadColorScheme.fromName('blue'),
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: ShadColorScheme.fromName('slate'),
      ),
      home: const SplashScreen(),
    );
  }
}
