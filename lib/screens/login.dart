//import 'package:belajar/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../bloc/user_state.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Register> {
  get socialIcon => null;
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _deskripsiAkunController =
      TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmationpasswordController =
      TextEditingController();
  String _photoPath = '';

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _photoPath = pickedFile.path;
      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
            create: (context) => RegistrationBloc(),
            child: Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                    child: Container(
                        child:
                            BlocListener<RegistrationBloc, RegistrationState>(
                                listener: (context, state) {
                  if (state.isSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('register sukses')),
                    );
                  } else if (state.isFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('register gagal')),
                    );
                  }
                }, child: BlocBuilder<RegistrationBloc, RegistrationState>(
                                    builder: (context, state) {
                  if (state.isSubmitting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Login",
                          style:
                              TextStyle(color: Color(0xff5a5cb1), fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Nama",
                          style:
                              TextStyle(color: Color(0xff5a5cb1), fontSize: 20),
                        ),
                        TextField(
                          onChanged: (nama) => context
                              .read<RegistrationBloc>()
                              .add(NamaChanged(nama)),
                          controller: _namaController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              filled: true,
                              fillColor: Color(0xffd7defb),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Email",
                          style:
                              TextStyle(color: Color(0xff5a5cb1), fontSize: 20),
                        ),
                        TextField(
                          controller: _emailController,
                          onChanged: (email) => context
                              .read<RegistrationBloc>()
                              .add(EmailChanged(email)),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              filled: true,
                              fillColor: Color(0xffd7defb),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "No. Handphone",
                          style:
                              TextStyle(color: Color(0xff5a5cb1), fontSize: 20),
                        ),
                        TextField(
                          onChanged: (NoHp) => context
                              .read<RegistrationBloc>()
                              .add(NoHpChanged(NoHp)),
                          controller: _noHpController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              filled: true,
                              fillColor: Color(0xffd7defb),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Password",
                          style:
                              TextStyle(color: Color(0xff5a5cb1), fontSize: 20),
                        ),
                        TextField(
                          onChanged: (password) => context
                              .read<RegistrationBloc>()
                              .add(PasswordChanged(password)),
                          controller: _passwordController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              filled: true,
                              fillColor: Color(0xffd7defb),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: SafeArea(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(0xff003366),
                                      fixedSize: const Size(205, 49),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: () {
                                      BlocProvider.of<RegistrationBloc>(context)
                                          .add(SubmitRegistration());
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Tab(
                                        height: 50,
                                        icon: Image.asset(
                                            "assets/images/sm (1).png"),
                                      ),
                                      Tab(
                                          height: 50,
                                          icon: Image.asset(
                                              "assets/images/sm (2).png")),
                                    ],
                                  )
                                ]),
                          ),
                        )
                      ],
                    ),
                  );
                })))))));
  }
}
