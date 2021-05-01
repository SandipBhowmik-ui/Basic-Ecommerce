import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/home_page.dart';

import 'login_screen.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('error ${snapshot.error}'),
            ),
          );
        }
        // connection initialisation
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamSnapshot) {
                if (streamSnapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text('error ${streamSnapshot.error}'),
                    ),
                  );
                }
                //connection state active ,Do the user login check inside if statement
                if (streamSnapshot.connectionState == ConnectionState.active) {
                  User _user = streamSnapshot.data;
                  if (_user == null) {
                    return LoginPage();
                  } else {
                    return HomePage();
                  }
                }

                //checking auth state ...
                return Scaffold(
                  body: Center(
                    child: Text('Checking Authentication...'),
                  ),
                );
              });
        }
        return Scaffold(
          body: Center(
            child: Text('Initializinig App ...'),
          ),
        );
      },
    );
  }
}
