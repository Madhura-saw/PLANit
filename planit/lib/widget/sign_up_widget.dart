import 'package:flutter/material.dart';
import 'package:authentication/widget/google_signup_button_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        fit: StackFit.expand,
        children: [
          buildSignUp(),
        ],
      ),
    );
  }

  Widget buildSignUp() => Column(
        children: [
          Container(
            width: 500,
            child: Image.asset('assets/images/logo2.jpeg'),
          ),
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: 300,
                      child: Text(
                        'Welcome to ',
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          color: Colors.teal.shade400,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: 200,
                      child: GradientText(
                        'PlanIT',
                        style: const TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        colors: [
                          Colors.teal,
                          Colors.tealAccent.shade400,
                        ],
                      ),
                    )
                  ],
                ),
                // Container(
                //   // decoration: BoxDecoration(
                //   //   border: Border.all(color: Colors.black, width: 1),
                //   // ),
                //   height: 100,
                //   // width: 105,
                //   child: Image.asset(
                //     "assets/images/logo.png",
                //     fit: BoxFit.cover,
                //   ),
                // )
              ],
            ),
          ),
          SizedBox(height: 65,),
          GoogleSignupButtonWidget(),
          SizedBox(height: 12),
          Text(
            'Login to continue',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Spacer(),
        ],
      );
}
