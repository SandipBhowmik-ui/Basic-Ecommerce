import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/widgets/custom_btn.dart';
import 'package:flutter_ecommerce/widgets/custom_input.dart';

import '../constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Future<void> _alertDialogBuilder(String error) async{
    return showDialog(context: context,
        builder: (context){
      return AlertDialog(
        title: Text('Error'),
        content: Container(
          child: Text(error),
        ),
        actions: [
          FlatButton(
              onPressed: (){
                Navigator.pop(context);
              }, child: Text(
            'close Dialogue'
          ),)
        ],
      );
        });
  }
  //create new user account
  Future<String> _createAccount()async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _registerEmail,
          password: _registerPassword);
      return null;
    } on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        return'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    }catch (e) {
     return e.toString();
    }
  }
  void _submitForm()async{
    String _createAccountFeedback = await _createAccount();
  if(_createAccountFeedback!= null){
    _alertDialogBuilder(_createAccountFeedback);
  }

  }

  //form input field values
  String _registerEmail="";
  String _registerPassword="";

  FocusNode _passwordFocusNode;
  @override
  void initState() {
    _passwordFocusNode=FocusNode();
    super.initState();
  }
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                'Create A New Account',
                textAlign: TextAlign.center,
                style: Constants.boldheading,
              ),
            ),
            Column(
              children: [
                CustomInput(
                  hintText: 'Email..',
                  onChanged: (value){
                    _registerEmail=value;
                  },
                  onSubmit: (value){
                    _passwordFocusNode.requestFocus();
                  },
                ),
                CustomInput(
                  hintText: 'Password',
                  onChanged: (value){
                    _registerPassword=value;
                  },
                  focusNode: _passwordFocusNode,
                  onSubmit: (value){
                    _submitForm();
                  },
                ),
                CustomBtn(
                  text: "Create New Account",
                  onPressed: () {
                    _submitForm();
                  },
                ),
              ],
            ),
            CustomBtn(
              text: 'Back  To Login',
              onPressed: () {
                Navigator.pop(context);
              },
              outlineBtn: true,
            ),
          ],
        ),
      ),
    );
  }
}
