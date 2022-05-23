import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ispy/pages/signinPage.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {_navigatetoLogin();});
  }

  void _navigatetoLogin(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (BuildContext context) => const SignInWidget()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "./lib/assets/rooftop-logo.png",
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Text(
                  "iSPY by Mihir",
                  style: GoogleFonts.comfortaa().copyWith(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
