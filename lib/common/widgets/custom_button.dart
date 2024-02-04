import 'package:flutter/material.dart';
import 'package:whatsapp_ui/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: tabColor,
            minimumSize: Size(screenSize.width * 0.8, 40),
            padding: const EdgeInsets.symmetric(vertical: 10)),
        child: Text(
          text,
          style: const TextStyle(
            color: blackColor,
          ),
        ));
  }
}
