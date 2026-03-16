import 'package:contacts_app/core/remote/local/prefs_manager.dart';
import 'package:contacts_app/core/utils/app_colors.dart';
import 'package:contacts_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(const ContactsApp());
}

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.gold,
          selectionColor: AppColors.gold.withValues(alpha: 0.20),
          selectionHandleColor: AppColors.gold,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
