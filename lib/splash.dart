import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in_button/sign_in_button.dart';

import 'dash.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/splash2.png",
                      height: 269,
                      width: 269,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 49,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Let’s begin",style: GoogleFonts.poppins(
                        // textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Color(0xff494949)
                      ),),
                    ),
                    SizedBox(height: 24,),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        maxLines:2,
                        "Login with your google account to continue \njourney to world of Electronics gadgets ",style: GoogleFonts.poppins(
                        // textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 14,
                        color: Color(0xff494949),
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),),
                    ),
                    SizedBox(height: 100,),
                    Container(
                      height: 45,

                      width: MediaQuery.of(context).size.width,
                      child: SignInButton(
                        Buttons.google,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DashBoard()),
                          );
                        },

                      ),
                    )
                  ],
                ),
              ),
            ),
            ),
        );
    }
}