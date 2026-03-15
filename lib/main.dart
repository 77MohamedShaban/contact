import 'package:contacts_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'core/remote/local/prefs_manager.dart';

void main() async{
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
      home: const HomeScreen(),
    );
  }
}
