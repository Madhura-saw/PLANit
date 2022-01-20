import 'package:authentication/widget/sign_up_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:authentication/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:authentication/fpg.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.teal.shade200,
        title: Text(
          'PROFILE',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 70,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'YOU ARE LOGGED IN AS ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            SizedBox(height: 8),
            CircleAvatar(
              maxRadius: 25,
              backgroundImage: NetworkImage(user!.photoURL!),
            ),
            SizedBox(height: 8),
            Text(
              'Name: ' + user.displayName!,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 8),
            Text(
              'Email: ' + user.email!,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignUpWidget()));
              },
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                
                backgroundColor: Colors.white,
                elevation: 2,
              ),
              child: Container(
                  width: 150,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Text('LOGOUT')),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'GO TO HOME PAGE',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            SizedBox(
              height: 15,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => FPage()));
              },
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                
                backgroundColor: Colors.white,
                elevation: 2,
              ),
              child: Container(
                width: 150,
                height: 60,
                alignment: Alignment.center,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Text('HOME'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
