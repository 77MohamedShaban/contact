import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoFilesSection extends StatelessWidget {
  const NoFilesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
SizedBox(height: 100,),
        /// animation
        Expanded(
          child: Center(
            child: Lottie.asset(
              "assets/animations/Man_with_task_list.json",
            ),
          ),
        ),

        /// text
        Expanded(
          child: Text(
            "There is No Contacts Added Here",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: const Color(0xffFFF1D4),
            ),
          ),
        ),
      ],
    );
  }
}