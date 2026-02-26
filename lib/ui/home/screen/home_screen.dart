import 'dart:io';

import 'package:contact/model/user_model.dart';
import 'package:contact/ui/home/widgets/saved_user_item.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/no_files_section.dart';
import '../widgets/text_field_login.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> users = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff29384D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/route.png", height: 30),
              const SizedBox(height: 20),

              if (users.isEmpty)
                const Expanded(child: NoFilesSection())
              else
                Expanded(
                  child: GridView.builder(
                    itemCount: users.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.6,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return SavedUserItem(user: user, onDelete: () { setState(() {
                        users.removeAt(index);
                      }); },);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffFFF1D4),
        child: const Icon(Icons.add, color: Color(0xff29384D)),
        onPressed: () async {
          UserModel tempUser = UserModel(
            name: "User Name",
            email: "example@email.com",
            phone: "+200000000000",
          );
          File? selectedImage;
          final result = await showModalBottomSheet<UserModel>(

            context: context,
            backgroundColor: const Color(0xff29384D),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setStateSheet) {
                  return Container(
                    height: height * 0.5,
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  border: Border.all(
                                    color: const Color(0xffFFF1D4),
                                  ),
                                ),
                                child:InkWell(
                                  onTap: () async {
                                    final ImagePicker picker = ImagePicker();

                                    final XFile? image =
                                    await picker.pickImage(source: ImageSource.gallery);

                                    if (image != null) {
                                      setStateSheet(() {
                                        selectedImage = File(image.path);
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(28),
                                      border: Border.all(color: const Color(0xffFFF1D4)),
                                    ),
                                    child: selectedImage == null
                                        ? Lottie.asset(
                                      "assets/animations/Image_Not_Preview.json",
                                      fit: BoxFit.contain,
                                    )
                                        : ClipRRect(
                                      borderRadius: BorderRadius.circular(28),
                                      child: Image.file(
                                        selectedImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ) ,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildPreviewText(tempUser.name),
                                  const Divider(color: Color(0xffFFF1D4)),
                                  _buildPreviewText(tempUser.email),
                                  const Divider(color: Color(0xffFFF1D4)),
                                  _buildPreviewText(tempUser.phone),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                       Expanded(
                         child: Column(spacing: 5,children: [
                           TextFieldLogin(
                             text: "Enter User Name",
                             onChanged: (value) {
                               setStateSheet(() {
                                 tempUser.name = value;
                               });
                             },
                             type: TextInputType.name,
                           ),
                           TextFieldLogin(
                             text: "Enter User Email",
                             onChanged: (value) {
                               setStateSheet(() {
                                 tempUser.email = value;
                               });
                             },
                             type: TextInputType.emailAddress,
                           ),
                           TextFieldLogin(
                             text: "Enter User Phone",
                             onChanged: (value) {
                               setStateSheet(() {
                                 tempUser.phone = value;
                               });
                             },
                             type: TextInputType.phone,
                           ),
                         ],),
                       )

                        ,SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffFFF1D4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              tempUser.imagePath = selectedImage?.path;
                              Navigator.pop(context, tempUser);
                            },
                            child: const Text(
                              "Enter User",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff29384D),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );

          /// بعد ما الـ BottomSheet يقفل
          if (result != null) {
            setState(() {
              users.add(result);
            });
          }
        },
      ),
    );
  }
}

Widget _buildPreviewText(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xffFFF1D4),
    ),
  );
}
