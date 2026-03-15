import 'dart:io';

class Contact {
  final String name;
  final String email;
  final String phone;
  final File? image;

  const Contact({
    required this.name,
    required this.email,
    required this.phone,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image_path': image?.path,
    };
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image_path'] != null ? File(json['image_path']) : null,
    );
  }
}
