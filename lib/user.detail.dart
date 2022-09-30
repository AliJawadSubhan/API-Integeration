import 'package:apiexample/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetail extends StatefulWidget {
  var apiData = ApiData();
  UserDetail({Key? key, required this.apiData}) : super(key: key);

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.grey[300],
        title: Center(
          child: Text(
            "Employee details",
            style: GoogleFonts.sourceSansPro(
                color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  width: size.width * 0.95,
                  height: size.height * 0.8,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Info..",
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                      Column(
                        children: [
                          userDetail("Name"),
                          minorDetail(widget.apiData.name),
                          userDetail("Username"),
                          minorDetail(widget.apiData.username),
                          userDetail('Email Address'),
                          minorDetail(
                            widget.apiData.email,
                          ),
                          userDetail("City and Street Name"),
                          Row(
                            children: [
                              minorDetail(
                                widget.apiData.address!.city,
                              ),
                              Text(","),
                              minorDetail(
                                widget.apiData.address!.street,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text userDetail(header) {
    return Text(
      header,
      style: GoogleFonts.sourceSansPro(
          fontSize: 36, fontWeight: FontWeight.bold, color: Colors.grey[900]),
    );
  }
}

Text minorDetail(text) {
  return Text(
    text,
    style: GoogleFonts.sourceSansPro(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800]),
  );
}
