import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/screens/register_page.dart';
import 'package:flutter_ecommerce/widgets/custom_btn.dart';
import 'package:flutter_ecommerce/widgets/custom_input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                'Welcome User,\n Log in to your account',
                textAlign: TextAlign.center,
                style: Constants.boldheading,
              ),
            ),
            Column(
              children: [
                CustomInput(
                  hintText: 'Email..',
                ),
                CustomInput(
                  hintText: 'Password',
                ),
                CustomBtn(
                  text: "Login",
                  onPressed: () {
                    print('clicked login button');

                  },
                ),
              ],
            ),
            CustomBtn(
              text: 'Create New Account',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              outlineBtn: true,
            ),
          ],
        ),
      )),
    );
  }
}
