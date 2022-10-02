import 'package:apiexample/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetail extends StatefulWidget {
  var apiData = ApiData();
  UserDetail({Key? key, required this.apiData}) : super(key: key);

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {

  Future launchGoogleMap(dynamic latitude, dynamic longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    final Uri uri = Uri(scheme: 'https', host: googleUrl);
    if(!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch';
          
    }
  }
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
            mainAxisAlignment: MainAxisAlignment.center,
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
                      SizedBox(
                        height: 38,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: HeadingText("Name"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DetailText(widget.apiData.name),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: HeadingText("Username"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DetailText(widget.apiData.username),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: HeadingText('Email Address'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DetailText(
                              widget.apiData.email,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: HeadingText("City"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DetailText(
                              widget.apiData.address!.city,
                            ),
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

  }


class DetailText extends StatelessWidget {
  DetailText(this.text);
  String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: GoogleFonts.sourceSansPro(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800]),
    );
  }
}

class HeadingText extends StatelessWidget {
  HeadingText(this.header);
  String header;

  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: GoogleFonts.sourceSansPro(
          fontSize: 21, fontWeight: FontWeight.bold, color: Colors.grey[900]),
    );
  }
}
