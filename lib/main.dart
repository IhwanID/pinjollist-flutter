import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController editingController = TextEditingController();
  var listCompany = List<String>();

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async{
    Response response = await Dio().get("https://pinjollist.now.sh/api/companies");
    for(var company in response.data["data"]){
      print(company);
      listCompany.add(company["company_name"]);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pinjollist by Commonlabs ID"),),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
            itemCount: listCompany.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(listCompany[index]),
                  );
                })
            ),
          ],
        ),
      ),
    );
  }

  void filterSearchResults(String query) async{
    List<String> searchList = List<String>();
    searchList.addAll(listCompany);
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      searchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        listCompany.clear();
        listCompany.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        listCompany.clear();
        initData();
      });
    }
  }
}

