import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/job_bloc.dart';
import '../bloc/job_event.dart';
import '../bloc/job_state.dart';

import '../services/job_service.dart';
import 'package:belajar/screens/detail_job.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) =>
            JobBloc(jobService: JobService())..add(FetchJobs()),
        child: DashboardPage(),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            AuthSection(),
            SearchSection(),
            ProductSection(),
            NavSection(),
          ],
        ),
      ),
    );
  }
}

class AuthSection extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            width: 500,
            height: 220,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff003366),
                    Color(0xff003355),
                  ]),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset('assets/images/Ellipse 202.png'),
                Spacer(),
                Text("Hi, Hamzah",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 20,
                      color: Colors.white,
                    )),
                Spacer(),
                Image.asset('assets/images/chat.png'),
                Image.asset('assets/images/Bell_pin.png'),
              ]),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    labelText: "Cari dan Temukan Pekerjaanmu",
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    filled: true,
                    fillColor: Color(0xffd7defb),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              const SizedBox(
                height: 15,
              ),
              Text("Pekerjaan Terpopuler",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20,
                    color: Colors.white,
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 500,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: BlocBuilder<JobBloc, JobState>(builder: (context, state) {
        if (state is JobLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is JobsLoaded) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.jobs.length,
              itemBuilder: (context, index) {
                final job = state.jobs[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                        padding: const EdgeInsets.all(5.0),
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                JobService.imgUrl + '/' + job.image,
                                fit: BoxFit.fill,
                                height: 120,
                                width: 200,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(job.nama,
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 14,
                                    color: Colors.blue,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text(job.deskripsi,
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 11,
                                    color: Colors.blue,
                                  )),
                            ],
                          ),
                        )),
                  ),
                );
              });
        } else if (state is JobError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('Tidak ada data'));
        }
      }),
    );
  }
}

class ProductSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: [
      Container(
        margin: EdgeInsets.only(left: 10),
        height: 350,
        width: 500,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const SizedBox(
              height: 30,
            ),
            Text("Hasil Pencarian",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 20,
                  color: Colors.blue,
                )),
          ]),
          Container(
            child: SingleChildScrollView(
              child: BlocBuilder<JobBloc, JobState>(builder: (context, state) {
                if (state is JobLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is JobsLoaded) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.jobs.length,
                      itemBuilder: (context, index) {
                        final job = state.jobs[index];

                        return Padding(
                            padding: const EdgeInsets.all(8),
                            child: InkWell(
                                child: Container(
                                    width: 500,
                                    height: 140,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 1.0),
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child: Center(
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Image.network(
                                            JobService.imgUrl + '/' + job.image,
                                            fit: BoxFit.fill,
                                            height: 100,
                                            width: 150,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                Text("Pekerjaan",
                                                    style: TextStyle(
                                                      fontFamily: "Roboto",
                                                      fontSize: 14,
                                                      color: Colors.blue,
                                                    )),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Text(job.nama,
                                                    style: TextStyle(
                                                      fontFamily: "Roboto",
                                                      fontSize: 14,
                                                      color: Colors.blue,
                                                    )),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Container(
                                                    child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
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
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Text("Review 105",
                                                    style: TextStyle(
                                                      fontFamily: "Roboto",
                                                      fontSize: 14,
                                                      color: Colors.blue,
                                                    )),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xff003366),
                                                    fixedSize:
                                                        const Size(100, 49),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                      builder: (context) {
                                                        return JobDetail(
                                                          jobId: job.id,
                                                        );
                                                      },
                                                    ));
                                                  },
                                                  child: Text(
                                                    "Detail Kerjaan",
                                                    style: TextStyle(
                                                      fontFamily: "Roboto",
                                                      fontSize: 12,
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                    ),
                                                  ),
                                                ),
                                              ])),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Image.asset(
                                            "assets/images/Favorite.png",
                                          ),
                                        ])))));
                      });
                } else if (state is JobError) {
                  return Center(child: Text(state.message));
                } else {
                  return Center(child: Text('Tidak ada data'));
                }
              }),
            ),
          )
        ]),
      )
    ]));
  }
}

class NavSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 500,
        child: NavigationBar(
          backgroundColor: Color(0xff003366),
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "Home"),
            NavigationDestination(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                label: "Favorite"),
            NavigationDestination(
                icon: Icon(
                  Icons.percent,
                  color: Colors.white,
                ),
                label: "Others"),
            NavigationDestination(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: "My Profile"),
          ],
        ));
  }
}
