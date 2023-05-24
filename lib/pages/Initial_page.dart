import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:one_app/constants/constants.dart';
import 'package:one_app/pages/Login_Page.dart';

import '../components/components.dart';
import 'SignUp_Page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  static String id = 'InitialPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              KNameApp,
              style: TextStyle(
                  fontSize: 45, fontFamily: 'Anton', color: kPrimaryColor),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Speak with',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: KJosefinSansFont,
                  color: kPrimaryColor),
            ),
            const Text(
              'anyone, anywhere,anytime',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: KJosefinSansFont,
                  color: kPrimaryColor),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SinUpPage.id);
              },
              child: Container(
                width: 230,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: kPrimaryColor,
                ),
                child: const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: KJosefinSansFont),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Already a member',
              style: TextStyle(
                fontFamily: KJosefinSansFont,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextButton(
              color: kPrimaryColor,
              text: 'login',
              fontFamily: KJosefinSansFont,
              onTap: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
