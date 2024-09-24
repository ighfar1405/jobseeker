import 'package:flutter/material.dart';
import 'package:belajar/screens/register.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset('assets/images/skyscraper2.png'),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.666,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 37, 67),
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
