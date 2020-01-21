import 'package:flutter/material.dart';
import 'package:pinjollist/bloc/companies_bloc.dart';
import 'package:pinjollist/detail_screen.dart';
import 'package:pinjollist/model/companies.dart';

class CompaniesWidget extends StatefulWidget {
  @override
  _CompaniesWidgetState createState() => _CompaniesWidgetState();
}

class _CompaniesWidgetState extends State<CompaniesWidget> {
  TextEditingController editingController = TextEditingController();
  List<Companies> searchResult = [];
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    bloc.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CompaniesResponse>(
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<CompaniesResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.status == "error") {
            throw Exception("API Error");
          }
          return _buildCompaniesWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Loading data from API..."), CircularProgressIndicator()],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildListCompanies(List<Companies> data){
    return Expanded(
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailScreen(data[index])),
                  );
                },
                title: Text("${data[index].companyName} (${data[index].platformName})"),
              );
            }));
  }
  Widget _buildCompaniesWidget(CompaniesResponse data) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                isSearch = true;
              });
              filterSearchResults(value, data.data);
            },
            controller: editingController,
            decoration: InputDecoration(
                labelText: "Cari",
                hintText: "Masukan Nama Aplikasi (Kredit Hiu)",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        isSearch ?  _buildListCompanies(searchResult) : _buildListCompanies(data.data)
      ],
    );
  }

  void filterSearchResults(String query, List<Companies> listCompanies) async {

    searchResult = [];

    if (query.isEmpty || query == "") {
      setState(() {
        isSearch = false;
      });
    } else {
      setState(() {
        listCompanies.forEach((data) {
          if (data.companyName.toLowerCase().contains(query.toLowerCase()) || data.platformName.toLowerCase().contains(query.toLowerCase())){
            searchResult.add(data);
          }
        });
      });
    }
  }
}
