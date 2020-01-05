import 'package:find_barcode_for_kim/scan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc.dart';

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  List<dynamic> barCodes = [];

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<Scan>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _textEditingController.clear();
            }),
        title: Text(
          "바코드 찾기",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                        hintText: "바코드 입력", border: InputBorder.none),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
              ),
              Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                elevation: 11.0,
                child: FlatButton(
                  onPressed: () {
                    bloc.clearList;
                    bloc.setList(_textEditingController.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScanPage()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "바코드 스캔 / 검색",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
