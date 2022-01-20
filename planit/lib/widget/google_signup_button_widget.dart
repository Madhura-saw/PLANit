import 'package:authentication/fpg.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:authentication/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: OutlinedButton.icon(
          label: Text(
            'Sign In With Google',
            style: TextStyle(fontSize: 20, color: Colors.blue.shade900),
          ),
          style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            elevation: 2.0,
            shadowColor: Colors.white,
            side: BorderSide(width: 2, color: Colors.black),
            textStyle: TextStyle(
              color: Colors.black,
            ),
          ),
          icon: FaIcon(FontAwesomeIcons.google, color: Colors.redAccent),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
            // Navigator.push(context, MaterialPageRoute(builder: (_) => FPage()));
          },
        ),
      );
}
