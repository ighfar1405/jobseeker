import 'package:belajar/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/job_bloc.dart';
import '../bloc/job_event.dart';
import '../bloc/job_state.dart';

import '../services/job_service.dart';

class JobDetail extends StatelessWidget {
  final int jobId;

  const JobDetail({Key? key, required this.jobId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
            create: (context) =>
                JobBloc(jobService: JobService())..add(FetchJobDetail(jobId)),
            child: Scaffold(
                body: Stack(children: [
              Container(
                height: 900,
                width: 500,
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff003366),
                        Color(0xff003355),
                      ]),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        const SizedBox(
                          height: 85,
                        ),
                        TextButton(
                          //  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                          style: TextButton.styleFrom(
                            fixedSize: const Size(20, 15),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return Dashboard();
                              },
                            ));
                          },
                          child: Text(
                            ">",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 27,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text("Hi, Hamzah",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 20,
                              color: Colors.white,
                            )),
                      ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: BlocBuilder<JobBloc, JobState>(
                          builder: (context, state) {
                            if (state is JobLoading) {
                              return Center(child: CircularProgressIndicator());
                            } else if (state is JobLoaded) {
                              final job = state.job;
                              return Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      JobService.imgUrl + '/' + job.image,
                                      fit: BoxFit.fill,
                                      height: 200,
                                      width: 500,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Image.asset(
                                            "assets/images/Star.png",
                                          ),
                                          Image.asset(
                                            "assets/images/Star.png",
                                          ),
                                          Image.asset(
                                            "assets/images/Star.png",
                                          ),
                                        ])),
                                    SizedBox(height: 8),
                                    Text('Deskripsi Pekerjaan',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        )),
                                    SizedBox(height: 8),
                                    Text(job.deskripsi,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        )),
                                    Text('Alamat',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        )),
                                    SizedBox(height: 8),
                                    Text(job.alamat,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        )),
                                    SizedBox(height: 8),
                                    Text('Range Upah',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        )),
                                    SizedBox(height: 8),
                                    Text(job.rangeUpah,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              );
                            } else if (state is JobError) {
                              return Center(
                                  child: Text('Error: ${state.message}'));
                            } else {
                              return Center(
                                  child: Text('Something went wrong!'));
                            }
                          },
                        ),
                      ),
                    ]),
              ),
              Center(
                  child: SafeArea(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                    SizedBox(
                      height: 600,
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
                            return Dashboard();
                          },
                        ));
                      },
                      child: Text(
                        "Apply",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    NavigationBar(
                      backgroundColor: Color(0xffd7defb),
                      destinations: const [
                        NavigationDestination(
                            icon: Icon(
                              Icons.home,
                              color: Colors.blue,
                            ),
                            label: "Home"),
                        NavigationDestination(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.blue,
                            ),
                            label: "Favorite"),
                        NavigationDestination(
                            icon: Icon(
                              Icons.percent,
                              color: Colors.blue,
                            ),
                            label: "Others"),
                        NavigationDestination(
                            icon: Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                            label: "My Profile"),
                      ],
                    )
                  ]))),
            ]))));
  }
}
