import 'package:apiexample/search.dart';
import 'package:apiexample/user.detail.dart';
import 'package:flutter/material.dart';
import 'services.dart';
import 'package:google_fonts/google_fonts.dart';

var apiUrl = "https://jsonplaceholder.typicode.com/users";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController filter = TextEditingController();
  String search = '';
  List? filterdNames;
  List? names;


  void getName() {}

  void searchpressed() {

  }


   buildList () {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchUser());
              },
              icon: Icon(
                Icons.search,
                color: Colors.grey[900],
              ))
        ],
        backgroundColor: Colors.grey[300],
        title: Center(
          child: Text(
            "Employees",
            style: GoogleFonts.sourceSansPro(
                color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: FutureBuilder(
        future: getUser(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[500]!,
                            offset: Offset(4, 4),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 73,
                                child: Image.asset("images/profile.png"),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data[index].name,
                                      style: GoogleFonts.sourceSansPro(
                                          color: Colors.grey[900],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      snapshot.data[index].email,
                                      style: GoogleFonts.sourceSansPro(
                                          color: Colors.grey[900],
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserDetail(
                                                        apiData: snapshot
                                                            .data[index],
                                                      )));
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          color: Colors.grey[900],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
