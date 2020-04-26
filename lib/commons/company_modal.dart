import 'package:flutter/material.dart';
import 'package:pinjollist/model/company.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyModal extends StatelessWidget {
  final Company company;
  CompanyModal({this.company});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(15.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    company.registration,
                  ),
                  Text(
                    company.platformName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      company.companyName,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    "${company.registrationType} di Otoritas Jasa Keuangan",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "alamat : ${company.alamat.isNotEmpty ? company.alamat.replaceAll(r'\n', '\n') : 'alamat tidak ditemukan'}",
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () async {
                      if (await canLaunch(company.website)) {
                        await launch(company.website);
                      } else {
                        throw 'Could not launch ${company.website}';
                      }
                    },
                    child: Text(
                      'Visit Website',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
