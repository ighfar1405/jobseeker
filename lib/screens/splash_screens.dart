import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:belajar/screens/profil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Profil(),
          ),
          (route) => false);
    });
    return Scaffold(
        body: Stack(children: [
      Image.asset('assets/images/skyscraper.png'),
      Center(
          child: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 330,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xff003366),
              fixedSize: const Size(205, 49),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Get Started",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ]),
      ))
    ]));
  }
}
