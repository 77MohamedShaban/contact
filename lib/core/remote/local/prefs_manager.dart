import 'dart:convert';
import 'package:contacts_app/core/models/contact_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PrefsManager {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveContacts(List<Contact> contacts) async {
    final String encodedData = jsonEncode(
      contacts.map((contact) => contact.toJson()).toList(),
    );
    await _prefs.setString('contacts_list', encodedData);
  }

  static List<Contact> loadContacts() {
    final String? contactsJson = _prefs.getString('contacts_list');
    if (contactsJson != null) {
      final List<dynamic> decodedList = jsonDecode(contactsJson);
      return decodedList.map((item) => Contact.fromJson(item)).toList();
    }
    return [];
  }
}
