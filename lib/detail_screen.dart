import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';
import 'package:pinjollist/model/companies.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen(this.company);
  final Companies company;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  LottieController controller;
  StreamController<double> progressStream;

  _DetailScreenState() {
    progressStream = StreamController<double>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0,),
        body: Container(
      decoration: BoxDecoration(color: Colors.blue),
      child: Center(
          child: MergeSemantics(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.company.registration,
                            style: TextStyle(
                                fontSize: 16.0),
                          ),
                          Text(
                            widget.company.platformName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 48.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.company.companyName,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          Container(
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: LottieView.fromFile(
                                filePath: "animations/check.json",
                                autoPlay: true,
                                loop: false,
                                reverse: false,
                                onViewCreated: onViewCreatedFile,
                              ),
                            ),
                          ),
                          Text(
                              "${widget.company.registrationType} di Otoritas Jasa Keuangan", style: TextStyle(fontWeight: FontWeight.bold),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "alamat : \n${widget.company.alamat.isNotEmpty ? widget.company.alamat.replaceAll(r'\n', '\n') : '-'}",
                                style: TextStyle(

                                    fontSize: 16.0)),
                          ),
                          RaisedButton(
                            color: Colors.blue,
                            onPressed: () async {
                              if (await canLaunch(widget.company.website)) {
                                await launch(widget.company.website);
                              } else {
                                throw 'Could not launch ${widget.company.website}';
                              }
                            },
                            child: Text(widget.company.website),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    ));
  }

  void onViewCreatedFile(LottieController controller) {
    this.controller = controller;
    progressStream.stream.listen((double progress) {
      this.controller.setAnimationProgress(progress);
    });
  }

  void dispose() {
    super.dispose();
    progressStream.close();
  }
}
