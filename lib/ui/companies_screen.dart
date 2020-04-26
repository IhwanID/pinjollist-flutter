import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinjollist/bloc/bloc.dart';
import 'package:pinjollist/commons/company_modal.dart';
import 'package:pinjollist/commons/loading.dart';
import 'package:pinjollist/model/company.dart';

class CompaniesScreen extends StatefulWidget {
  @override
  _CompaniesScreenState createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  TextEditingController editingController = TextEditingController();
  List<Company> searchResult = [];
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CompanyBloc>(context).add(FetchCompanies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Pinjollist by Commonlabs ID"),
      ),
      body: BlocBuilder<CompanyBloc, CompanyState>(
        builder: (context, state) {
          if (state is CompanyInitial) {
            return Loading(msg: "Please Wait . . .");
          } else if (state is CompanyLoadInProgress) {
            return Loading(msg: "Fetching Data . . .");
          } else if (state is CompanyLoadSuccess) {
            return _buildCompaniesWidget(state.companies.data);
          } else if (state is CompanyLoadFailure) {
            return _buildErrorWidget();
          } else {
            return Loading(msg: "Loading");
          }
        },
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured!"),
      ],
    ));
  }

  Widget _buildListCompanies(List<Company> data) {
    return Expanded(
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              Company company = data[index];
              return ListTile(
                title: Text("${company.companyName} (${company.platformName})"),
                onTap: () {
                  showModalBottomSheet(
                      context: (context),
                      builder: (context) {
                        return CompanyModal(
                          company: data[index],
                        );
                      });
                },
              );
            }));
  }

  Widget _buildCompaniesWidget(List<Company> companies) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                isSearch = true;
              });
              filterSearchResults(value, companies);
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
        isSearch
            ? _buildListCompanies(searchResult)
            : _buildListCompanies(companies)
      ],
    );
  }

  void filterSearchResults(String query, List<Company> listCompanies) async {
    searchResult = [];

    if (query.isEmpty || query == "") {
      setState(() {
        isSearch = false;
      });
    } else {
      setState(() {
        listCompanies.forEach((data) {
          if (data.companyName.toLowerCase().contains(query.toLowerCase()) ||
              data.platformName.toLowerCase().contains(query.toLowerCase())) {
            searchResult.add(data);
          }
        });
      });
    }
  }
}
