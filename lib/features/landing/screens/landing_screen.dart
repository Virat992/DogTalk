import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';
import 'package:whatsapp_ui/features/auth/screens/login_screen.dart';
import 'package:whatsapp_ui/utils/colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const Text(
            'Welcome to DogTalk',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: size.height / 9),
          Image.asset(
            'assets/bg.png',
            height: 300,
            width: 300,
            color: tabColor,
          ),
          SizedBox(height: size.height / 12),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service. ',
              style: TextStyle(
                color: greyColor,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 38),
          Expanded(
            child: SizedBox(
              width: size.width * 0.75,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: CustomButton(
                  text: 'AGREE AND CONTINUE',
                  onPressed: () {
                    navigateToLoginScreen(context);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  /*void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LogInScreen());
  }*/
}
