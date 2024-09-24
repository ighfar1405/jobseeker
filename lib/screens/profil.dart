import 'package:flutter/material.dart';
import 'package:belajar/screens/register.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        'assets/images/sky.png',
        width: 500,
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Container(
            width: 500,
            height: 150,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset('assets/images/Ellipse 202.png'),
                Spacer(),
                Image.asset('assets/images/chat.png'),
                Image.asset('assets/images/Bell_pin.png'),
              ]),
            ])),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 300,
          height: 150,
          margin: EdgeInsets.only(left: 50, bottom: 500, right: 50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff003366),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 2, blurRadius: 10)
              ]),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 300,
          height: 150,
          margin: EdgeInsets.only(left: 50, bottom: 500, right: 50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff003366),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 2, blurRadius: 10)
              ]),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(left: 100, top: 100, right: 100),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff003366),
              image:
                  DecorationImage(image: AssetImage('assets/images/El.png'))),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.35,
          decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              TextButton(
                //  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xffd7defb),
                  fixedSize: const Size(205, 49),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Register();
                    },
                  ));
                },
                child: Text(
                  "Buat Akun",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Sudah Memiliki Akun ?",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      )
    ]));
  }
}
