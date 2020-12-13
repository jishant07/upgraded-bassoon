import 'package:flutter/material.dart';
import 'package:mcc_practice/database.dart';


class DatabaseDisplayPage extends StatefulWidget {
  @override
  _DatabaseDisplayPageState createState() => _DatabaseDisplayPageState();
}

class _DatabaseDisplayPageState extends State<DatabaseDisplayPage> {

  var userData;
  @override
  void initState() {
    super.initState();
    DBProvider.db.newData("Jishant Acharya", "22");
    DBProvider.db.newData("New User", "22");
    DBProvider.db.listData().then((value){
      this.setState(() {
        userData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database Display Page"),
      ),
      body: ListView.builder(itemCount: userData.length,itemBuilder: (BuildContext context,int index){
        return Card(
          child: Row(
            children: [
              Expanded(flex: 1,child: Center(child: Text(userData[index]["name"]))),
              Expanded(flex: 1,child: Center(child: Text(userData[index]["age"]))),
            ],
          ),
        );
      })
    );
  }
}
