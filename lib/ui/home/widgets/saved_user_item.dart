import 'dart:io';

import 'package:contact/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SavedUserItem extends StatelessWidget {
  final UserModel user;
  final VoidCallback onDelete;

  const SavedUserItem({required this.user,required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFFF1D4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
            ClipRRect(
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
      ),
      child: user.imagePath == null
          ? Image.asset(
        "assets/images/image_user.png",
        width: double.infinity,
        height: 160,
        fit: BoxFit.cover,
      )
          : Image.file(
        File(user.imagePath!),
        width: double.infinity,
        height: 160,
        fit: BoxFit.cover,
      ),
    ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffFFF1D4),
                  ),
                  child: Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff29384D),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      spacing: 8,
                      children: [
                        SvgPicture.asset("assets/images/email_icon.svg"),
                        Expanded(
                          child: Text(
                            user.email,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff29384D),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      spacing: 8,
                      children: [
                        SvgPicture.asset("assets/images/Phone_icon.svg"),
                        Text(
                          user.phone,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff29384D),
                          ),
                        ),
                      ],
                    ),
                  ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 36,
                  child: ElevatedButton.icon(
                    onPressed: onDelete,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white
                      ,backgroundColor: const Color(0xffF93E3E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.delete),
                    label: const Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),),
              )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
